-- ============================================================
-- RefQuiz — Questions Loi 17 (Le coup de pied de coin / corner)
-- Source : CFA/DA — Section "Lois du Jeu" — Questions/Réponses — Juillet 2025
-- Format : questions ouvertes (évaluées par IA), réponses = corrigé officiel.
-- ============================================================

ALTER TABLE public.rq_questions ADD COLUMN IF NOT EXISTS source TEXT;

INSERT INTO public.rq_questions (category_id, type, question, expected_answer, explanation, difficulty, source)
VALUES
-- §1 Cas particuliers
((SELECT id FROM public.rq_categories WHERE law_number='Loi 17'), 'open',
 'Lors de l''exécution d''un corner, le tireur, en jouant le ballon du pied droit, casse le poteau de corner. Après avoir rebondi sur son pied gauche, le ballon reste sur le terrain. Décisions ?',
 'Arrêt du jeu. Réparation ou remplacement du poteau de corner. Coup franc indirect pour l''équipe adverse à l''endroit où le botteur a touché deux fois consécutivement le ballon.',
 NULL, 3, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 17'), 'open',
 'À cause du vent, le poteau de corner flexible empêche l''exécution du corner. Le botteur décide de le retirer. Décisions ?',
 'Il n''est pas possible de retirer le poteau de corner. Un partenaire peut le tenir le temps de l''exécution.',
 NULL, 2, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 17'), 'open',
 'Corner pour l''équipe A. L''arbitre donne le signal et le tir est exécuté. Le joueur n°9A entre alors dans la zone délimitée par les filets en passant derrière le gardien de but, puis revient sur le terrain. Surpris, le gardien de but n''a pas bougé. Le joueur n°9A, à 2 mètres du but, détourne de la tête le ballon qui pénètre dans le but. Décisions ?',
 'L''arbitre doit évaluer le comportement de l''attaquant. Sortie naturelle du terrain pour éviter les mouvements du gardien de but : but accordé, coup d''envoi. Sortie tactique pour interférer sur le comportement du gardien de but : but refusé, avertissement au joueur n°9A pour comportement antisportif, coup franc direct pour l''équipe B en un point quelconque de la surface de but.',
 NULL, 3, 'CFA/DA Juillet 2025');
