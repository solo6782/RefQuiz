-- ============================================================
-- RefQuiz — Questions Loi 16 (Le coup de pied de but)
-- Source : CFA/DA — Section "Lois du Jeu" — Questions/Réponses — Juillet 2025
-- Format : questions ouvertes (évaluées par IA), réponses = corrigé officiel.
-- ============================================================

ALTER TABLE public.rq_questions ADD COLUMN IF NOT EXISTS source TEXT;

INSERT INTO public.rq_questions (category_id, type, question, expected_answer, explanation, difficulty, source)
VALUES
-- §1 Entrée d'un remplaçant sans autorisation
((SELECT id FROM public.rq_categories WHERE law_number='Loi 16'), 'open',
 'Lors d''un coup de pied de but, après le botté, le ballon est renvoyé en arrière par un vent violent. À ce moment-là, un remplaçant qui se trouvait hors du terrain à proximité du but pénètre et, en voulant dégager, détourne le ballon dans son propre but. Décisions ?',
 'But accordé. Avertissement au remplaçant pour être entré sans autorisation ; l''arbitre doit lui faire quitter le terrain. Coup d''envoi.',
 NULL, 2, 'CFA/DA Juillet 2025'),

-- §2 Exécution
((SELECT id FROM public.rq_categories WHERE law_number='Loi 16'), 'open',
 'Coup de pied de but pour l''équipe A. Un joueur de cette équipe botte le ballon. Aucun autre joueur ne l''a touché lorsqu''une rafale de vent violent le rabat dans la surface de but où le joueur était resté. Celui-ci tente de l''arrêter de la main, le touche, mais ne peut l''empêcher de pénétrer dans le but. Décisions ?',
 'Si le joueur est le gardien de but : but refusé, pas d''avertissement, coup franc indirect pour l''équipe B sur la ligne de la surface de but parallèle à la ligne de but, au point le plus proche d''où le gardien a touché une seconde fois le ballon. Si le joueur n''est pas le gardien de but : but refusé, avertissement au joueur pour comportement antisportif, penalty pour l''équipe B.',
 NULL, 3, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 16'), 'open',
 'Lors d''un coup de pied de but au profit de l''équipe défendante, le joueur qui a exécuté la remise en jeu touche le ballon une seconde fois consécutivement (le ballon était en jeu au moment du second contact). Le défenseur le perd aussitôt au profit d''un attaquant adverse qui tire et marque. Décisions et explications ?',
 'Si le jeu n''a pas été arrêté pour sanctionner le second contact, et puisque le ballon avait été mis en jeu normalement avant ce second contact : appliquer la règle de l''avantage et accorder le but, reprise par le coup d''envoi. Toutefois, si lors du botté du coup de pied de but l''attaquant se trouvait dans la surface de réparation, le coup de pied de but est à retirer.',
 NULL, 3, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 16'), 'open',
 'Un défenseur de l''équipe A, dans sa surface de réparation, joue rapidement un coup de pied de but alors qu''un adversaire se trouve encore dans ladite surface et n''interfère pas avec le jeu. Sur la remise en jeu complètement ratée, le ballon franchit la ligne de la surface de réparation et arrive dans les pieds d''un autre attaquant situé tout près. Décisions ?',
 'Laisser jouer.',
 NULL, 2, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 16'), 'open',
 'Lors de l''exécution d''un coup de pied de but, le ballon est joué par un défenseur n°5A lorsqu''un adversaire l''intercepte dans la surface de réparation et marque un but contre l''équipe A. Décisions ?',
 'Si l''attaquant n''était pas dans la surface de réparation au moment où le ballon a été botté : but accordé, coup d''envoi. Si l''attaquant n''a pas eu le temps de sortir de la surface avant le botté et n''a pas gêné l''exécution : but accordé, coup d''envoi. Si l''attaquant est resté ou entré dans la surface de réparation avant le botté : but refusé, coup de pied de but à refaire.',
 NULL, 3, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 16'), 'open',
 'Coup de pied de but pour l''équipe A. Le gardien de but lève le ballon vers un partenaire situé sur le terrain (dans ou hors de sa surface de réparation) qui le lui renvoie de la tête. Décisions ?',
 'Le gardien contourne volontairement la Loi : arrêt du jeu, avertissement au gardien de but pour comportement antisportif, coup franc indirect pour l''équipe B à l''endroit où le gardien a initié la stratégie, sous réserve de la procédure de la Loi 13.',
 NULL, 3, 'CFA/DA Juillet 2025');
