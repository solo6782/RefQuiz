-- ============================================================
-- RefQuiz — Questions Loi 15 (La rentrée de touche)
-- Source : CFA/DA — Section "Lois du Jeu" — Questions/Réponses — Juillet 2025
-- Format : questions ouvertes (évaluées par IA), réponses = corrigé officiel.
-- ============================================================

ALTER TABLE public.rq_questions ADD COLUMN IF NOT EXISTS source TEXT;

INSERT INTO public.rq_questions (category_id, type, question, expected_answer, explanation, difficulty, source)
VALUES
-- §1 Ballon saisi par le gardien de but
((SELECT id FROM public.rq_categories WHERE law_number='Loi 15'), 'open',
 'Rentrée de touche effectuée régulièrement par l''équipe A, à l''intention de son gardien de but. Celui-ci, situé à l''extérieur de sa surface de réparation, contrôle le ballon du pied et le ramène dans sa surface puis s''en saisit des mains. Décisions ?',
 'Arrêt du jeu. Coup franc indirect à l''endroit où le gardien se saisit du ballon des mains, sous réserve de la procédure de la Loi 13.',
 NULL, 2, 'CFA/DA Juillet 2025'),

-- §2 Exécution de la rentrée de touche
((SELECT id FROM public.rq_categories WHERE law_number='Loi 15'), 'open',
 'Lors d''une rentrée de touche, le ballon rebondit à l''extérieur du terrain avant d''y pénétrer. Décisions ?',
 'Que la rentrée de touche soit régulière ou irrégulière : à refaire par la même équipe, au même endroit.',
 NULL, 2, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 15'), 'open',
 'Lors d''une rentrée de touche, le joueur lance le ballon en dehors du champ de jeu de façon : a) volontaire ; b) involontaire. Décisions ?',
 'a) Avertissement au joueur pour comportement antisportif ; rentrée de touche à refaire par la même équipe, au même endroit. b) Rentrée de touche à refaire par la même équipe.',
 NULL, 2, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 15'), 'open',
 'Doit-on considérer qu''il y a faute lorsqu''un joueur exécute une rentrée de touche à plus d''un mètre de la ligne de touche, ou doit-on la faire recommencer ?',
 'La rentrée de touche, effectuée régulièrement, est considérée comme valable. La distance entre le joueur qui l''exécute et la ligne de touche est laissée à l''appréciation de l''arbitre.',
 NULL, 1, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 15'), 'open',
 'Sur une rentrée de touche, un adversaire de celui qui fait la remise en jeu se place sur la ligne de touche ou près de celle-ci. Quelle doit être l''attitude de l''arbitre, voire de l''arbitre assistant ?',
 'Le joueur adverse doit se tenir à une distance d''au moins 2 mètres du point de la ligne de touche où doit être effectuée la rentrée. L''arbitre ou l''arbitre assistant doit faire respecter cette distance ; si le joueur n''obtempère pas, il reçoit un avertissement pour comportement antisportif.',
 NULL, 1, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 15'), 'open',
 'Sur une rentrée de touche pour l''équipe A, un adversaire reste à moins de 2 mètres de la ligne de touche et dévie le ballon de la tête derrière sa ligne de but, en dehors des montants. Décisions et explications ?',
 'Avertissement au joueur de l''équipe B pour comportement antisportif. L''arbitre choisira la reprise la plus avantageuse pour l''équipe A entre le coup franc indirect à l''endroit de la position du joueur B et le corner.',
 NULL, 3, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 15'), 'open',
 'Lors d''une rentrée de touche effectuée régulièrement, un joueur de l''équipe A envoie volontairement et violemment le ballon au visage d''un adversaire qui ne se situait pas à plus de 2 mètres du lieu de la remise en jeu. Décisions ?',
 'Dans tous les cas : arrêt du jeu, exclusion de l''exécutant pour acte de brutalité, rapport. Si l''adversaire n''était pas à distance en raison de l''action de jeu précédente (pas eu le temps de se reculer) : coup franc direct pour l''équipe B à l''endroit où se trouvait le joueur B qui reçoit le ballon. Si l''adversaire est venu volontairement se placer à moins de 2 mètres et que, avant l''intervention de l''arbitre, l''exécutant lui lance le ballon au visage : avertissement au joueur B pour comportement antisportif et coup franc indirect pour l''équipe A à l''endroit où se situait le joueur B.',
 NULL, 3, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 15'), 'open',
 'Une rentrée de touche est exécutée par un joueur de l''équipe A alors qu''un adversaire B n''est pas à distance. Décisions ?',
 'Si le joueur B gêne abusivement l''exécutant : rentrée régulière → arrêt du jeu, avertissement au joueur B pour comportement antisportif, coup franc indirect pour l''équipe A à l''endroit du joueur B ; rentrée irrégulière → arrêt du jeu, avertissement au joueur B, rentrée de touche à refaire par l''équipe A. Si le joueur B ne gêne pas abusivement : rentrée régulière → laisser jouer ; rentrée irrégulière → arrêt du jeu, touche à refaire par l''équipe B.',
 NULL, 3, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 15'), 'open',
 'Rentrée de touche. Le joueur chargé de remettre le ballon en jeu s''accroupit afin de donner le ballon dans les pieds de son coéquipier situé à un mètre du lieu de la remise en jeu. Décisions et explications ?',
 'Cette façon d''exécuter la rentrée de touche n''est pas permise par la Loi 15. L''arbitre la considère comme irrégulière et demande à l''équipe adverse de la refaire au même endroit.',
 NULL, 2, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 15'), 'open',
 'Le ballon sort en ligne de touche juste à côté du drapeau de coin. Le joueur qui effectue la remise en jeu, dans la précipitation, lance le ballon de façon correcte dans le terrain mais le ballon pénètre sur le terrain par la ligne de but et non par la ligne de touche. Décisions ?',
 'Rentrée de touche à refaire par la même équipe.',
 NULL, 2, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 15'), 'open',
 'Rentrée de touche : a) un joueur, pour gagner du temps, effectue la remise en jeu à plus de 2 mètres de la ligne de touche mais le ballon ne rentre pas en jeu ; b) un joueur n''a qu''un seul pied qui touche le sol et le ballon ne rentre pas sur le terrain. Décisions ?',
 'Lorsque le ballon ne rentre pas sur le terrain, la rentrée de touche est à refaire par l''équipe bénéficiaire. La distance de 2 mètres ne constitue pas un critère de validité (la distance entre l''exécutant et la ligne de touche est laissée à l''appréciation de l''arbitre). De même, si la rentrée est exécutée de manière irrégulière (un seul pied au sol) mais que le ballon ne rentre pas sur le terrain, il n''est pas en jeu : la rentrée est à refaire par la même équipe.',
 NULL, 2, 'CFA/DA Juillet 2025'),

-- §3 Questions diverses
((SELECT id FROM public.rq_categories WHERE law_number='Loi 15'), 'open',
 'Un joueur de l''équipe A a un différend avec un partenaire lors d''une rentrée de touche en sa faveur. Ce même joueur l''insulte et lui lance violemment le ballon au visage lors de l''exécution. Décisions ?',
 'Arrêt du jeu. Exclusion du joueur fautif pour acte de brutalité. Rapport. Si la victime se trouve sur le terrain : rentrée irrégulière → à refaire par l''équipe adverse ; rentrée régulière → coup franc direct pour l''équipe B à l''endroit où se trouvait la victime. Si la victime se trouve en dehors du terrain : rentrée de touche à refaire par la même équipe.',
 NULL, 3, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 15'), 'open',
 'Lors d''une rentrée de touche effectuée régulièrement, un joueur reste à moins de 2 mètres du lieu de la remise en jeu. Avant l''intervention de l''arbitre, la touche est exécutée et ce joueur dévie volontairement le ballon de la main. Décisions ?',
 'Sous réserve de l''avantage, arrêt du jeu. Premier avertissement au fautif pour comportement antisportif, second avertissement pour comportement antisportif (main), puis exclusion pour avoir reçu deux avertissements au cours de la même rencontre. Coup franc direct pour l''équipe adverse à l''endroit de la faute de main. Rapport.',
 NULL, 3, 'CFA/DA Juillet 2025');
