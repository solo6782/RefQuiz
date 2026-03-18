-- Migration : support Google OAuth dans le trigger profile
-- À exécuter dans le SQL Editor de Supabase

CREATE OR REPLACE FUNCTION public.handle_new_user()
RETURNS TRIGGER AS $$
BEGIN
  INSERT INTO public.profiles (id, email, display_name, role)
  VALUES (
    NEW.id,
    COALESCE(NEW.email, ''),
    COALESCE(
      NEW.raw_user_meta_data->>'display_name',  -- inscription email
      NEW.raw_user_meta_data->>'full_name',      -- Google OAuth
      NEW.raw_user_meta_data->>'name',           -- fallback OAuth
      split_part(COALESCE(NEW.email, ''), '@', 1)  -- dernier recours
    ),
    CASE WHEN NEW.email = 'solo6782@gmail.com' THEN 'admin' ELSE 'user' END
  );
  RETURN NEW;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;
