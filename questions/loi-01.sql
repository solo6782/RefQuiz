-- ============================================================
-- RefQuiz — Questions Loi 1 (Le terrain de jeu)
-- Source : CFA/DA — Section "Lois du Jeu" — Questions/Réponses — Juillet 2025
-- Format : questions ouvertes (évaluées par IA), réponses = corrigé officiel.
-- ============================================================

ALTER TABLE public.rq_questions ADD COLUMN IF NOT EXISTS source TEXT;

INSERT INTO public.rq_questions (category_id, type, question, expected_answer, explanation, difficulty, source)
VALUES
-- §1 Panne d'électricité et intempéries
((SELECT id FROM public.rq_categories WHERE law_number='Loi 1'), 'open',
 'En raison d''une panne d''éclairage, le coup d''envoi prévu à 20h n''a lieu qu''à 20h15. Au coup de sifflet de fin de 1re période (déroulée normalement), une panne d''éclairage survient. Comment l''arbitre décompte-t-il le temps d''interruption ? Les 30 minutes maximales incluent-elles le temps de mi-temps ?',
 'Le décompte du temps d''interruption débute aussitôt, car l''arbitre fait le constat de la panne immédiatement. La durée de la mi-temps fait partie du temps décompté.',
 NULL, 2, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 1'), 'open',
 'Toutes les heures sont précises. Match prévu à 20h. Panne d''électricité à 19h50. Le match commence à 20h32. L''arbitre siffle la mi-temps à 21h17 et la panne débute au même moment. Quand le match est-il définitivement arrêté ?',
 'Le match sera reporté à un autre jour au moment où la montre affiche 21h30 (soit 21h17 + 13 minutes, pour atteindre la durée maximale d''interruption).',
 NULL, 3, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 1'), 'open',
 'Panne d''électricité. Un dirigeant informe l''arbitre au vestiaire. Doit-il aller vérifier pour décompter le temps d''interruption immédiatement, ou peut-il attendre le retour sur le terrain ?',
 'L''arbitre doit décompter le temps d''interruption dès qu''il constate lui-même la panne, après en avoir été informé. Dans ce cas, il se rendra immédiatement sur le terrain pour en prendre acte.',
 NULL, 2, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 1'), 'open',
 'Un match est interrompu à plusieurs reprises pour des motifs liés à la fois aux conditions atmosphériques et à des pannes d''électricité. L''arbitre doit-il cumuler les arrêts selon les différents motifs ?',
 'Non. L''interruption maximale de 45 minutes comprend à la fois les motifs d''arrêt pour intempéries et pour pannes d''éclairage (le total est cumulé, pas un délai par motif).',
 NULL, 2, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 1'), 'open',
 'La durée maximale d''interruption d''un match en raison de mauvaises conditions atmosphériques (brouillard, etc.) est-elle la même pour toutes les catégories de rencontre, y compris les matches de jeunes ?',
 'Oui. La durée d''interruption maximale est de 45 minutes pour toutes les catégories de rencontres, quelle que soit la durée de chaque période de jeu prévue par les règlements.',
 NULL, 1, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 1'), 'open',
 'Lorsque l''arbitre, en cours de rencontre, doit interrompre celle-ci pour faire retracer les lignes, quel délai doit-il laisser au club organisateur pour remettre le terrain en conformité ?',
 'Un délai de 45 minutes. C''est le délai correspondant au délai d''acceptabilité d''une réserve d''avant-match portant sur la non-conformité du terrain.',
 NULL, 2, 'CFA/DA Juillet 2025'),

-- §2 Équipement du terrain
((SELECT id FROM public.rq_categories WHERE law_number='Loi 1'), 'open',
 'Des réserves sur l''équipement du terrain doivent être déposées 45 minutes avant la rencontre. Comment expliquer qu''un arbitre puisse laisser un match se dérouler sur un terrain non conforme lorsque la réserve (fondée) est posée seulement 20 minutes avant le coup d''envoi ?',
 'Le délai de 45 minutes a été institué pour permettre au club recevant de procéder aux modifications nécessaires en cas d''anomalie (à rapprocher du délai d''une heure minimum avant le coup d''envoi pour l''arrivée de l''arbitre, qui inspecte le terrain et signale les anomalies). Pour une réserve fondée déposée seulement 20 minutes avant : si l''anomalie est légère, le match aura lieu ; si l''anomalie est importante (ex. barre transversale brisée à l''échauffement), le match n''aura pas lieu.',
 NULL, 3, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 1'), 'open',
 'Que doit faire l''arbitre lorsque le poteau de corner se brise accidentellement en cours de match ?',
 'Arrêt du jeu. Faire retirer le poteau défectueux et demander sa réparation ou son remplacement par un poteau conforme. Si le club recevant ne peut pas fournir un nouveau poteau ou si le poteau n''est pas réparable, l''arbitre fait reprendre la rencontre en s''efforçant de trouver un moyen de remplacement provisoire (de fortune).',
 NULL, 2, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 1'), 'open',
 'Lors de l''inspection du terrain avant la rencontre, l''arbitre constate que les montants des buts sont couverts de diverses publicités. Conduite à tenir ?',
 'Conformément à la Loi 1 (tout type de publicité est interdit sur les buts, filets, poteaux de corner et drapeaux de coin), l''arbitre demande que les publicités soient enlevées pour que le match puisse débuter. Si le club recevant n''est pas en mesure de les enlever, le match n''aura pas lieu et l''arbitre fera un rapport.',
 NULL, 2, 'CFA/DA Juillet 2025'),

-- §3 Matches de lever de rideau
((SELECT id FROM public.rq_categories WHERE law_number='Loi 1'), 'open',
 'Lever de rideau : une heure avant le coup d''envoi du match principal, deux équipes s''apprêtent seulement à donner le coup d''envoi de leur match (ce qui retarderait le match principal d''au moins 30 minutes). Le délégué ou l''arbitre du match principal peuvent-ils interdire d''autorité ce lever de rideau ? (Mêmes questions si la demande vient d''un capitaine, ou si le retard ne serait que d''un quart d''heure.)',
 'Bien que la question soit plutôt d''ordre réglementaire, il appartient à l''arbitre du lever de rideau de prendre ses responsabilités. Si c''est impératif, l''arbitre du lever de rideau doit arrêter celui-ci à temps (sauf circonstances exceptionnelles avec accord de l''arbitre du match principal) pour que le match principal débute à l''heure prévue.',
 NULL, 2, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 1'), 'open',
 'Match de lever de rideau susceptible de rendre le terrain impraticable pour le match principal. Que doit faire l''arbitre ?',
 'Le délégué, ou mieux l''arbitre, doit interrompre le lever de rideau dès qu''il se rend compte que le terrain est ou va devenir impraticable, sans tenir compte du temps restant à jouer. Les Commissions Fédérales des Championnats Nationaux admettent la possibilité de poursuivre la rencontre sur un terrain de repli homologué.',
 NULL, 2, 'CFA/DA Juillet 2025'),

-- §4 Arrêté municipal
((SELECT id FROM public.rq_categories WHERE law_number='Loi 1'), 'open',
 'Comment l''arbitre agira-t-il si l''équipe locale lui présente un arrêté municipal alors que le match a débuté ?',
 'L''arbitre devra arrêter immédiatement la rencontre. Il gardera l''arrêté municipal et l''enverra avec son rapport, en précisant notamment les conditions dans lesquelles l''arrêté lui a été présenté.',
 NULL, 2, 'CFA/DA Juillet 2025')
;
