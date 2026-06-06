-- RefQuiz : ré-import verbatim Loi 2 depuis CFA/DA Juillet 2025
-- Source : cfa-da-qr-loi-2-juillet-2025.pdf
-- 3 questions (IDs 13-15)
-- À exécuter dans le SQL Editor de Supabase

BEGIN;

UPDATE public.rq_questions SET
  question = 'Lors d’une rencontre "senior" au cours de laquelle les ballons multiples sont utilisés, sur une action de jeu, le ballon va dans les tribunes. Un ramasseur de balle lance immédiatement un ballon. Le jeu reprend. Après 2 minutes de jeu, un but est marqué. Le gardien vient aussitôt faire constater à l’arbitre que le ballon est de taille 4. Décisions et explications ?',
  expected_answer = '• But refusé.
• Le ballon n’est pas conforme à la catégorie d’âge.
• Remplacement du ballon non-conforme par un nouveau ballon.
   o Si le but a été marqué lors d’une action de jeu : balle à terre donnée au gardien de but.
   o Si le but a été marqué directement sur une remise en jeu : la remise en jeu est à recommencer.'
WHERE id = 13;

UPDATE public.rq_questions SET
  question = 'Un attaquant frappe en direction du but et le ballon est renvoyé par le montant, dans le terrain, puis éclate. Décisions ? Précisions sur la reprise du jeu.',
  expected_answer = '• Arrêt du jeu.
• Remplacement du ballon défectueux par un nouveau ballon.
• Le ballon éclate dans la surface de réparation : dans tous les cas, balle à terre donnée au gardien de but.
• Le ballon éclate hors de la surface de réparation :
   o Balle à terre donnée à un joueur de l’équipe qui a ou aurait clairement récupéré la possession, à l’endroit où le jeu a été arrêté.
   o S’il y a une incertitude sur l’équipe qui allait avoir le ballon, la balle à terre donnée à un joueur de l’équipe qui a touché le ballon pour la dernière fois, à l’endroit où le jeu a été arrêté.'
WHERE id = 14;

UPDATE public.rq_questions SET
  question = 'Le ballon est botté, touche le montant de but, éclate et pénètre dans le but. Décisions ?',
  expected_answer = '• But refusé.
• Remplacement du ballon défectueux par un nouveau ballon.
• Balle à terre donnée au gardien de but.'
WHERE id = 15;

SELECT COUNT(*) AS questions_loi_2_updated
FROM public.rq_questions q JOIN public.rq_categories c ON c.id = q.category_id
WHERE c.law_number = 'Loi 2';

COMMIT;
