-- ============================================================
-- RefQuiz — Questions Loi 10 (Issue d'un match — Tirs au but)
-- Source : CFA/DA — Section "Lois du Jeu" — Questions/Réponses — Juillet 2025
-- Format : questions ouvertes (évaluées par IA), réponses = corrigé officiel.
-- ============================================================

ALTER TABLE public.rq_questions ADD COLUMN IF NOT EXISTS source TEXT;

INSERT INTO public.rq_questions (category_id, type, question, expected_answer, explanation, difficulty, source)
VALUES
-- §1 Égalisation du nombre de joueurs autorisés
((SELECT id FROM public.rq_categories WHERE law_number='Loi 10'), 'open',
 'Épreuve des tirs au but : il faut rendre égal le nombre de joueurs autorisés avant l''épreuve. Un joueur se blesse au moment du tir et doit quitter le terrain. Décisions et explications ?',
 'L''équipe en supériorité numérique à cet instant devra informer l''arbitre du nom et du numéro du joueur retiré de la liste des joueurs autorisés. Le joueur blessé ne pourra plus revenir ni participer à la fin de l''épreuve.',
 NULL, 2, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 10'), 'open',
 'TAB : les deux équipes ont 8 joueurs chacune, score de 7 tirs à 7. Le 8e tireur de A (n°10) manque son tir, se blesse et ne peut poursuivre. Le 8e tireur de B (n°5B) doit-il tirer ? Explications.',
 'Le n°10A blessé est évacué pour soins. Le 8e joueur de B doit tirer : s''il marque, fin de l''épreuve ; s''il manque, le capitaine de B informe l''arbitre du nom et du numéro du joueur retiré, et l''épreuve se poursuit à 7 contre 7.',
 NULL, 3, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 10'), 'open',
 'À l''issue d''un match de Coupe (ou de la prolongation), un joueur quitte le terrain et ne revient pas, sans être blessé. Décisions ?',
 'L''épreuve des tirs au but ne doit pas être retardée par un joueur ayant quitté le terrain : son tir sera considéré comme raté s''il ne revient pas à temps pour l''exécuter.',
 NULL, 2, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 10'), 'open',
 'À l''issue d''un match de Coupe, 1 à 3 joueurs (avec entraîneur ou médecin) font constater qu''ils ne sont plus aptes à participer aux tirs au but (blessures non constatées pendant le match). L''arbitre doit-il les obliger à tirer ?',
 'L''arbitre n''obligera pas les joueurs blessés à participer ; il demandera à l''équipe adverse d''égaliser son nombre de joueurs. Il n''y a pas de nombre minimal de joueurs imposé pour l''épreuve des tirs au but.',
 NULL, 2, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 10'), 'open',
 'A termine le match à 10. Avant l''épreuve, l''arbitre fait égaliser B. Puis, avant le début de l''épreuve, un joueur de B participant à l''épreuve (autre que celui retiré) est exclu pour propos injurieux. Décisions ?',
 'L''arbitre demandera au capitaine de A de retirer à son tour un joueur de la liste des joueurs autorisés. L''épreuve débute avec 9 joueurs dans chaque équipe.',
 NULL, 3, 'CFA/DA Juillet 2025'),

-- §2 Tireur refusant d'exécuter son tir
((SELECT id FROM public.rq_categories WHERE law_number='Loi 10'), 'open',
 'TAB : un joueur autorisé et prévu pour le botté refuse de tirer. Décisions ?',
 'a) Il doit regagner le rond central pour être échangé avec un autre joueur de son équipe qui tirera à sa place. b) Si tous les joueurs autorisés ont déjà participé, ce joueur doit obligatoirement tirer : s''il refuse, avertissement pour désapprobation des décisions de l''arbitre ; s''il persiste, exclusion (second avertissement pour le même motif) et son tir est comptabilisé comme raté.',
 NULL, 3, 'CFA/DA Juillet 2025'),

-- §3 Ballon défectueux
((SELECT id FROM public.rq_categories WHERE law_number='Loi 10'), 'open',
 'TAB : le ballon devient défectueux après le botté mais avant de toucher un montant ou le gardien, sans avoir franchi la ligne de but. Décisions ?',
 'Arrêt du jeu. Remplacement du ballon défectueux par un nouveau ballon. Tir au but à recommencer.',
 NULL, 2, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 10'), 'open',
 'TAB : le premier tir est exécuté correctement par le n°5A ; pendant la trajectoire, le ballon éclate et finit au fond des buts. Décisions ?',
 'But refusé. Remplacement du ballon défectueux par un nouveau ballon. Tir au but à recommencer.',
 NULL, 2, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 10'), 'open',
 'TAB : le ballon devient défectueux après le botté et après avoir touché un montant ou le gardien, sans avoir franchi la ligne de but. Décisions ?',
 'Arrêt du jeu. Remplacement du ballon défectueux par un nouveau ballon. Tir comptabilisé comme raté.',
 NULL, 2, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 10'), 'open',
 'TAB : B est menée 3 à 2 ; le n°8B exécute correctement le 5e tir décisif, le ballon frappe le montant, éclate puis pénètre dans le but. Décisions et explications ?',
 'But refusé : le tir est considéré comme raté dès que le ballon a éclaté sur le montant. Fin de l''épreuve.',
 NULL, 3, 'CFA/DA Juillet 2025'),

-- §4 Remplaçant prenant la place du gardien
((SELECT id FROM public.rq_categories WHERE law_number='Loi 10'), 'open',
 'TAB : le gardien de A se blesse en plongeant lors du 6e tir et est remplacé par un remplaçant inscrit. Ce gardien remplaçant peut-il effectuer le 7e tir de son équipe ?',
 'Oui, sous réserve que le gardien titulaire n''ait pas déjà exécuté un tir parmi les cinq premiers de son équipe.',
 NULL, 2, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 10'), 'open',
 'TAB : B utilise son 11e joueur qui marque (9 tirs à 8). Le dernier tireur de B est le gardien, qui se blesse sérieusement en s''élançant. Le capitaine demande à utiliser un remplaçant n''ayant pas joué. Décisions ?',
 'Sous réserve que l''équipe n''ait pas épuisé le nombre maximum de remplacements autorisés, l''arbitre l''acceptera. Le gardien titulaire n''ayant pas encore tiré, son remplaçant devra tirer à sa place.',
 NULL, 3, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 10'), 'open',
 'TAB en Coupe : A est à 10 (n°7 exclu), B au complet ; B retire le n°2B. Après le 2e tir, le gardien de B se blesse et doit quitter le terrain. Décisions et explications ?',
 'Pour remplacer le gardien blessé, le capitaine de B peut faire appel soit à un remplaçant n''ayant pas encore joué (si l''équipe n''a pas épuisé ses remplacements), soit au joueur n°2B retiré pour égaliser : dans ce cas A ne retire pas de joueur et l''épreuve se poursuit à 10 contre 10. Le capitaine peut aussi remplacer le gardien blessé par un des joueurs présents sur le terrain : alors le capitaine adverse devra retirer un joueur et l''épreuve se poursuit à 9 contre 9.',
 NULL, 3, 'CFA/DA Juillet 2025'),

-- §5 Blessure d'un joueur autre que le gardien
((SELECT id FROM public.rq_categories WHERE law_number='Loi 10'), 'open',
 'TAB en Coupe : un joueur blessé est sorti se faire soigner ; l''arbitre siffle la fin du match (ou de la prolongation) avant qu''il sollicite l''autorisation de rentrer. Sa blessure étant légère, il demande à participer aux tirs au but. Décisions et explications ?',
 'Le joueur blessé peut participer à l''épreuve des tirs au but : la notion de présence sur le terrain s''étend aux joueurs blessés sortis momentanément pour se faire soigner.',
 NULL, 2, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 10'), 'open',
 'TAB en Coupe : le n°6A blessé se fait toujours soigner hors du terrain au moment où l''épreuve va commencer. Décisions ?',
 'L''arbitre demande au capitaine de A si le n°6 participe. Si le n°6A n''est pas en état : le capitaine B donne le nom/numéro d''un joueur retiré, chaque équipe débute à 10. Si le capitaine A souhaite qu''il participe : B ne réduit pas son nombre de joueurs, l''épreuve débute à 11 contre 11 même si le n°6A n''est pas dans le rond central ; l''arbitre informe que si le n°6A ne revient pas à temps pour son tir (11e), il sera considéré comme raté ; si, avant le dernier tir des deux équipes, le capitaine A informe que le n°6A ne pourra pas participer, on procède alors à l''égalisation du nombre de joueurs.',
 NULL, 3, 'CFA/DA Juillet 2025'),

-- §6 Tricherie du tireur
((SELECT id FROM public.rq_categories WHERE law_number='Loi 10'), 'open',
 'TAB : l''équipe visiteuse mène 10 à 9, tous les joueurs sauf un ont tiré. Le 11e joueur de l''équipe locale exécute le dernier tir, use d''une feinte illégale et marque. Décisions ?',
 'But refusé. Avertissement au tireur pour comportement antisportif. Tir au but considéré comme raté. Fin de l''épreuve.',
 NULL, 3, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 10'), 'open',
 'TAB : quelles décisions si a) le gardien s''avance dans le terrain avant le botté ? b) le tireur use d''une feinte illégale entre le signal de l''arbitre et le botté ? c) le tireur et le gardien commettent en même temps ces infractions ?',
 'a) But marqué : tir validé. But non marqué : si le gardien a au moins un pied sur/derrière sa ligne → tir raté ; si le gardien n''a pas au moins un pied sur/derrière sa ligne → sans influence sur le tireur (ballon hors du but ou sur montant/barre) tir raté, avec influence sur le tireur ou tir repoussé par le gardien → mise en garde du gardien, tir à refaire. b) Dans tous les cas : avertissement au tireur pour comportement antisportif, tir considéré comme raté. c) Dans tous les cas : avertissement au tireur pour comportement antisportif, tir considéré comme raté.',
 NULL, 3, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 10'), 'open',
 'TAB : dix joueurs de chaque équipe ont déjà tiré. Le 11e joueur de A commet une feinte illégale, marque, puis retourne mécontent dans le rond central. Décisions et explications ?',
 'But refusé. Avertissement au joueur pour comportement antisportif. Tir comptabilisé comme raté. Poursuite de l''épreuve par le 11e tireur de l''équipe B.',
 NULL, 3, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 10'), 'open',
 'TAB : le n°5B botte avant le coup de sifflet de l''arbitre. Le tir est à recommencer mais le tireur refuse. Décisions ?',
 'Si le n°5B n''était pas le dernier tireur : l''arbitre demande au capitaine de désigner un autre tireur autorisé n''ayant pas encore participé. Si le n°5B est le dernier tireur : l''arbitre le met en demeure de tirer ; s''il refuse, avertissement pour désapprobation des décisions de l''arbitre, et s''il persiste, exclusion (second avertissement) ; son tir est considéré comme raté ; en cas de nouvelle égalité, l''arbitre demande au capitaine de A de retirer un joueur autorisé pour égaliser. Rapport.',
 NULL, 3, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 10'), 'open',
 'TAB : le joueur tire sans le signal de l''arbitre. Décisions ?',
 'Tir au but à recommencer.',
 NULL, 1, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 10'), 'open',
 'TAB : sans autre faute à la procédure, le tireur effectue deux contacts consécutifs avec le ballon. Décisions si a) deux contacts accidentels (le botteur glisse) ? b) deux contacts délibérés ?',
 'a) Si le tir est marqué : but refusé et tir à recommencer ; si le tir est manqué : tir comptabilisé comme raté. b) Dans tous les cas : tir comptabilisé comme raté.',
 NULL, 3, 'CFA/DA Juillet 2025'),

-- §7 Épreuve interrompue
((SELECT id FROM public.rq_categories WHERE law_number='Loi 10'), 'open',
 'Match de Coupe de France : l''épreuve des tirs au but ne peut avoir lieu en raison d''une panne d''éclairage. Décisions ?',
 'L''arbitre fera un rapport à la commission compétente, qui statuera.',
 NULL, 1, 'CFA/DA Juillet 2025'),

-- §8 Questions diverses
((SELECT id FROM public.rq_categories WHERE law_number='Loi 10'), 'open',
 'À la fin d''un match de Coupe, tous les joueurs ayant terminé le match doivent être dans le rond central pour les tirs au but. Que doivent faire les joueurs retirés de la procédure ? Peuvent-ils rester dans le rond central ?',
 'L''accès à l''aire de jeu n''est possible qu''aux joueurs autorisés à participer à l''épreuve. Les joueurs retirés de la procédure pour égaliser le nombre de joueurs ne peuvent pas rester dans le rond central : ils seront situés dans la surface technique.',
 NULL, 2, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 10'), 'open',
 'TAB en Coupe : le capitaine de A, déjà averti durant le match, tient des propos désobligeants lors du tirage au sort pour le choix du premier tir et reçoit un avertissement (carton jaune). Décisions et explications ?',
 'La rencontre s''est terminée au coup de sifflet final. La Loi 10 précise que les mises en garde ou avertissements reçus durant le match ne sont pas pris en compte lors de la séance de tirs au but : ce nouvel avertissement est délivré dans le cadre de la séance des tirs au but (même si le premier tir n''a pas encore eu lieu). Le capitaine de A peut continuer à participer à la séance.',
 NULL, 3, 'CFA/DA Juillet 2025')
;
