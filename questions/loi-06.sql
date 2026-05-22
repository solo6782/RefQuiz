-- ============================================================
-- RefQuiz — Questions Loi 6 (Les autres officiels de match)
-- Source : CFA/DA — Section "Lois du Jeu" — Questions/Réponses — Juillet 2025
-- Format : questions ouvertes (évaluées par IA), réponses = corrigé officiel.
-- ============================================================

ALTER TABLE public.rq_questions ADD COLUMN IF NOT EXISTS source TEXT;

INSERT INTO public.rq_questions (category_id, type, question, expected_answer, explanation, difficulty, source)
VALUES
((SELECT id FROM public.rq_categories WHERE law_number='Loi 6'), 'open',
 'L''arbitre assistant autorise, par erreur, un joueur sorti se faire soigner à pénétrer sur le terrain. Décisions ?',
 'Seul l''arbitre est habilité à autoriser un joueur blessé à revenir sur le terrain. L''autorisation ayant été donnée à tort par l''assistant : sous réserve de l''avantage, arrêt du jeu ; balle à terre, sous réserve de la procédure de la Loi 8.',
 NULL, 2, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 6'), 'open',
 'Un défenseur frappe un adversaire dans sa propre surface de réparation alors que le jeu se déroule près de l''autre but. L''assistant a vu la scène et le signale immédiatement au drapeau, mais l''arbitre ne le voit pas tout de suite et le ballon va en sortie de but avant qu''il ne remarque le signal. Décisions ?',
 'Exclusion du joueur fautif pour acte de brutalité. Penalty. Rapport.',
 NULL, 2, 'CFA/DA Juillet 2025')
;
