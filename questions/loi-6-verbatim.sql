-- RefQuiz : ré-import verbatim Loi 6 depuis CFA/DA Juillet 2025
-- Source : cfa-da-qr-loi-6-juillet-2025.pdf
-- 2 questions (IDs 150-151)
-- À exécuter dans le SQL Editor de Supabase

BEGIN;

-- §1 Interventions des arbitres assistants

UPDATE public.rq_questions SET
  question = 'L’arbitre assistant autorise, par erreur, un joueur sorti se faire soigner à pénétrer sur le terrain. Décisions ?',
  expected_answer = 'Seul l’arbitre est habilité à autoriser un joueur blessé à revenir sur le terrain. Cependant, compte tenu que cette autorisation a été donnée à tort par l’arbitre assistant, il convient de prendre la décision suivante :
• Sous réserve de l’avantage, arrêt du jeu.
• Balle à terre, sous réserve de la procédure de la Loi 8.'
WHERE id = 150;

UPDATE public.rq_questions SET
  question = 'Un défenseur frappe un adversaire dans sa propre surface de réparation alors que le jeu se déroule près de l’autre but. L’arbitre assistant a vu la scène et le signale immédiatement avec le drapeau. L’arbitre ne le voit pas tout de suite et le ballon va en sortie de but avant qu’il ne remarque le signal de son assistant. Décisions ?',
  expected_answer = '• Exclusion du joueur fautif pour acte de brutalité.
• Penalty.
• Rapport.'
WHERE id = 151;

SELECT COUNT(*) AS questions_loi_6_updated
FROM public.rq_questions q JOIN public.rq_categories c ON c.id = q.category_id
WHERE c.law_number = 'Loi 6';

COMMIT;
