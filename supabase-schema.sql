-- ============================================
-- RefQuiz - Schéma Supabase
-- À exécuter dans le SQL Editor de Supabase
-- ============================================

-- 1. Table profiles (extension de auth.users)
CREATE TABLE public.profiles (
  id UUID REFERENCES auth.users(id) ON DELETE CASCADE PRIMARY KEY,
  email TEXT NOT NULL,
  display_name TEXT NOT NULL,
  role TEXT NOT NULL DEFAULT 'user' CHECK (role IN ('admin', 'user')),
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- 2. Table categories (lois du jeu / thèmes)
CREATE TABLE public.categories (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  description TEXT,
  law_number TEXT, -- ex: "Loi 11" pour Hors-jeu
  sort_order INT DEFAULT 0
);

-- 3. Table questions
CREATE TABLE public.questions (
  id SERIAL PRIMARY KEY,
  category_id INT REFERENCES public.categories(id) ON DELETE SET NULL,
  type TEXT NOT NULL DEFAULT 'open' CHECK (type IN ('qcm', 'true_false', 'open')),
  question TEXT NOT NULL,
  -- Pour QCM : JSON array des choix, ex: ["choix A", "choix B", "choix C", "choix D"]
  choices JSONB,
  -- Pour QCM : index de la bonne réponse (0-based). Pour true_false : 0=faux, 1=vrai
  correct_index INT,
  -- Pour open : la réponse attendue complète (utilisée par l'IA pour évaluer)
  expected_answer TEXT,
  -- Explication affichée après réponse
  explanation TEXT,
  difficulty INT DEFAULT 1 CHECK (difficulty BETWEEN 1 AND 3), -- 1=facile, 2=moyen, 3=difficile
  source_document_id INT, -- référence optionnelle vers un document
  is_active BOOLEAN DEFAULT TRUE,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- 4. Table quiz_sessions
CREATE TABLE public.quiz_sessions (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  user_id UUID REFERENCES public.profiles(id) ON DELETE CASCADE NOT NULL,
  category_id INT REFERENCES public.categories(id) ON DELETE SET NULL, -- NULL = toutes catégories
  total_questions INT NOT NULL,
  score NUMERIC(5,2) DEFAULT 0, -- score en pourcentage
  completed BOOLEAN DEFAULT FALSE,
  started_at TIMESTAMPTZ DEFAULT NOW(),
  completed_at TIMESTAMPTZ
);

-- 5. Table quiz_answers (détail par réponse)
CREATE TABLE public.quiz_answers (
  id SERIAL PRIMARY KEY,
  session_id UUID REFERENCES public.quiz_sessions(id) ON DELETE CASCADE NOT NULL,
  question_id INT REFERENCES public.questions(id) ON DELETE CASCADE NOT NULL,
  user_answer TEXT, -- la réponse brute de l'utilisateur
  is_correct BOOLEAN,
  ai_score NUMERIC(3,2), -- score IA entre 0 et 1 (pour open questions)
  ai_feedback TEXT, -- feedback de l'IA
  answered_at TIMESTAMPTZ DEFAULT NOW()
);

-- 6. Table documents (ressources PDF)
CREATE TABLE public.documents (
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  category TEXT DEFAULT 'Autre' CHECK (category IN ('LOTG', 'Formation', 'Test', 'Autre')),
  description TEXT,
  storage_path TEXT NOT NULL, -- chemin dans le bucket Supabase Storage
  file_size INT, -- taille en bytes
  uploaded_at TIMESTAMPTZ DEFAULT NOW()
);

-- Ajouter la référence FK sur questions.source_document_id
ALTER TABLE public.questions 
  ADD CONSTRAINT fk_questions_document 
  FOREIGN KEY (source_document_id) REFERENCES public.documents(id) ON DELETE SET NULL;

-- ============================================
-- Row Level Security (RLS)
-- ============================================

ALTER TABLE public.profiles ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.categories ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.questions ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.quiz_sessions ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.quiz_answers ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.documents ENABLE ROW LEVEL SECURITY;

-- Profiles : chacun voit son profil, admin voit tout
CREATE POLICY "Users can view own profile" ON public.profiles
  FOR SELECT USING (auth.uid() = id);
CREATE POLICY "Users can update own profile" ON public.profiles
  FOR UPDATE USING (auth.uid() = id);
CREATE POLICY "Admin can view all profiles" ON public.profiles
  FOR SELECT USING (
    EXISTS (SELECT 1 FROM public.profiles WHERE id = auth.uid() AND role = 'admin')
  );

-- Categories : tout le monde peut lire
CREATE POLICY "Anyone can read categories" ON public.categories
  FOR SELECT USING (TRUE);
CREATE POLICY "Admin can manage categories" ON public.categories
  FOR ALL USING (
    EXISTS (SELECT 1 FROM public.profiles WHERE id = auth.uid() AND role = 'admin')
  );

-- Questions : tout le monde peut lire les actives, admin gère tout
CREATE POLICY "Anyone can read active questions" ON public.questions
  FOR SELECT USING (is_active = TRUE);
CREATE POLICY "Admin can read all questions" ON public.questions
  FOR SELECT USING (
    EXISTS (SELECT 1 FROM public.profiles WHERE id = auth.uid() AND role = 'admin')
  );
CREATE POLICY "Admin can manage questions" ON public.questions
  FOR ALL USING (
    EXISTS (SELECT 1 FROM public.profiles WHERE id = auth.uid() AND role = 'admin')
  );

-- Quiz sessions : chacun voit les siennes, admin voit tout
CREATE POLICY "Users can view own sessions" ON public.quiz_sessions
  FOR SELECT USING (user_id = auth.uid());
CREATE POLICY "Users can insert own sessions" ON public.quiz_sessions
  FOR INSERT WITH CHECK (user_id = auth.uid());
CREATE POLICY "Users can update own sessions" ON public.quiz_sessions
  FOR UPDATE USING (user_id = auth.uid());
CREATE POLICY "Admin can view all sessions" ON public.quiz_sessions
  FOR SELECT USING (
    EXISTS (SELECT 1 FROM public.profiles WHERE id = auth.uid() AND role = 'admin')
  );

-- Quiz answers : chacun voit les siennes
CREATE POLICY "Users can view own answers" ON public.quiz_answers
  FOR SELECT USING (
    EXISTS (SELECT 1 FROM public.quiz_sessions WHERE id = session_id AND user_id = auth.uid())
  );
CREATE POLICY "Users can insert own answers" ON public.quiz_answers
  FOR INSERT WITH CHECK (
    EXISTS (SELECT 1 FROM public.quiz_sessions WHERE id = session_id AND user_id = auth.uid())
  );
CREATE POLICY "Admin can view all answers" ON public.quiz_answers
  FOR SELECT USING (
    EXISTS (SELECT 1 FROM public.profiles WHERE id = auth.uid() AND role = 'admin')
  );

-- Documents : tout le monde peut lire, admin gère
CREATE POLICY "Anyone can read documents" ON public.documents
  FOR SELECT USING (TRUE);
CREATE POLICY "Admin can manage documents" ON public.documents
  FOR ALL USING (
    EXISTS (SELECT 1 FROM public.profiles WHERE id = auth.uid() AND role = 'admin')
  );

-- ============================================
-- Trigger : créer un profil auto à l'inscription
-- ============================================

CREATE OR REPLACE FUNCTION public.handle_new_user()
RETURNS TRIGGER AS $$
BEGIN
  INSERT INTO public.profiles (id, email, display_name, role)
  VALUES (
    NEW.id,
    NEW.email,
    COALESCE(NEW.raw_user_meta_data->>'display_name', split_part(NEW.email, '@', 1)),
    CASE WHEN NEW.email = 'solo6782@gmail.com' THEN 'admin' ELSE 'user' END
  );
  RETURN NEW;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

CREATE TRIGGER on_auth_user_created
  AFTER INSERT ON auth.users
  FOR EACH ROW EXECUTE FUNCTION public.handle_new_user();

-- ============================================
-- Catégories par défaut (Lois du Jeu)
-- ============================================

INSERT INTO public.categories (name, law_number, description, sort_order) VALUES
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
  ('Le coup de pied de coin', 'Loi 17', 'Procédure, infractions', 17);

-- ============================================
-- Storage bucket pour les documents
-- ============================================
-- À créer manuellement dans Supabase Dashboard > Storage :
-- Nom du bucket : "documents"
-- Public : Non (on servira via des signed URLs)
