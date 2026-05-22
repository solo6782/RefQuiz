-- ============================================================
-- RefQuiz — Script d'installation (mutualisé dans le projet "Perso")
-- Toutes les tables/fonctions/policies sont préfixées rq_ pour
-- une isolation TOTALE des autres apps du projet (mv_, rt_).
-- AUCUNE suppression d'objet existant. AUCUN trigger global.
-- À exécuter une seule fois dans le SQL Editor de Supabase.
-- ============================================================

-- ============================================================
-- 1. TABLES
-- ============================================================

CREATE TABLE IF NOT EXISTS public.rq_profiles (
  id UUID REFERENCES auth.users(id) ON DELETE CASCADE PRIMARY KEY,
  email TEXT NOT NULL,
  display_name TEXT NOT NULL,
  role TEXT NOT NULL DEFAULT 'user' CHECK (role IN ('admin', 'user')),
  plan TEXT NOT NULL DEFAULT 'free',
  created_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS public.rq_categories (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  description TEXT,
  law_number TEXT,
  sort_order INT DEFAULT 0
);

CREATE TABLE IF NOT EXISTS public.rq_documents (
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  category TEXT DEFAULT 'Autre' CHECK (category IN ('LOTG', 'Formation', 'Test', 'Autre')),
  description TEXT,
  storage_path TEXT NOT NULL,
  file_size INT,
  uploaded_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS public.rq_questions (
  id SERIAL PRIMARY KEY,
  category_id INT REFERENCES public.rq_categories(id) ON DELETE SET NULL,
  type TEXT NOT NULL DEFAULT 'open' CHECK (type IN ('qcm', 'true_false', 'open')),
  question TEXT NOT NULL,
  choices JSONB,
  correct_index INT,
  expected_answer TEXT,
  explanation TEXT,
  difficulty INT DEFAULT 1 CHECK (difficulty BETWEEN 1 AND 3),
  source TEXT,
  source_document_id INT REFERENCES public.rq_documents(id) ON DELETE SET NULL,
  is_active BOOLEAN DEFAULT TRUE,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS public.rq_quiz_sessions (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  user_id UUID REFERENCES public.rq_profiles(id) ON DELETE CASCADE NOT NULL,
  category_id INT REFERENCES public.rq_categories(id) ON DELETE SET NULL,
  total_questions INT NOT NULL,
  score NUMERIC(5,2) DEFAULT 0,
  completed BOOLEAN DEFAULT FALSE,
  started_at TIMESTAMPTZ DEFAULT NOW(),
  completed_at TIMESTAMPTZ
);

CREATE TABLE IF NOT EXISTS public.rq_quiz_answers (
  id SERIAL PRIMARY KEY,
  session_id UUID REFERENCES public.rq_quiz_sessions(id) ON DELETE CASCADE NOT NULL,
  question_id INT REFERENCES public.rq_questions(id) ON DELETE CASCADE NOT NULL,
  user_answer TEXT,
  is_correct BOOLEAN,
  ai_score NUMERIC(3,2),
  ai_feedback TEXT,
  answered_at TIMESTAMPTZ DEFAULT NOW()
);

-- ============================================================
-- 2. FONCTION is_admin (préfixée, SECURITY DEFINER)
--    Évite la récursion dans les policies RLS.
-- ============================================================

CREATE OR REPLACE FUNCTION public.rq_is_admin()
RETURNS BOOLEAN AS $$
  SELECT EXISTS (
    SELECT 1 FROM public.rq_profiles
    WHERE id = auth.uid() AND role = 'admin'
  );
$$ LANGUAGE sql SECURITY DEFINER STABLE;

-- ============================================================
-- 3. ROW LEVEL SECURITY
-- ============================================================

ALTER TABLE public.rq_profiles      ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.rq_categories    ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.rq_questions     ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.rq_quiz_sessions ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.rq_quiz_answers  ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.rq_documents     ENABLE ROW LEVEL SECURITY;

-- PROFILES : chacun voit/édite le sien ; l'appli crée le sien au login
DROP POLICY IF EXISTS "rq_profiles_select" ON public.rq_profiles;
CREATE POLICY "rq_profiles_select" ON public.rq_profiles
  FOR SELECT USING (auth.uid() = id OR public.rq_is_admin());
DROP POLICY IF EXISTS "rq_profiles_update" ON public.rq_profiles;
CREATE POLICY "rq_profiles_update" ON public.rq_profiles
  FOR UPDATE USING (auth.uid() = id OR public.rq_is_admin());
DROP POLICY IF EXISTS "rq_profiles_insert" ON public.rq_profiles;
CREATE POLICY "rq_profiles_insert" ON public.rq_profiles
  FOR INSERT WITH CHECK (auth.uid() = id);

-- CATEGORIES : lecture publique (connectés), admin gère
DROP POLICY IF EXISTS "rq_categories_select" ON public.rq_categories;
CREATE POLICY "rq_categories_select" ON public.rq_categories
  FOR SELECT USING (TRUE);
DROP POLICY IF EXISTS "rq_categories_insert" ON public.rq_categories;
CREATE POLICY "rq_categories_insert" ON public.rq_categories
  FOR INSERT WITH CHECK (public.rq_is_admin());
DROP POLICY IF EXISTS "rq_categories_update" ON public.rq_categories;
CREATE POLICY "rq_categories_update" ON public.rq_categories
  FOR UPDATE USING (public.rq_is_admin());
DROP POLICY IF EXISTS "rq_categories_delete" ON public.rq_categories;
CREATE POLICY "rq_categories_delete" ON public.rq_categories
  FOR DELETE USING (public.rq_is_admin());

-- QUESTIONS : lecture des actives, admin gère tout
DROP POLICY IF EXISTS "rq_questions_select" ON public.rq_questions;
CREATE POLICY "rq_questions_select" ON public.rq_questions
  FOR SELECT USING (is_active = TRUE OR public.rq_is_admin());
DROP POLICY IF EXISTS "rq_questions_insert" ON public.rq_questions;
CREATE POLICY "rq_questions_insert" ON public.rq_questions
  FOR INSERT WITH CHECK (public.rq_is_admin());
DROP POLICY IF EXISTS "rq_questions_update" ON public.rq_questions;
CREATE POLICY "rq_questions_update" ON public.rq_questions
  FOR UPDATE USING (public.rq_is_admin());
DROP POLICY IF EXISTS "rq_questions_delete" ON public.rq_questions;
CREATE POLICY "rq_questions_delete" ON public.rq_questions
  FOR DELETE USING (public.rq_is_admin());

-- QUIZ SESSIONS
DROP POLICY IF EXISTS "rq_sessions_select" ON public.rq_quiz_sessions;
CREATE POLICY "rq_sessions_select" ON public.rq_quiz_sessions
  FOR SELECT USING (user_id = auth.uid() OR public.rq_is_admin());
DROP POLICY IF EXISTS "rq_sessions_insert" ON public.rq_quiz_sessions;
CREATE POLICY "rq_sessions_insert" ON public.rq_quiz_sessions
  FOR INSERT WITH CHECK (user_id = auth.uid());
DROP POLICY IF EXISTS "rq_sessions_update" ON public.rq_quiz_sessions;
CREATE POLICY "rq_sessions_update" ON public.rq_quiz_sessions
  FOR UPDATE USING (user_id = auth.uid());

-- QUIZ ANSWERS
DROP POLICY IF EXISTS "rq_answers_select" ON public.rq_quiz_answers;
CREATE POLICY "rq_answers_select" ON public.rq_quiz_answers
  FOR SELECT USING (
    EXISTS (SELECT 1 FROM public.rq_quiz_sessions WHERE id = session_id AND user_id = auth.uid())
    OR public.rq_is_admin()
  );
DROP POLICY IF EXISTS "rq_answers_insert" ON public.rq_quiz_answers;
CREATE POLICY "rq_answers_insert" ON public.rq_quiz_answers
  FOR INSERT WITH CHECK (
    EXISTS (SELECT 1 FROM public.rq_quiz_sessions WHERE id = session_id AND user_id = auth.uid())
  );

-- DOCUMENTS : lecture publique (connectés), admin gère
DROP POLICY IF EXISTS "rq_documents_select" ON public.rq_documents;
CREATE POLICY "rq_documents_select" ON public.rq_documents
  FOR SELECT USING (TRUE);
DROP POLICY IF EXISTS "rq_documents_insert" ON public.rq_documents;
CREATE POLICY "rq_documents_insert" ON public.rq_documents
  FOR INSERT WITH CHECK (public.rq_is_admin());
DROP POLICY IF EXISTS "rq_documents_update" ON public.rq_documents;
CREATE POLICY "rq_documents_update" ON public.rq_documents
  FOR UPDATE USING (public.rq_is_admin());
DROP POLICY IF EXISTS "rq_documents_delete" ON public.rq_documents;
CREATE POLICY "rq_documents_delete" ON public.rq_documents
  FOR DELETE USING (public.rq_is_admin());

-- ============================================================
-- 4. CATÉGORIES PAR DÉFAUT (Lois du Jeu 1 à 17)
-- ============================================================

INSERT INTO public.rq_categories (name, law_number, description, sort_order) VALUES
  ('Le terrain de jeu', 'Loi 1', 'Dimensions, marquages, buts, surface technique', 1),
  ('Le ballon', 'Loi 2', 'Caractéristiques, remplacement', 2),
  ('Les joueurs', 'Loi 3', 'Nombre, remplacements, officiels d''équipe', 3),
  ('L''équipement des joueurs', 'Loi 4', 'Équipement de base, autres équipements', 4),
  ('L''arbitre', 'Loi 5', 'Pouvoirs et devoirs, avantage, blessures', 5),
  ('Les autres officiels de match', 'Loi 6', 'Arbitres assistants, 4e arbitre, VAR', 6),
  ('La durée du match', 'Loi 7', 'Périodes de jeu, temps additionnel, prolongation', 7),
  ('Le coup d''envoi et reprise du jeu', 'Loi 8', 'Procédure, infractions', 8),
  ('Ballon en jeu et hors du jeu', 'Loi 9', 'Ballon hors du jeu, ballon en jeu', 9),
  ('Issue d''un match', 'Loi 10', 'But marqué, équipe gagnante, tirs au but', 10),
  ('Le hors-jeu', 'Loi 11', 'Position, infraction, pas d''infraction', 11),
  ('Fautes et comportement antisportif', 'Loi 12', 'Faute directe, indirecte, cartons', 12),
  ('Les coups francs', 'Loi 13', 'Direct, indirect, procédure, mur', 13),
  ('Le coup de pied de réparation', 'Loi 14', 'Procédure, infractions', 14),
  ('La rentrée de touche', 'Loi 15', 'Procédure, infractions', 15),
  ('Le coup de pied de but', 'Loi 16', 'Procédure, infractions', 16),
  ('Le coup de pied de coin', 'Loi 17', 'Procédure, infractions', 17)
ON CONFLICT DO NOTHING;

-- ============================================================
-- 5. STORAGE
-- ============================================================
-- À créer manuellement dans Dashboard > Storage :
--   Nom du bucket : rq_documents   (privé)
-- (Les policies Storage se gèrent dans l'onglet Storage > Policies.)

-- ============================================================
-- 6. À EXÉCUTER *APRÈS* TA PREMIÈRE CONNEXION GOOGLE DANS L'APPLI
--    (le profil est créé au login ; ces lignes te promeuvent admin)
-- ============================================================
-- UPDATE public.rq_profiles SET role='admin', plan='admin' WHERE email='solo6782@gmail.com';
-- UPDATE public.rq_profiles SET plan='premium' WHERE email='monteiro.loic@lgef.fr';
