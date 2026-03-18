# RefQuiz ⚽

Application de quiz pour arbitres de football — Préparation aux tests JAF.

## Stack

- **Frontend** : React + Vite
- **Hosting** : Cloudflare Pages
- **Base de données** : Supabase (Auth + Postgres + Storage)
- **IA** : Claude Haiku 4.5 API (évaluation des réponses libres)

## Déploiement

### 1. Supabase

1. Aller dans **SQL Editor** et exécuter le contenu de `supabase-schema.sql`
2. Aller dans **Storage** → créer un bucket nommé `documents` (privé)
3. Dans **Authentication** → **Settings** → désactiver la confirmation email si souhaité

### 2. Cloudflare Pages

1. Connecter le repo GitHub `solo6782/RefQuiz`
2. Build command : `npm run build`
3. Build output : `dist`
4. Variable d'environnement (Production) : `ANTHROPIC_API_KEY`

## Admin

Le compte `solo6782@gmail.com` est automatiquement admin.
