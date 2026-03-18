-- ============================================
-- FIX : RLS policies - résoudre la récursion
-- À exécuter dans le SQL Editor de Supabase
-- ============================================

-- 1. Créer une fonction SECURITY DEFINER pour vérifier le rôle admin
-- (évite la récursion dans les policies RLS)
CREATE OR REPLACE FUNCTION public.is_admin()
RETURNS BOOLEAN AS $$
  SELECT EXISTS (
    SELECT 1 FROM public.profiles
    WHERE id = auth.uid() AND role = 'admin'
  );
$$ LANGUAGE sql SECURITY DEFINER STABLE;

-- 2. Supprimer TOUTES les anciennes policies
DO $$
DECLARE
  r RECORD;
BEGIN
  FOR r IN (
    SELECT schemaname, tablename, policyname
    FROM pg_policies
    WHERE schemaname = 'public'
  ) LOOP
    EXECUTE format('DROP POLICY IF EXISTS %I ON %I.%I', r.policyname, r.schemaname, r.tablename);
  END LOOP;
END $$;

-- 3. Recréer les policies proprement

-- PROFILES
CREATE POLICY "profiles_select" ON public.profiles
  FOR SELECT USING (auth.uid() = id OR public.is_admin());
CREATE POLICY "profiles_update" ON public.profiles
  FOR UPDATE USING (auth.uid() = id);
CREATE POLICY "profiles_insert" ON public.profiles
  FOR INSERT WITH CHECK (TRUE);

-- CATEGORIES (tout le monde lit, admin gère)
CREATE POLICY "categories_select" ON public.categories
  FOR SELECT USING (TRUE);
CREATE POLICY "categories_insert" ON public.categories
  FOR INSERT WITH CHECK (public.is_admin());
CREATE POLICY "categories_update" ON public.categories
  FOR UPDATE USING (public.is_admin());
CREATE POLICY "categories_delete" ON public.categories
  FOR DELETE USING (public.is_admin());

-- QUESTIONS (tout le monde lit les actives, admin gère tout)
CREATE POLICY "questions_select" ON public.questions
  FOR SELECT USING (is_active = TRUE OR public.is_admin());
CREATE POLICY "questions_insert" ON public.questions
  FOR INSERT WITH CHECK (public.is_admin());
CREATE POLICY "questions_update" ON public.questions
  FOR UPDATE USING (public.is_admin());
CREATE POLICY "questions_delete" ON public.questions
  FOR DELETE USING (public.is_admin());

-- QUIZ SESSIONS
CREATE POLICY "sessions_select" ON public.quiz_sessions
  FOR SELECT USING (user_id = auth.uid() OR public.is_admin());
CREATE POLICY "sessions_insert" ON public.quiz_sessions
  FOR INSERT WITH CHECK (user_id = auth.uid());
CREATE POLICY "sessions_update" ON public.quiz_sessions
  FOR UPDATE USING (user_id = auth.uid());

-- QUIZ ANSWERS
CREATE POLICY "answers_select" ON public.quiz_answers
  FOR SELECT USING (
    EXISTS (SELECT 1 FROM public.quiz_sessions WHERE id = session_id AND user_id = auth.uid())
    OR public.is_admin()
  );
CREATE POLICY "answers_insert" ON public.quiz_answers
  FOR INSERT WITH CHECK (
    EXISTS (SELECT 1 FROM public.quiz_sessions WHERE id = session_id AND user_id = auth.uid())
  );

-- DOCUMENTS (tout le monde lit, admin gère)
CREATE POLICY "documents_select" ON public.documents
  FOR SELECT USING (TRUE);
CREATE POLICY "documents_insert" ON public.documents
  FOR INSERT WITH CHECK (public.is_admin());
CREATE POLICY "documents_update" ON public.documents
  FOR UPDATE USING (public.is_admin());
CREATE POLICY "documents_delete" ON public.documents
  FOR DELETE USING (public.is_admin());
