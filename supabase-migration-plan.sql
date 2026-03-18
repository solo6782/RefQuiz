-- ============================================
-- RefQuiz - Migration : ajout colonne plan
-- ============================================

-- Ajout de la colonne plan sur profiles
ALTER TABLE public.profiles ADD COLUMN IF NOT EXISTS plan TEXT DEFAULT 'free';

-- Admin = illimité
UPDATE public.profiles SET plan = 'admin' WHERE role = 'admin';

-- Loïc Monteiro = premium (illimité)
UPDATE public.profiles SET plan = 'premium' WHERE email = 'monteiro.loic@lgef.fr';

-- Mise à jour du trigger pour les nouveaux inscrits
CREATE OR REPLACE FUNCTION public.handle_new_user()
RETURNS TRIGGER AS $$
BEGIN
  INSERT INTO public.profiles (id, email, display_name, role, plan)
  VALUES (
    NEW.id,
    COALESCE(NEW.email, ''),
    COALESCE(
      NEW.raw_user_meta_data->>'display_name',
      NEW.raw_user_meta_data->>'full_name',
      NEW.raw_user_meta_data->>'name',
      split_part(COALESCE(NEW.email, ''), '@', 1)
    ),
    CASE WHEN NEW.email = 'solo6782@gmail.com' THEN 'admin' ELSE 'user' END,
    CASE 
      WHEN NEW.email = 'solo6782@gmail.com' THEN 'admin'
      WHEN NEW.email = 'monteiro.loic@lgef.fr' THEN 'premium'
      ELSE 'free'
    END
  );
  RETURN NEW;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;
