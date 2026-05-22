-- ============================================================
-- RefQuiz — Questions Loi 2 (Le ballon)
-- Source : CFA/DA — Section "Lois du Jeu" — Questions/Réponses — Juillet 2025
-- Format : questions ouvertes (évaluées par IA), réponses = corrigé officiel.
-- ============================================================

ALTER TABLE public.rq_questions ADD COLUMN IF NOT EXISTS source TEXT;

INSERT INTO public.rq_questions (category_id, type, question, expected_answer, explanation, difficulty, source)
VALUES
((SELECT id FROM public.rq_categories WHERE law_number='Loi 2'), 'open',
 'Rencontre senior avec ballons multiples. Sur une action de jeu, le ballon va dans les tribunes ; un ramasseur de balle lance immédiatement un ballon et le jeu reprend. Après 2 minutes, un but est marqué. Le gardien fait alors constater que le ballon est de taille 4. Décisions et explications ?',
 'But refusé (le ballon n''est pas conforme à la catégorie d''âge). Remplacement du ballon non conforme par un nouveau ballon. Si le but a été marqué lors d''une action de jeu : balle à terre donnée au gardien de but. Si le but a été marqué directement sur une remise en jeu : la remise en jeu est à recommencer.',
 NULL, 2, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 2'), 'open',
 'Un attaquant frappe en direction du but, le ballon est renvoyé par le montant dans le terrain, puis éclate. Décisions et précisions sur la reprise du jeu ?',
 'Arrêt du jeu. Remplacement du ballon défectueux par un nouveau ballon. Si le ballon éclate dans la surface de réparation : dans tous les cas, balle à terre donnée au gardien de but. Si le ballon éclate hors de la surface de réparation : balle à terre donnée à un joueur de l''équipe qui a ou aurait clairement récupéré la possession, à l''endroit où le jeu a été arrêté ; en cas d''incertitude sur l''équipe qui allait avoir le ballon, balle à terre donnée à un joueur de l''équipe qui a touché le ballon en dernier, à l''endroit où le jeu a été arrêté.',
 NULL, 2, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 2'), 'open',
 'Le ballon est botté, touche le montant de but, éclate et pénètre dans le but. Décisions ?',
 'But refusé. Remplacement du ballon défectueux par un nouveau ballon. Balle à terre donnée au gardien de but.',
 NULL, 1, 'CFA/DA Juillet 2025')
;
