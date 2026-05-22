-- ============================================================
-- RefQuiz — Questions Loi 3 (Les joueurs)
-- Source : CFA/DA — Section "Lois du Jeu" — Questions/Réponses — Juillet 2025
-- Format : questions ouvertes (évaluées par IA), réponses = corrigé officiel.
-- ============================================================

ALTER TABLE public.rq_questions ADD COLUMN IF NOT EXISTS source TEXT;

INSERT INTO public.rq_questions (category_id, type, question, expected_answer, explanation, difficulty, source)
VALUES
-- §1 Identification des joueurs et des remplaçants
((SELECT id FROM public.rq_categories WHERE law_number='Loi 3'), 'open',
 '65e minute. Le n°8B est sanctionné d''un coup franc direct. Pendant l''arrêt, l''équipe A remplace le n°7A. Le remplaçant n°14A, nouvellement entré, exécute la remise en jeu et marque directement. Le capitaine B demande l''annulation et veut déposer une réserve technique : seuls 13 joueurs sont inscrits sur la feuille de match, aucun en n°14. Décisions ?',
 'But refusé. Avertissement au capitaine de l''équipe A pour comportement antisportif. L''arbitre fait quitter le terrain à ce remplaçant (victime d''une erreur administrative de ses dirigeants) ; retour possible du n°7A. Mise en œuvre du dépôt de la réserve. Comme l''arbitre s''en aperçoit alors que le ballon est dans les filets, le n°14 ne pourra pas participer (quel que soit le type de feuille de match) et doit être considéré comme un agent extérieur. Coup franc à recommencer. Rapport.',
 NULL, 3, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 3'), 'open',
 'L''équipe A débute avec 10 titulaires et 3 remplaçants en attendant l''arrivée de son 11e joueur. À la 15e minute, le capitaine demande à faire entrer un remplaçant pour pallier l''absence du titulaire qui ne vient pas. Décisions ?',
 'L''arbitre permet à l''équipe A de se compléter avec un remplaçant ; elle jouera donc à 11 et ne disposera plus que de 2 remplaçants. En cas d''arrivée du titulaire attendu, celui-ci ne pourra pas participer à la rencontre.',
 NULL, 2, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 3'), 'open',
 'National 2 : équipe A avec 11 titulaires et 5 remplaçants. Le n°8A se blesse à l''échauffement, l''équipe commence à 10 en attendant un joueur. Après 10 minutes, le capitaine demande à faire entrer un remplaçant. Décisions ?',
 'L''arbitre permet à l''équipe A de se compléter avec un remplaçant ; elle jouera à 11 et disposera encore de 4 remplaçants, pouvant toujours effectuer 4 remplacements en cours de match sans diminuer le nombre d''opportunités. L''arbitre décomptera le temps perdu en fin de première période. En cas d''arrivée du titulaire attendu, il ne pourra pas participer.',
 NULL, 3, 'CFA/DA Juillet 2025'),

-- §2 Joueurs exclus avant le coup d'envoi
((SELECT id FROM public.rq_categories WHERE law_number='Loi 3'), 'open',
 'Un titulaire est exclu avant le début de la rencontre. Le remplaçant inscrit est présent mais le capitaine refuse de le faire entrer pour compléter son équipe. Décisions ?',
 'Le capitaine est libre d''agir ainsi (la Loi 3 lui donne une possibilité, pas une obligation). Le remplaçant pourra compléter l''équipe à tout moment de la rencontre.',
 NULL, 2, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 3'), 'open',
 'En cas d''exclusion de titulaires avant le coup d''envoi et à défaut de remplaçant, l''équipe peut-elle se compléter avec de nouveaux joueurs une fois le coup d''envoi donné ?',
 'Non. L''équipe ne peut pas se compléter avec des joueurs nouveaux après le coup d''envoi. Cette disposition s''applique à toutes les compétitions (Nationales, Ligue ou District).',
 NULL, 2, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 3'), 'open',
 'En cas d''exclusion de joueurs avant le coup d''envoi, peut-on encore, après établissement de la feuille de match et jusqu''au coup d''envoi, inscrire de nouveaux remplaçants en cas d''absence de remplaçants inscrits ?',
 'Les dispositions actuelles permettent d''inscrire des remplaçants avant le coup d''envoi ; ces remplaçants pourront remplacer les joueurs interdits, mais sans possibilité d''inscrire de nouveaux remplaçants.',
 NULL, 2, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 3'), 'open',
 'Rencontre fédérale, 11 titulaires + 5 remplaçants. 1) Deux remplaçants sont exclus avant le match : combien de remplacements possibles ? 2) Les 5 remplaçants sont exclus avant le match : l''équipe commence à 9 ou à 11 ?',
 '1) L''équipe pourra effectuer 3 remplacements. 2) L''équipe jouera à 11 mais ne pourra effectuer aucun remplacement au cours du match.',
 NULL, 3, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 3'), 'open',
 'Équipe de 11 titulaires + 5 remplaçants. Après transmission de la feuille de match et avant le coup d''envoi, l''arbitre exclut 4 titulaires. L''équipe peut-elle débuter à 11 ? Combien de remplacements en cours de match ?',
 'L''équipe peut débuter à 11 et pourra encore effectuer un remplacement en cours de rencontre. (IFAB : un joueur exclu après avoir été inscrit comme titulaire et avant le coup d''envoi peut être remplacé par un remplaçant inscrit ; ce dernier ne pourra pas être remplacé, mais le nombre de remplacements autorisés n''en sera pas réduit.)',
 NULL, 3, 'CFA/DA Juillet 2025'),

-- §3 Permutation avec le gardien de but
((SELECT id FROM public.rq_categories WHERE law_number='Loi 3'), 'open',
 'Un défenseur permute avec son gardien de but sans avertir l''arbitre. Celui-ci s''en aperçoit lorsque le nouveau gardien saisit le ballon des mains au point de penalty. Décisions et explications ?',
 'Le jeu doit se poursuivre. Au 1er arrêt naturel du jeu, les deux joueurs sont avertis pour comportement antisportif. Si l''arbitre arrête le jeu par erreur, reprise par balle à terre donnée au gardien de but. Si la permutation a eu lieu à la mi-temps (ou durant la période entre la fin du match et le début de la prolongation), les deux joueurs ne seront pas avertis.',
 NULL, 2, 'CFA/DA Juillet 2025'),

-- §4 Personne supplémentaire sur le terrain (hors agent extérieur)
((SELECT id FROM public.rq_categories WHERE law_number='Loi 3'), 'open',
 'Une personne supplémentaire (surnombre ou joueur sous fausse identité) est présente sur le terrain SANS interférer avec le jeu. Décisions ?',
 'Attendre le 1er arrêt de jeu. Avertissement au joueur/remplaçant/remplacé pour être entré sans autorisation et le faire quitter le terrain ; mise en garde s''il s''agit d''un officiel d''équipe, ou rapport s''il s''agit d''un joueur exclu ou sous fausse identité (avertissement au capitaine). Reprise consécutive à l''arrêt. Si par inadvertance l''arbitre a arrêté le jeu, reprise par balle à terre sous réserve de la procédure de la Loi 8.',
 NULL, 2, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 3'), 'open',
 'Une personne supplémentaire est présente sur le terrain et INTERFÈRE avec le jeu (dispute le ballon, crie "laisse !", etc.). Décisions ?',
 'Arrêt du jeu. Avertissement au joueur/remplaçant/remplacé pour être entré sans autorisation et le faire quitter le terrain ; si l''interférence empêche un but, exclusion pour avoir annihilé une occasion nette de but. Exclusion s''il s''agit d''un officiel d''équipe, ou rapport s''il s''agit d''un joueur exclu ou sous fausse identité (avertissement au capitaine). Interférence dans sa surface : penalty pour l''adverse ; hors surface : coup franc direct pour l''adverse à l''endroit de l''interférence, sous réserve de la procédure de la Loi 13.',
 NULL, 3, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 3'), 'open',
 'Une personne supplémentaire est présente sur le terrain SANS interférer, et un but est marqué. Décisions ?',
 'Dans tous les cas : avertissement au joueur/remplaçant/remplacé pour être entré sans autorisation et le faire quitter le terrain ; mise en garde s''il s''agit d''un officiel d''équipe, ou rapport s''il s''agit d''un joueur exclu ou sous fausse identité (avertissement au capitaine). But accordé. Coup d''envoi.',
 NULL, 2, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 3'), 'open',
 'Une personne supplémentaire est présente sur le terrain et INTERFÈRE avec le jeu avant qu''un but soit marqué. Décisions ?',
 'Avertissement au joueur/remplaçant/remplacé pour être entré sans autorisation et le faire quitter le terrain ; exclusion s''il s''agit d''un officiel d''équipe, ou rapport s''il s''agit d''un joueur exclu ou sous fausse identité (avertissement au capitaine). But en faveur de l''équipe régulière : but accordé, coup d''envoi. But en faveur de l''équipe irrégulière : but refusé, coup franc direct pour l''équipe régulière à l''endroit de la personne supplémentaire, ou penalty.',
 NULL, 3, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 3'), 'open',
 'Une personne supplémentaire est présente sur le terrain et commet une faute NE nécessitant PAS de sanction disciplinaire. Décisions ?',
 'Arrêt du jeu. Avertissement au joueur/remplaçant/remplacé pour être entré sans autorisation et le faire quitter le terrain ; exclusion s''il s''agit d''un officiel d''équipe, ou rapport s''il s''agit d''un joueur exclu ou sous fausse identité. Interférence dans sa surface : penalty pour l''adverse ; hors surface : coup franc direct pour l''adverse à l''endroit de l''interférence, sous réserve de la procédure de la Loi 13.',
 NULL, 3, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 3'), 'open',
 'Une personne supplémentaire est présente sur le terrain et commet une faute nécessitant un AVERTISSEMENT. Décisions ?',
 'Arrêt du jeu. Avertissement pour être entré sans autorisation puis avertissement pour la faute commise : exclusion pour avoir reçu deux avertissements. S''il s''agit d''un officiel d''équipe : exclusion pour avoir interféré ; s''il s''agit d''un joueur exclu ou sous fausse identité : rapport (avertissement au capitaine). Interférence dans sa surface : penalty pour l''adverse ; hors surface : coup franc direct pour l''adverse à l''endroit de l''interférence, sous réserve de la procédure de la Loi 13.',
 NULL, 3, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 3'), 'open',
 'Une personne supplémentaire est présente sur le terrain et commet une faute nécessitant une EXCLUSION. Décisions ?',
 'Arrêt du jeu. Exclusion de la personne supplémentaire selon la nature de la faute. Rapport s''il s''agit d''un joueur exclu ou sous fausse identité (avertissement au capitaine). Interférence dans sa surface : penalty pour l''adverse ; hors surface : coup franc direct pour l''adverse à l''endroit où elle a interféré, sous réserve de la procédure de la Loi 13.',
 NULL, 3, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 3'), 'open',
 'Une personne supplémentaire de l''équipe A est sur le terrain et SUBIT une faute (coup de poing) d''un joueur de B, alors qu''elle N''interfère PAS avec le jeu. Décisions et explications ?',
 'Sous réserve de l''avantage, arrêt du jeu. Exclusion du joueur fautif de B pour acte de brutalité. Avertissement à la personne supplémentaire pour être entrée sans autorisation et la faire quitter le terrain ; exclusion s''il s''agit d''un officiel d''équipe, ou rapport si c''est un joueur exclu de A ou sous fausse identité (avertissement au capitaine). L''IFAB considère qu''une personne supplémentaire qui subit une faute interfère de fait avec un adversaire : victime dans la surface de A → penalty pour B ; victime hors de la surface de A → coup franc direct pour B à l''endroit de la faute, sous réserve de la procédure de la Loi 13.',
 NULL, 3, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 3'), 'open',
 'Une personne supplémentaire de l''équipe A est sur le terrain et SUBIT une faute d''un joueur de B, alors qu''elle INTERFÈRE avec le jeu. Décisions ?',
 'Arrêt du jeu. Sanction disciplinaire éventuelle contre le joueur fautif de B. Avertissement à la personne supplémentaire pour être entrée sans autorisation et la faire quitter le terrain ; si l''interférence empêche un but, exclusion pour avoir annihilé une occasion nette de but. Exclusion s''il s''agit d''un officiel d''équipe, ou rapport si joueur sous fausse identité (avertissement au capitaine) ou exclu de B. Interférence dans la surface de A → penalty pour B ; hors surface de A → coup franc direct pour B à l''endroit de l''interférence, sous réserve de la procédure de la Loi 13.',
 NULL, 3, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 3'), 'open',
 'Un remplaçant de l''équipe A, entré à l''insu de l''arbitre, effectue une rentrée de touche et marque directement dans son propre but. Décisions et explications ?',
 'But refusé. Avertissement au remplaçant pour être entré sans autorisation et le faire quitter le terrain (il a interféré dans le jeu). Coup franc direct pour l''équipe B sur la ligne de touche.',
 NULL, 2, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 3'), 'open',
 'L''équipe A marque directement sur une rentrée de touche. À cet instant l''arbitre constate que l''équipe B joue à 12. Décisions ?',
 'But refusé. Avertissement au joueur supplémentaire pour être entré sans autorisation (rapport si joueur sous fausse identité avec avertissement au capitaine, ou exclu de B) et le faire quitter le terrain. S''il n''a pas interféré : coup de pied de but pour l''équipe B. S''il a interféré : coup franc direct pour l''équipe A à l''endroit de la personne supplémentaire, ou penalty.',
 NULL, 3, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 3'), 'open',
 'Corner. Le but est marqué directement par un joueur supplémentaire présent sur le terrain depuis quelques instants. Décisions ?',
 'But refusé. Avertissement au joueur supplémentaire pour être entré sans autorisation (rapport si sous fausse identité, avec avertissement au capitaine) et le faire quitter le terrain. Coup franc direct pour l''équipe adverse dans la surface de coin.',
 NULL, 2, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 3'), 'open',
 'Le n°9A blessé est remplacé alors que le ballon vient de sortir en corner pour A. Le remplaçant n°12A, présenté à l''assistant à la ligne médiane, ne pénètre pas sur le terrain : il longe la ligne de touche et va exécuter le corner, marquant directement. Décisions et explications ?',
 'But refusé : la procédure de remplacement n''a pas été effectuée correctement (le remplaçant doit pénétrer sur le terrain au niveau de la ligne médiane). Par conséquent le remplaçant ne sera pas averti. Corner à retirer.',
 NULL, 3, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 3'), 'open',
 'L''arbitre accorde un penalty pour une faute du n°4 et exclut ce dernier. Alors que le n°4 n''a pas encore quitté le terrain, l''arbitre donne le signal et le penalty est marqué. Décisions et explications ?',
 'But accordé : bien que les arbitres n''aient pas suffisamment veillé à la sortie définitive du joueur, celui-ci n''a eu aucune interférence sur l''exécution du penalty. Les arbitres s''assureront que le joueur exclu a définitivement quitté le terrain avant la reprise. Coup d''envoi.',
 NULL, 2, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 3'), 'open',
 'Avant une remise en jeu (coup de pied de but, corner, rentrée de touche), l''arbitre s''aperçoit qu''un joueur supplémentaire est présent sur le terrain. Décisions ?',
 'Retarder la reprise du jeu. Avertissement au joueur/remplaçant/remplacé pour être entré sans autorisation (rapport si sous fausse identité, avec avertissement au capitaine, ou exclu) et le faire quitter le terrain. Reprise consécutive à l''arrêt. Si le joueur supplémentaire avait interféré avant la sortie du ballon : coup franc direct pour l''adverse à l''endroit de l''interférence (sous réserve de la procédure de la Loi 13) ou penalty.',
 NULL, 3, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 3'), 'open',
 'Une équipe joue à 12 depuis plusieurs minutes. Coup franc pour A dans sa propre surface ; le ballon est joué mais pas encore sorti de la surface quand l''arbitre voit le surnombre et arrête le jeu. Décisions si : a) le joueur en trop est de l''équipe défendante A ; b) il est de l''équipe attaquante B ?',
 'Le ballon est en jeu dès qu''il a été botté et a clairement bougé. Avertissement au joueur/remplaçant/remplacé pour être entré sans autorisation (rapport si sous fausse identité, avec avertissement au capitaine, ou exclu) et le faire quitter le terrain. S''il n''a pas interféré : l''arbitre n''aurait pas dû arrêter le jeu (attendre le 1er arrêt naturel) → balle à terre donnée au gardien de but. S''il a interféré : a) joueur de A → coup franc direct pour B à l''endroit de l''interférence, ou penalty si dans la surface de A ; b) joueur de B → coup franc direct pour A à l''endroit de l''interférence.',
 NULL, 3, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 3'), 'open',
 'Un joueur sous fausse identité joue depuis 10 minutes ; à la 11e son équipe marque. Avant le coup d''envoi, l''arbitre constate que sa fausse identité ne lui permet plus de jouer. Décisions et explications ?',
 'Selon la Loi 3 §7, toute personne non inscrite sur la feuille de match est un agent extérieur, mais l''arbitre traite ici la situation comme un "joueur". Il lui fait quitter le terrain (rapport, avertissement au capitaine pour comportement antisportif) ; l''équipe fautive ne pourra pas se compléter à 11 et jouera à 10 (équité sportive). But marqué par ce joueur : contre son camp → but accordé, coup d''envoi ; contre l''adverse → but refusé, coup franc direct pour l''adverse à l''endroit où il a touché le ballon (sous réserve de la procédure de la Loi 13) ou penalty. But marqué par un partenaire : contre son camp → but accordé, coup d''envoi ; contre l''adverse → but refusé, coup franc direct pour l''adverse à l''endroit du joueur sous fausse identité (sous réserve de la procédure de la Loi 13) ou penalty.',
 NULL, 3, 'CFA/DA Juillet 2025'),

-- §5 Agent extérieur présent sur le terrain
((SELECT id FROM public.rq_categories WHERE law_number='Loi 3'), 'open',
 'Un agent extérieur est présent sur le terrain SANS interférer avec le jeu. Décisions ?',
 'Attendre le 1er arrêt de jeu. Faire quitter le terrain à l''agent extérieur. Reprise consécutive à l''arrêt.',
 NULL, 1, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 3'), 'open',
 'Un agent extérieur est présent sur le terrain et INTERFÈRE avec le jeu. Décisions ?',
 'Arrêt du jeu. Faire quitter le terrain à l''agent extérieur. Quel que soit l''endroit de l''interférence : balle à terre sous réserve de la procédure de la Loi 8. Rapport.',
 NULL, 2, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 3'), 'open',
 'Le ballon va pénétrer dans le but. Un agent extérieur est présent sur le terrain à ce moment-là. Décisions ?',
 'Dans tous les cas, faire quitter le terrain à l''agent extérieur. S''il touche ou non le ballon sans interférer avec les défenseurs : but accordé, coup d''envoi. S''il touche ou non le ballon et interfère avec les défenseurs : arrêt du jeu, balle à terre donnée au gardien de but. Rapport.',
 NULL, 2, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 3'), 'open',
 'Un agent extérieur est présent sur le terrain et est impliqué dans une faute. Décisions ?',
 'Arrêt du jeu. Faire quitter le terrain à l''agent extérieur. Si l''agent commet la faute ou en est victime : balle à terre sous réserve de la procédure de la Loi 8. Si la faute est commise par un joueur : sanction disciplinaire contre le joueur fautif selon la nature de la faute. Rapport.',
 NULL, 2, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 3'), 'open',
 'Ballon en jeu, long ballon vers la touche à 30 m du but adverse, un attaquant de A et un défenseur de B sont à la lutte. Un spectateur pénètre et coupe leur course sans les toucher. L''arbitre arrête le jeu alors que le ballon est encore en jeu et non touché. Décisions ?',
 'Faire quitter le terrain au spectateur. Balle à terre donnée à un joueur de l''équipe A à l''endroit où le jeu a été arrêté. Rapport.',
 NULL, 3, 'CFA/DA Juillet 2025'),

-- §6 Permutation avant le match ou à la mi-temps
((SELECT id FROM public.rq_categories WHERE law_number='Loi 3'), 'open',
 'Un remplaçant A prend la place d''un titulaire en 1re période. À la mi-temps, le titulaire remplacé reprend sa place sans que personne ne s''en aperçoive. La supercherie est découverte quand un but est marqué EN FAVEUR de l''équipe A. Décisions ?',
 'But refusé. Avertissement au remplacé de A pour comportement antisportif et le faire quitter le terrain. Avertissement au capitaine A pour comportement antisportif. Autorisation au joueur A ayant remplacé le titulaire en 1re période de reprendre sa place, avec avertissement pour comportement antisportif. Coup franc direct pour l''équipe B à l''endroit de la personne supplémentaire.',
 NULL, 3, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 3'), 'open',
 'Même situation de permutation à la mi-temps, mais la supercherie est découverte quand le fautif vient de marquer CONTRE SON CAMP. Décisions ?',
 'But accordé. Avertissement au remplacé de A pour comportement antisportif et le faire quitter le terrain. Avertissement au capitaine A pour comportement antisportif. Autorisation au joueur A ayant remplacé le titulaire en 1re période de reprendre sa place, avec avertissement pour comportement antisportif. Coup d''envoi.',
 NULL, 3, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 3'), 'open',
 'Le n°9B est régulièrement remplacé par le n°12B en 1re période. 20 minutes après le début de la 2e période, le n°9B exécute un corner et marque directement. Le capitaine A signale qu''il avait été remplacé. Décisions ?',
 'But refusé. Avertissement au remplacé n°9B pour comportement antisportif et le faire quitter le terrain. Avertissement au capitaine pour comportement antisportif. Autorisation au n°12B de reprendre sa place, avec avertissement pour comportement antisportif. Coup franc direct pour l''équipe A dans la surface de coin.',
 NULL, 3, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 3'), 'open',
 'Un remplaçant est permuté avec un joueur AVANT le coup d''envoi, sans que l''arbitre soit informé. Décisions et explications selon les cas : a) ballon sorti ; b) coup franc/penalty pour l''équipe du remplaçant ; c) coup franc/penalty contre ; d) le remplaçant marque pour son équipe ; e) il marque contre son camp ; f) l''arbitre arrête le jeu pour ce motif.',
 'Le joueur inscrit comme remplaçant est autorisé à continuer le match, sans sanction disciplinaire ; le joueur inscrit comme titulaire devient remplaçant et le nombre de remplacements n''est pas réduit ; la feuille de match sera réactualisée. Cas a) à e) : reprise consécutive à l''arrêt. Cas f) : l''arbitre ne doit pas arrêter le jeu pour ce motif ; s''il l''a fait, reprise par balle à terre sous réserve de la procédure de la Loi 8. Rapport.',
 NULL, 3, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 3'), 'open',
 'Avant le match, le capitaine n°4 de B s''est blessé à l''échauffement ; sur la feuille de match le n°12 prend le n°4 et inversement. a) La feuille doit-elle être à nouveau validée ? b) Après 2 minutes, l''assistant voit que le joueur n°12 n''a pas changé de maillot (devrait porter le n°4) : erreur d''arbitre ou faute d''équipe ?',
 'a) Les deux capitaines doivent être informés et la feuille de match à nouveau validée. b) L''arbitre aurait dû vérifier le changement de maillot avant le coup d''envoi ; au 1er arrêt de jeu, il sera procédé au changement de maillot et les joueurs concernés ne recevront pas d''avertissement.',
 NULL, 2, 'CFA/DA Juillet 2025'),

-- §7 Joueur pénétrant sur le terrain sans autorisation
((SELECT id FROM public.rq_categories WHERE law_number='Loi 3'), 'open',
 'Ballon en jeu, un retardataire pénètre sur le terrain sans autorisation pour compléter son équipe. L''arbitre s''en aperçoit immédiatement et siffle avant qu''il n''interfère. Décisions et explications ?',
 'L''arbitre vérifie l''identité du joueur ; s''il est identifié il est considéré comme "joueur" (inscrit sur la feuille de match informatisée à la mi-temps ou en fin de match). Avertissement pour être entré sans autorisation. Coup franc indirect pour l''adverse à l''endroit du ballon, sous réserve de la procédure de la Loi 13. (L''arbitre n''aurait dû arrêter le jeu qu''au moment où ce joueur entrave le jeu.) Si la personne n''est pas identifiée : la faire quitter le terrain, balle à terre sous réserve de la procédure de la Loi 8. Rapport.',
 NULL, 3, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 3'), 'open',
 'Le n°6A quitte le terrain à l''insu de l''arbitre. Le capitaine B le signale (A à 10). 15 minutes plus tard, A marque contre B et l''on constate que le buteur est le n°6A, non remplacé, rentré à l''insu de tous. Décisions et explications ?',
 'But refusé. Au moment où B avait signalé la sortie, l''arbitre aurait dû avertir le n°6A pour avoir quitté le terrain sans autorisation. Second avertissement au n°6A pour être revenu sans autorisation → exclusion pour deux avertissements. Coup franc direct pour B à l''endroit où se trouvait le n°6A quand il a marqué, sous réserve de la procédure de la Loi 13. Rapport.',
 NULL, 3, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 3'), 'open',
 'Le n°8A, autorisé à sortir pour se faire soigner, tend la jambe à l''intérieur du terrain et fait chuter un adversaire qui débordait ballon au pied. Décisions et explications ?',
 'Arrêt du jeu. Avertissement au n°8A pour être entré sur le terrain sans autorisation, puis avertissement pour comportement antisportif si l''arbitre estime qu''il a stoppé une attaque prometteuse → l''arbitre indique clairement les deux fautes (deux cartons jaunes) puis présente le carton rouge (exclusion). Coup franc direct pour B à l''endroit de la faute, ou penalty si dans la surface de A. Rapport en cas d''exclusion.',
 NULL, 3, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 3'), 'open',
 'Un joueur entre sur le terrain pour détourner le ballon de la main dans ses propres buts. Décisions s''il s''agit : 1) d''un joueur momentanément sorti pour se faire soigner ; 2) d''un joueur refoulé pour remettre son équipement en conformité ?',
 'Dans les deux cas : but accordé. Avertissement pour être entré sans autorisation puis second avertissement pour comportement antisportif (faute commise) → exclusion pour deux avertissements. Coup d''envoi. Rapport.',
 NULL, 3, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 3'), 'open',
 'Un joueur sorti se faire soigner derrière sa ligne de but rentre sans autorisation et dévie du pied sur la transversale un tir qui allait entrer ; le ballon revient, touche le gardien et entre dans le but. Décisions et explications ?',
 'But accordé. Avertissement au joueur fautif pour être entré sans autorisation. L''arbitre ayant laissé l''avantage et le but ayant été marqué, le joueur ne peut pas être exclu pour avoir annihilé une occasion nette de but. Coup d''envoi.',
 NULL, 3, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 3'), 'open',
 'Le n°7A sorti sur blessure derrière le but ; pendant une pause "boisson" et sans avertir les arbitres, l''équipe A fait entrer le remplaçant n°12A à sa place. Le jeu reprend et le n°12A s''apprête à disputer le ballon dans le rond central quand l''arbitre voit sa présence. Décisions ?',
 'Arrêt du jeu. Avertissement au remplaçant n°12A pour avoir pénétré sur le terrain sans autorisation et le faire quitter le terrain. Coup franc direct pour B à l''endroit où se trouvait le n°12A lors de l''arrêt de jeu.',
 NULL, 2, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 3'), 'open',
 'Un retardataire pénètre sur le terrain sans mettre son équipe en surnombre ; l''arbitre l''identifie. Décisions si : a) il frappe un adversaire ; b) il marque un but (contre son camp ou dans le but adverse) ?',
 'a) Arrêt du jeu. Exclusion pour acte de brutalité. Rapport. Coup franc direct pour l''adverse à l''endroit de la faute, ou penalty. b) But marqué contre l''adverse : but refusé, avertissement pour être entré sans autorisation, coup franc direct pour l''adverse à l''endroit du retardataire (sous réserve de la Loi 13) ou penalty. But contre son camp sur action de jeu : but accordé, avertissement pour entrée sans autorisation, coup d''envoi. But direct contre son camp sur remise en jeu : but refusé, avertissement pour entrée sans autorisation, coup franc direct pour l''adverse à l''endroit d''exécution de la remise en jeu, ou penalty.',
 NULL, 3, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 3'), 'open',
 'Une équipe a inscrit 10 joueurs (11e absent). L''arbitre s''aperçoit de la présence du 11e seulement quand il marque pour son équipe (il joue depuis un moment, identité positive). Décisions ?',
 'But refusé. Le joueur peut compléter son équipe. Avertissement pour avoir pénétré sur le terrain sans autorisation. Coup franc direct pour l''adverse à l''endroit où se trouvait le retardataire, sous réserve de la procédure de la Loi 13.',
 NULL, 2, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 3'), 'open',
 'Même situation (10 inscrits, 11e entré sans autorisation, identité positive), mais l''arbitre ne s''aperçoit de sa présence qu''au moment où il commet une faute. Décisions ?',
 'Arrêt du jeu. Le joueur peut compléter son équipe. Avertissement pour être entré sans autorisation ; si la faute nécessite une sanction, second avertissement ou exclusion directe. Si l''interférence empêche un but : exclusion pour avoir annihilé une occasion nette de but. Coup franc direct pour l''adverse à l''endroit du retardataire (sous réserve de la Loi 13) ou penalty. Rapport en cas d''exclusion.',
 NULL, 3, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 3'), 'open',
 'A bénéficie d''un penalty (faute du n°5B sur le n°7A). Avant le tir, le capitaine B signale que le n°7A, sorti se faire soigner, était rentré à son insu et jouait depuis quelques minutes. Décisions et explications ?',
 'Retarder la reprise du jeu. Avertissement au n°7A pour être revenu sans autorisation. L''infraction étant constituée au moment où l''arbitre s''en aperçoit, il ne peut pas reprendre par le penalty consécutif à la faute sur le n°7A : il doit sanctionner la présence non autorisée. Coup franc direct pour B à l''endroit où se trouvait le n°7A, sous réserve de la procédure de la Loi 13.',
 NULL, 3, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 3'), 'open',
 'Le ballon sort en touche. Le n°10A, sorti se faire soigner, ramasse le ballon et exécute rapidement la rentrée de touche sans que l''arbitre ait pu intervenir ; il siffle une fois le ballon en jeu. Décisions et explications ?',
 'Avertissement au n°10A pour comportement antisportif. Si la rentrée de touche est irrégulière : rentrée de touche à refaire par l''équipe B. Si elle est régulière : coup franc direct pour B sur la ligne de touche au point le plus proche de l''endroit de la rentrée de touche du n°10A. (Idéalement l''arbitre aurait dû retarder la reprise pour qu''un autre joueur de A l''exécute ; n''ayant pu intervenir, il a eu raison d''arrêter dès le constat car le joueur a interféré avec le jeu.)',
 NULL, 3, 'CFA/DA Juillet 2025'),

-- §8 Remplacements
((SELECT id FROM public.rq_categories WHERE law_number='Loi 3'), 'open',
 'Ballon en jeu, le gardien de A le capte. Le capitaine B demande un remplacement. Au lieu de le faire attendre, l''arbitre fait signe au gardien (ballon en mains) d''arrêter de jouer, sans coup de sifflet. Est-ce un arrêt de jeu ? Reprise ?',
 'Pour arrêter le jeu lorsque le ballon est en jeu, il faut un coup de sifflet. N''ayant pas attendu la sortie naturelle du ballon, le fait d''autoriser le remplacement après avoir demandé au gardien d''attendre doit être considéré comme un arrêt de jeu. La reprise ne peut être qu''une balle à terre donnée au gardien de but.',
 NULL, 3, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 3'), 'open',
 'Pendant un arrêt de jeu, l''équipe A demande à remplacer le n°10A par le n°12A. Avant de franchir les limites du terrain, le n°10A frappe un adversaire. Le remplacement doit-il s''effectuer ?',
 'Non : le n°10A est exclu et ne peut être remplacé.',
 NULL, 2, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 3'), 'open',
 'Un joueur mécontent quitte le terrain sans autorisation. Que doit faire l''arbitre si son entraîneur demande ensuite son remplacement ?',
 'L''arbitre autorise le remplacement et indique au capitaine que le joueur sorti est sanctionné d''un avertissement pour avoir quitté le terrain sans autorisation. (Sous réserve qu''il ne s''agisse pas d''un second avertissement, auquel cas il ne pourrait pas être remplacé.)',
 NULL, 2, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 3'), 'open',
 '43e minute, A demande un remplacement, le n°8A sort, l''arbitre fait signe au n°13A d''entrer. Suite à des propos du n°3B (sur le terrain à 50 cm de la touche), le n°13A, pieds encore à l''extérieur : 1) donne un coup de poing au n°3B ; 2) crache au visage du n°3B. Décisions et explications ?',
 '1) Le n°13A a pénétré sur le terrain (son bras a franchi la ligne de touche) : le remplacement est effectif, l''équipe A jouera à 10. 2) Le n°13A n''a pas pénétré : le remplacement n''est pas effectif, A pourra faire entrer un autre remplaçant à la place du n°8A si elle en dispose et jouera à 11. Dans les deux cas : avertissement au n°3B pour comportement antisportif ; exclusion du n°13A pour acte de brutalité (ou crachat sur un adversaire) ; reprise consécutive à l''arrêt ; rapport.',
 NULL, 3, 'CFA/DA Juillet 2025'),

-- §9 Questions diverses
((SELECT id FROM public.rq_categories WHERE law_number='Loi 3'), 'open',
 'Un joueur blessé sur le terrain fait-il partie du jeu ?',
 'Oui : un joueur blessé présent sur le terrain fait partie du jeu tant que l''arbitre n''a pas arrêté le jeu. À ce titre, s''il est en position d''avant-dernier adversaire, il couvre une potentielle situation de hors-jeu.',
 NULL, 2, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 3'), 'open',
 'Une équipe joue à 8 sans possibilité de remplacement. Un joueur blessé doit sortir pour se faire soigner. Combien de temps l''arbitre doit-il attendre avant de reprendre le jeu ?',
 'Le match est interrompu jusqu''au retour du joueur soigné sur le terrain. La durée d''interruption est à l''appréciation de l''arbitre, qui tient compte des circonstances et de la gravité de la blessure, du score et de la durée restante.',
 NULL, 2, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 3'), 'open',
 'Une équipe joue à 8. Un de ses joueurs se blesse et sort du terrain pendant l''action alors qu''un partenaire file au but ; le but est marqué. Décisions et explications ?',
 'But accordé. Le coup d''envoi ne peut être donné que si le joueur blessé peut revenir, ou s''il est remplacé par un remplaçant disponible. Coup d''envoi. À défaut, le match est arrêté.',
 NULL, 2, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 3'), 'open',
 'L''équipe A joue à 8. Un de ses joueurs quitte volontairement le terrain alors que B est à l''attaque. Décisions ?',
 'L''arbitre laisse le jeu se dérouler. Au 1er arrêt de jeu, il avertit le joueur fautif pour comportement antisportif (tricherie). Il place le capitaine face à ses responsabilités ; le match est arrêté si le partenaire ne revient pas. Rapport en cas d''arrêt de la rencontre.',
 NULL, 2, 'CFA/DA Juillet 2025')
;
