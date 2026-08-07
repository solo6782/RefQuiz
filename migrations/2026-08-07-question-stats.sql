-- ============================================================
-- RefQuiz — Compteur de questions posées par utilisateur
-- Objectif : servir en priorité les questions les moins vues.
-- ============================================================

-- 1. Table compteur
CREATE TABLE IF NOT EXISTS public.rq_question_stats (
  user_id UUID REFERENCES public.rq_profiles(id) ON DELETE CASCADE NOT NULL,
  question_id INT REFERENCES public.rq_questions(id) ON DELETE CASCADE NOT NULL,
  times_asked INT NOT NULL DEFAULT 0,
  last_asked_at TIMESTAMPTZ DEFAULT NOW(),
  PRIMARY KEY (user_id, question_id)
);

CREATE INDEX IF NOT EXISTS rq_question_stats_user_idx
  ON public.rq_question_stats (user_id, times_asked);

-- 2. RLS : chacun ne lit que ses propres compteurs
ALTER TABLE public.rq_question_stats ENABLE ROW LEVEL SECURITY;

DROP POLICY IF EXISTS "rq_question_stats_select" ON public.rq_question_stats;
CREATE POLICY "rq_question_stats_select" ON public.rq_question_stats
  FOR SELECT USING (user_id = auth.uid());

-- 3. Incrément (SECURITY DEFINER : l'écriture passe uniquement par ici)
CREATE OR REPLACE FUNCTION public.rq_bump_question_stats(p_question_ids INT[])
RETURNS VOID
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = public
AS $$
BEGIN
  IF auth.uid() IS NULL OR p_question_ids IS NULL THEN
    RETURN;
  END IF;

  INSERT INTO public.rq_question_stats (user_id, question_id, times_asked, last_asked_at)
  SELECT auth.uid(), qid, 1, NOW()
  FROM unnest(p_question_ids) AS qid
  ON CONFLICT (user_id, question_id) DO UPDATE
    SET times_asked = public.rq_question_stats.times_asked + 1,
        last_asked_at = NOW();
END;
$$;

GRANT EXECUTE ON FUNCTION public.rq_bump_question_stats(INT[]) TO authenticated;

-- 4. Backfill depuis l'historique déjà accumulé (rq_quiz_answers)
INSERT INTO public.rq_question_stats (user_id, question_id, times_asked, last_asked_at)
SELECT s.user_id, a.question_id, COUNT(*)::INT, MAX(a.answered_at)
FROM public.rq_quiz_answers a
JOIN public.rq_quiz_sessions s ON s.id = a.session_id
WHERE s.user_id IS NOT NULL
GROUP BY s.user_id, a.question_id
ON CONFLICT (user_id, question_id) DO UPDATE
  SET times_asked = EXCLUDED.times_asked,
      last_asked_at = EXCLUDED.last_asked_at;
