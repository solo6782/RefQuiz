-- ============================================================
-- RefQuiz — Questions Loi 14 (Le coup de pied de réparation / penalty)
-- Source : CFA/DA — Section "Lois du Jeu" — Questions/Réponses — Juillet 2025
-- Format : questions ouvertes (évaluées par IA), réponses = corrigé officiel.
-- NB : la L14/§1/Q1 « Réservée » n'est pas insérée.
-- ============================================================

ALTER TABLE public.rq_questions ADD COLUMN IF NOT EXISTS source TEXT;

INSERT INTO public.rq_questions (category_id, type, question, expected_answer, explanation, difficulty, source)
VALUES
-- §1 Ballon en jeu et hors du jeu lors de l'exécution d'un penalty
((SELECT id FROM public.rq_categories WHERE law_number='Loi 14'), 'open',
 'Après le botté du joueur, à quel moment le penalty est-il considéré comme pleinement exécuté ?',
 'Le penalty est terminé lorsque : le ballon arrête de bouger ; il sort en dehors des limites du terrain ; ou l''arbitre arrête le jeu pour sanctionner une infraction aux Lois du Jeu.',
 NULL, 1, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 14'), 'open',
 'Penalty à l''issue du temps réglementaire. Le ballon est botté régulièrement et le gardien le dévie sur la barre transversale. Le ballon rebondit au sol 5 m devant la ligne de but puis, par un effet « rétro », pénètre dans le but. Décisions et explications ?',
 'But accordé. Fin de la période.',
 'L''IFAB précise que le penalty est terminé lorsque le ballon arrête de bouger ; tant qu''il bouge, l''action se poursuit.',
 2, 'CFA/DA Juillet 2025'),

-- §2 Ballon défectueux
((SELECT id FROM public.rq_categories WHERE law_number='Loi 14'), 'open',
 'Quelle doit être la reprise du jeu lorsque le ballon éclate lors de l''exécution d''un penalty ?',
 'Si le ballon devient défectueux sur le botté, ou après avoir été botté mais avant de toucher les poteaux, la barre ou le gardien et sans avoir franchi la ligne de but : arrêt du jeu, changement de ballon, penalty à recommencer (et si l''arbitre avait prolongé une période pour l''exécution, la période est de nouveau prolongée). Si le ballon devient défectueux après avoir touché les poteaux, la barre ou le gardien sans avoir franchi la ligne : arrêt du jeu, changement de ballon, balle à terre donnée au gardien de but (et fin de la période si elle avait été prolongée). Si le ballon éclate après avoir franchi la ligne de but : changement de ballon, but accordé (coup d''envoi) ou reprise consécutive à la sortie du ballon.',
 NULL, 3, 'CFA/DA Juillet 2025'),

-- §3 Faute commise par un adversaire du tireur
((SELECT id FROM public.rq_categories WHERE law_number='Loi 14'), 'open',
 'Penalty. Un défenseur, blessé, se fait soigner derrière la ligne de but. Le ballon, joué par le tireur, est en jeu normalement lorsque le blessé rentre sur le terrain et, d''un coup de pied, l''empêche de pénétrer dans le but. Décisions ?',
 'Arrêt du jeu. Exclusion du joueur fautif pour avoir empêché l''équipe adverse de marquer un but. Penalty à recommencer. Rapport.',
 NULL, 3, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 14'), 'open',
 'Lors de l''exécution d''un penalty, le gardien de but sautille latéralement sur sa ligne de but sans la quitter. Décisions et explications ?',
 'L''obligation pour le gardien de rester sur sa ligne est considérée comme respectée. Il doit obligatoirement faire face au tireur, entre les poteaux, avant que le tir ne soit effectué, et ne peut distraire abusivement le tireur (par exemple en retardant l''exécution ou en touchant les poteaux, la barre ou les filets). Si toutes ces conditions sont réunies, l''arbitre n''interviendra pas.',
 NULL, 2, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 14'), 'open',
 'Lors de l''exécution d''un penalty, le gardien de but s''avance avant que le ballon ne soit botté et le tir est exécuté. Décisions ?',
 'Si le ballon pénètre dans le but : but accordé, coup d''envoi. Si le ballon ne pénètre pas dans le but et que le gardien a au moins un pied sur ou derrière sa ligne : laisser jouer ou reprise consécutive à l''arrêt. Si le gardien n''a pas au moins un pied sur ou derrière sa ligne : sans influence sur le tireur (ballon hors du but ou sur un montant et/ou la barre), laisser jouer ou reprise consécutive à l''arrêt ; avec influence sur le tireur ou tir repoussé par le gardien, arrêt du jeu, mise en garde du gardien, penalty à refaire.',
 NULL, 3, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 14'), 'open',
 'À la 30e minute de match, lors de l''exécution d''un penalty, quelles décisions devra prendre l''arbitre si : a) le tireur use d''une feinte illégale entre le signal de l''arbitre et le botté ; b) le tireur et le gardien de but se rendent coupables en même temps d''une infraction ?',
 'Dans les deux cas : arrêt du jeu ou but refusé ; avertissement au tireur pour comportement antisportif ; coup franc indirect pour l''équipe défendante sur le point de penalty.',
 NULL, 3, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 14'), 'open',
 'Un défenseur, entre le signal et le botté, pénètre dans la surface de réparation ou s''approche à moins de 9,15 m du ballon (faute d''empiètement). Décisions ?',
 'But marqué : but accordé, coup d''envoi. Dans tous les autres cas : s''il y a incidence, penalty à recommencer ; s''il n''y a pas d''incidence, reprise consécutive à l''arrêt ou laisser jouer. N.B. : si penalty à la fin du temps réglementaire, mêmes réponses puis fin de la période ou du match.',
 NULL, 3, 'CFA/DA Juillet 2025'),

-- §4 Faute commise par un partenaire du tireur
((SELECT id FROM public.rq_categories WHERE law_number='Loi 14'), 'open',
 'Penalty. Le joueur devant tirer se présente à l''arbitre. Entre le coup de sifflet et le botté, un partenaire du tireur entre dans la surface de réparation et tire le penalty à sa place. Le ballon franchit la ligne de but en dehors des montants. Décisions ?',
 'Avertissement au botteur pour comportement antisportif. Coup franc indirect pour l''équipe adverse sur le point de penalty. N.B. : si penalty à la fin du temps réglementaire, fin de la période ou du match.',
 NULL, 3, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 14'), 'open',
 'Penalty durant le temps réglementaire. Un attaquant se place en dehors de la surface de réparation, entre la ligne de but et une ligne parallèle passant par le point de réparation. Le penalty est tiré régulièrement, le ballon est repoussé par le gardien sur ce joueur qui marque. Décisions et explications ?',
 'But refusé. Penalty à retirer.',
 'L''arbitre a donné à tort le signal d''exécution du penalty sans s''assurer que tous les joueurs avaient pris une position conforme à la Loi 14.',
 3, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 14'), 'open',
 'Lors de l''exécution d''un penalty, un attaquant autre que le botteur est situé hors de la surface de réparation, derrière le ballon. Après le coup de sifflet, il se porte en avant du ballon, se trouvant ainsi plus rapproché de la ligne de but que celui-ci au moment du botté. Le tir est effectué et le ballon est repoussé dans le terrain. Décisions ?',
 'Si cet attaquant joue ou dispute le ballon à un adversaire : arrêt du jeu, coup franc indirect pour l''équipe adverse à l''endroit de l''interférence, sous réserve de la procédure de la Loi 3. Sinon : laisser jouer.',
 NULL, 3, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 14'), 'open',
 'Un attaquant, autre que le botteur du penalty, entre le signal et le botté, pénètre dans la surface de réparation ou s''approche à moins de 9,15 m du ballon (faute d''empiètement). Décisions ?',
 'But marqué : s''il y a incidence, but refusé et penalty à recommencer ; sinon, but accordé, coup d''envoi. Dans tous les autres cas : s''il y a incidence, coup franc indirect pour l''équipe adverse à l''endroit de l''incidence (sous réserve de la procédure de la Loi 13) ; sinon, reprise consécutive à l''arrêt ou laisser jouer. N.B. : si penalty à la fin du temps réglementaire, but accordé le cas échéant et fin de la période ou du match ; sinon, fin de la période ou du match dans tous les cas.',
 NULL, 3, 'CFA/DA Juillet 2025'),

-- §5 Feinte légale ou illégale
((SELECT id FROM public.rq_categories WHERE law_number='Loi 14'), 'open',
 'Un joueur, bottant un penalty, feinte le gardien avant de tirer. Décisions ?',
 'Il est permis au tireur de réaliser une feinte lors de l''exécution d''un penalty. En revanche, la feinte est illégale lorsque, après avoir terminé sa course, juste avant de botter, le tireur fait semblant de botter pour attendre le plongeon du gardien et ne botte qu''ensuite : cela rompt la fluidité et le rythme du botté (la dernière foulée et le tir doivent former un mouvement fluide et unique). Dans ce cas, le tireur est averti pour comportement antisportif.',
 NULL, 2, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 14'), 'open',
 'La Loi 14 ne précise pas l''endroit de la remise en jeu lorsque le botteur commet une feinte illégale, que le but n''est pas marqué et après que l''arbitre a adressé un avertissement au botteur pour comportement antisportif. Où s''exécute la reprise ?',
 'Coup franc indirect pour l''équipe défendante à l''endroit où la faute a été commise, soit le point de penalty.',
 NULL, 2, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 14'), 'open',
 'Penalty. Le botteur commet une feinte illégale (arrêt de sa course et attente du plongeon du gardien) puis tire. Décisions ?',
 'Dans tous les cas : arrêt du jeu, avertissement au botteur pour comportement antisportif, coup franc indirect pour l''équipe défendante sur le point de penalty. N.B. : si penalty à la fin du temps réglementaire, fin de la période ou du match dans tous les cas.',
 NULL, 2, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 14'), 'open',
 'Lors de l''exécution d''un penalty, deux fautes sont commises en même temps (feinte illégale du botteur et une faute par un autre joueur). Décisions et explications ?',
 'En cas de fautes commises en même temps, la feinte illégale du botteur est considérée comme la plus grave. Dans tous les cas : arrêt du jeu ou but refusé, avertissement au botteur pour comportement antisportif, coup franc indirect pour l''équipe défendante sur le point de penalty. N.B. : si penalty à la fin du temps réglementaire, fin de la période ou du match dans tous les cas.',
 NULL, 3, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 14'), 'open',
 'Penalty. Le botteur de l''équipe A use d''une feinte illégale. Le ballon est repoussé par un montant et est repris par le botteur. Décisions et explications ?',
 'Arrêt du jeu. Avertissement au botteur pour comportement antisportif. Coup franc indirect pour l''équipe B sur le point de penalty. N.B. : si penalty à la fin du temps réglementaire, fin de la période ou du match dans tous les cas.',
 'S''agissant de deux fautes consécutives commises par la même équipe, la feinte illégale est à sanctionner avant la faute de « toucher deux fois consécutivement le ballon ».',
 3, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 14'), 'open',
 'Le joueur identifié, chargé du botté du penalty, s''élance et passe au-dessus du ballon sans le toucher. Dans le même temps, un de ses coéquipiers, régulièrement placé, le suit et effectue le tir à sa place. Décisions si : a) le but est marqué ; b) le ballon va en sortie de but ; c) le ballon est détourné en corner, en ligne de touche ou revient en jeu ?',
 'Si le but est marqué : but refusé. Avertissement aux deux joueurs pour comportement antisportif. Dans tous les cas : coup franc indirect pour l''équipe défendante sur le point de penalty. N.B. : si penalty à la fin du temps réglementaire, fin de la période ou du match dans tous les cas.',
 NULL, 3, 'CFA/DA Juillet 2025'),

-- §6 Personne supplémentaire sur le terrain
((SELECT id FROM public.rq_categories WHERE law_number='Loi 14'), 'open',
 'Un penalty est tiré tout à fait normalement par l''équipe B et le but est marqué. Un assistant fait observer à l''arbitre que, pendant l''exécution, un remplaçant qui s''échauffait a traversé une partie du terrain sans nuire à l''exécution, afin de regagner son banc dans la perspective d''un remplacement imminent. Décisions et explications ?',
 'Avertissement au remplaçant pour avoir pénétré délibérément sur le terrain sans l''autorisation de l''arbitre. Ce fait n''ayant eu aucune interférence sur l''exécution du penalty, le but est accordé dans tous les cas (que le remplaçant appartienne à l''équipe B qui botte ou à l''équipe A) ; coup d''envoi.',
 NULL, 3, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 14'), 'open',
 'Lors de l''exécution d''un penalty en cours de rencontre, un remplaçant A pénètre volontairement sur le terrain de jeu. Décisions ?',
 'Dans tous les cas : avertissement au remplaçant pour avoir pénétré délibérément sans autorisation, et l''arbitre lui fait quitter le terrain. S''il n''interfère pas : laisser l''exécution se dérouler. S''il interfère et qu''il est partenaire du tireur : but marqué → but refusé, coup franc direct pour l''équipe B à l''endroit où se trouvait le remplaçant lors de l''interférence (sous réserve de la procédure de la Loi 13) ; but non marqué → arrêt du jeu, coup franc direct pour l''équipe B au même endroit. S''il interfère et qu''il est adversaire du tireur : but marqué → but accordé, coup d''envoi ; but non marqué → arrêt du jeu, penalty à retirer.',
 NULL, 3, 'CFA/DA Juillet 2025'),

-- §7 Fautes de comportement
((SELECT id FROM public.rq_categories WHERE law_number='Loi 14'), 'open',
 'Lors d''un penalty, sans qu''aucune faute à la procédure d''exécution soit commise, le tireur botte le ballon qui parcourt 10 mètres en avant. À ce moment-là : a) un attaquant frappe un défenseur ; b) un défenseur frappe un attaquant. Décisions ?',
 'Dans les deux cas : exclusion du joueur fautif pour acte de brutalité ; rapport. a) Quel que soit le résultat du tir : coup franc direct pour l''équipe défendante à l''endroit de la faute. b) Sous réserve de l''avantage : coup franc direct pour l''équipe attaquante à l''endroit de la faute, ou penalty si l''attaquant était entré dans la surface de réparation au moment de la faute.',
 NULL, 3, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 14'), 'open',
 'Lors de l''exécution d''un penalty, entre le signal et le botté, un attaquant a un comportement antisportif ou brutal. Le but n''est pas marqué. Décisions et explications ?',
 'Arrêt du jeu. Sanction disciplinaire appropriée (avertissement pour comportement antisportif ou exclusion pour acte de brutalité). Coup franc indirect pour l''équipe défendante à l''endroit de la faute. Rapport en cas d''exclusion.',
 'IFAB : une fois le signal donné mais avant que le ballon soit en jeu, si un coéquipier enfreint les Lois du Jeu, l''arbitre interrompt le jeu et le fait reprendre par un coup franc indirect si le ballon ne pénètre pas dans le but.',
 3, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 14'), 'open',
 'Après le coup de sifflet donnant l''ordre d''exécution d''un penalty et avant le botté, un partenaire du tireur, placé irrégulièrement dans la surface de réparation, frappe un adversaire régulièrement placé. L''arbitre n''a pas le temps d''intervenir et laisse exécuter le penalty. Le ballon frappe le montant et revient en jeu. Décisions ?',
 'Arrêt du jeu. Exclusion du joueur fautif pour acte de brutalité. Coup franc indirect pour l''équipe défendante à l''endroit de la faute. Rapport.',
 NULL, 3, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 14'), 'open',
 'L''arbitre prolonge le match pour permettre l''exécution d''un penalty. Pendant que le botteur effectue son tir, un joueur de l''équipe défendante commet un comportement antisportif ou un acte de brutalité. Le ballon va directement au fond des filets. Décisions et explications ?',
 'But accordé. Sanction disciplinaire appropriée (avertissement pour comportement antisportif ou exclusion pour acte de brutalité). Fin du match. Rapport en cas d''exclusion.',
 NULL, 3, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 14'), 'open',
 'La partie est prolongée pour l''exécution d''un penalty en faveur de l''équipe A. Après le coup de sifflet et après le botté, pendant la trajectoire du ballon, un défenseur de l''équipe B régulièrement placé jette une pierre sur le tireur. Le ballon sort en ligne de but en dehors des montants. Décisions et explications ?',
 'Exclusion du défenseur de l''équipe B pour acte de brutalité. Le but n''ayant pas été marqué et le tireur étant situé dans la surface de réparation, l''arbitre sanctionne l''équipe fautive d''un nouveau penalty et prolonge à nouveau la partie pour en permettre l''exécution. Rapport.',
 NULL, 3, 'CFA/DA Juillet 2025'),

-- §8 Questions diverses
((SELECT id FROM public.rq_categories WHERE law_number='Loi 14'), 'open',
 'Penalty à la fin du temps réglementaire. Le tireur frappe le ballon de telle manière qu''il roule lentement vers l''avant. Un partenaire, régulièrement placé, pénètre dans la surface de réparation, reprend le ballon et marque. Décisions ?',
 'But refusé. Match arrêté définitivement dès que le partenaire touche le ballon.',
 NULL, 2, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 14'), 'open',
 'Penalty. Le joueur botte avant le signal de l''arbitre. Décisions ?',
 'Dans tous les cas, le penalty est à recommencer.',
 NULL, 1, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 14'), 'open',
 'Lors d''un penalty, sans qu''aucune autre faute à la procédure d''exécution soit commise, le tireur effectue, au moment de botter, deux contacts consécutifs avec le ballon. Décisions : a) s''il s''agit de deux contacts consécutifs accidentels (botteur qui glisse involontairement lors de la frappe) ; b) s''il s''agit de deux contacts consécutifs délibérés (botteur qui cherche intentionnellement un deuxième contact) ?',
 'a) Si le penalty est marqué : but refusé et penalty à retirer ; si le penalty est manqué : coup franc indirect sur le point de penalty (N.B. : si penalty à la fin du temps réglementaire et but non marqué, fin de la période ou du match). b) Dans tous les cas : coup franc indirect sur le point de penalty (N.B. : si penalty à la fin du temps réglementaire, fin de la période ou du match).',
 NULL, 3, 'CFA/DA Juillet 2025');
