-- ============================================================
-- RefQuiz — Questions Loi 9 (Ballon en jeu et hors du jeu)
-- Source : CFA/DA — Section "Lois du Jeu" — Questions/Réponses — Juillet 2025
-- Format : questions ouvertes (évaluées par IA), réponses = corrigé officiel.
-- ============================================================

ALTER TABLE public.rq_questions ADD COLUMN IF NOT EXISTS source TEXT;

INSERT INTO public.rq_questions (category_id, type, question, expected_answer, explanation, difficulty, source)
VALUES
((SELECT id FROM public.rq_categories WHERE law_number='Loi 9'), 'open',
 'Lors d''une attaque de B, le n°8B veut donner le ballon à son partenaire n°7B mais le ballon heurte l''arbitre assistant. Décisions selon les cas ?',
 'Contact hors du terrain : rentrée de touche pour l''équipe A. Contact sur le terrain ou sur la ligne de touche : si le ballon sort du terrain → rentrée de touche pour A ; s''il reste sur le terrain et entraîne une attaque prometteuse pour B → arrêt du jeu, balle à terre donnée à un joueur de B à l''endroit de l''arrêt ; s''il reste sur le terrain sans attaque prometteuse pour B → laisser jouer ; s''il reste sur le terrain et est récupéré par A → arrêt du jeu, balle à terre donnée à un joueur de A à l''endroit de l''arrêt.',
 NULL, 3, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 9'), 'open',
 'Depuis sa surface, le gardien de A relance le ballon à la main ; celui-ci touche le dos de l''arbitre hors de la surface avant de retomber dans les pieds d''un adversaire. Décisions et explications ?',
 'Arrêt du jeu. Selon la Loi 9, le ballon est hors du jeu lorsqu''il touche l''arbitre et qu''il est récupéré par l''équipe adverse : il est donc devenu hors du jeu au moment du contact avec l''arbitre. Balle à terre donnée à un joueur de l''équipe A à l''endroit où le jeu a été arrêté.',
 NULL, 2, 'CFA/DA Juillet 2025')
;
