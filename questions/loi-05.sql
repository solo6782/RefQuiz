-- ============================================================
-- RefQuiz — Questions Loi 5 (L'arbitre)
-- Source : CFA/DA — Section "Lois du Jeu" — Questions/Réponses — Juillet 2025
-- Format : questions ouvertes (évaluées par IA), réponses = corrigé officiel.
-- ============================================================

ALTER TABLE public.rq_questions ADD COLUMN IF NOT EXISTS source TEXT;

INSERT INTO public.rq_questions (category_id, type, question, expected_answer, explanation, difficulty, source)
VALUES
-- §1 Réserve technique
((SELECT id FROM public.rq_categories WHERE law_number='Loi 5'), 'open',
 'Des dirigeants, conscients que la réserve technique déposée contre leur équipe est fondée, s''arrangent dès le coup de sifflet final pour faire disparaître leur capitaine et lui éviter la signature de la feuille de match. Que doit faire l''arbitre ?',
 'Dès la fin de la rencontre, l''arbitre demande aux capitaines de venir signer la feuille de match. Constatant l''absence du capitaine, il le mentionne sur la feuille de match et dans son rapport.',
 NULL, 2, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 5'), 'open',
 '45e minute, coup franc direct pour A. Au signal, le tireur botte ; l''arbitre siffle car un défenseur de B s''est approché à moins de 9,15 m, mais le but est marqué directement et l''arbitre l''accorde, puis renvoie aux vestiaires. a) Au coup d''envoi de la 2e période, B dépose une réserve technique sur ce but. Décisions ? b) Idem si c''était un penalty ? c) Quand la réserve doit-elle être déposée pour être recevable ?',
 'L''arbitre accepte le dépôt. a) Le coup d''envoi de la seconde période ne peut pas être considéré comme le 1er arrêt de jeu consécutif au coup de sifflet de fin de 1re période. b) Décision identique sur penalty. c) Pour être recevable, la réserve technique doit être déposée dès le coup de sifflet de fin de la 1re période et avant que les deux équipes aient quitté le terrain.',
 NULL, 3, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 5'), 'open',
 'Lorsqu''un arbitre fait une faute technique en reprenant le jeu par une balle à terre, à quel moment un capitaine peut-il déposer une réserve technique pour qu''elle soit recevable ?',
 'La réserve technique doit être déposée avant que l''arbitre effectue la balle à terre.',
 NULL, 2, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 5'), 'open',
 'Ballon en jeu, le gardien de A tient le ballon en mains. L''arbitre autorise un remplacement de B sans coup de sifflet, puis indique au gardien de reprendre (toujours sans sifflet) ; le gardien dégage. B dépose une réserve sur cette reprise. Quand doit-elle être déposée pour être recevable ?',
 'Cela ne peut être qu''à l''arrêt de jeu suivant le dégagement du gardien, puisque le jeu n''a pas été arrêté.',
 NULL, 2, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 5'), 'open',
 'Le capitaine se blesse et sort se faire soigner ; l''arbitre, estimant la sortie brève, n''impose pas la nomination d''un nouveau capitaine. Pendant son absence, une réserve technique est déposée. Décisions ?',
 'L''arbitre fait respecter la procédure de dépôt. Si le capitaine blessé peut procéder au dépôt, l''arbitre enregistre la réserve en sa présence. Sinon, il demande à l''équipe concernée de désigner un capitaine pour la circonstance.',
 NULL, 2, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 5'), 'open',
 'Une réserve technique est déposée en 1re période (capitaine A, en présence du capitaine B et de l''assistant le plus proche). Qui doit signer la feuille de match si l''un des capitaines est exclu en 2e période ou après le coup de sifflet final (et même question en compétition "jeunes") ?',
 'L''arbitre fait signer les personnes présentes (capitaines, dirigeants, arbitres) au moment du dépôt. En cas d''absence de l''une d''elles, celles qui les ont remplacées contresignent la réserve. L''arbitre mentionne dans son rapport les explications permettant de comprendre pourquoi la réserve est signée par des personnes non présentes au moment du dépôt.',
 NULL, 3, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 5'), 'open',
 'Une équipe "jeunes" se déplace uniquement avec un entraîneur licencié majeur, qui est exclu par l''arbitre avant la rencontre. Qui peut déposer une réserve technique (ou tout autre type de réserve) ?',
 'Dans ce contexte particulier, l''entraîneur exclu conserve ses fonctions administratives et c''est lui qui déposera la réserve.',
 NULL, 2, 'CFA/DA Juillet 2025'),

-- §2 Joueur blessé
((SELECT id FROM public.rq_categories WHERE law_number='Loi 5'), 'open',
 'Dans un choc sans faute entre un gardien et un joueur de champ, les deux sont blessés. Décisions ?',
 'Le gardien et le joueur de champ peuvent être tous deux soignés sur le terrain et reprendre le jeu immédiatement. Toutefois, si les soins du joueur de champ se prolongent après le rétablissement du gardien, l''arbitre fera sortir ce joueur afin de faire reprendre le jeu rapidement.',
 NULL, 2, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 5'), 'open',
 'Lors d''un duel gardien/attaquant, l''arbitre siffle une faute contre l''attaquant ; les deux nécessitent des soins. Décisions et explications ?',
 'Le gardien pourra être soigné sur le terrain. L''attaquant doit obligatoirement sortir du terrain, même si ses soins peuvent être terminés avant ou en même temps que ceux du gardien. Coup franc direct pour l''équipe du gardien à l''endroit de la faute, sous réserve de la procédure de la Loi 13. (La faute sanctionnée, avec ou sans avertissement, entraîne une obligation de sortie pour soins, contrairement à une simple collision.)',
 NULL, 3, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 5'), 'open',
 'Deux adversaires se blessent, le jeu est arrêté, les soigneurs les évacuent sur civière. L''entraîneur de l''un demande à faire entrer un remplaçant à sa place. Décisions ?',
 'Le remplacement est accepté : l''obligation d''attendre la reprise du jeu pour revenir ne s''applique qu''au joueur blessé préalablement sorti, et non à son remplaçant, qui peut entrer immédiatement avec l''autorisation de l''arbitre.',
 NULL, 2, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 5'), 'open',
 'Quelle est la procédure lorsqu''un joueur refoulé pour saignement demande à revenir sur le terrain ?',
 'Le joueur peut revenir avec l''accord de l''arbitre, qui vérifie lors d''un arrêt de jeu la fin du saignement. Cela peut aussi se faire pendant le jeu après vérification par l''arbitre assistant ou, le cas échéant, par le 4e arbitre, qui indique à l''arbitre que le saignement est stoppé.',
 NULL, 2, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 5'), 'open',
 'Quelle est la durée maximale d''interruption lorsqu''une blessure importante nécessite l''intervention de secours extérieurs sur le terrain ?',
 'Le délai d''interruption prévu pour les intempéries ou pannes d''éclairage (45 minutes) ne s''applique pas. Le délai est laissé à l''appréciation de l''arbitre, qui doit prendre en compte la possibilité ou non de mener la rencontre à son terme.',
 NULL, 2, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 5'), 'open',
 'Que doit faire l''arbitre dans le cas d''une "mini blessure" où le joueur s''approche de la ligne de touche et se fait administrer un peu de bombe, alors que le jeu se déroule ?',
 'Cela n''ayant aucune interférence avec le jeu, l''arbitre tolère et n''intervient pas : selon la Loi 5, les décisions arbitrales reposent sur son opinion et il prend les mesures appropriées dans le cadre des Lois du Jeu.',
 NULL, 1, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 5'), 'open',
 '75e minute, ballon en jeu : le n°11A se rapproche de son banc sans sortir du terrain, se plaignant du mollet, et se fait administrer des soins par-dessus la ligne de touche. Le ballon passe près de lui, il le récupère et marque pour son équipe. Décisions ?',
 'But refusé. Si l''arbitre avait donné l''autorisation de sortir : avertissement au n°11A pour comportement antisportif. Si le joueur n''avait pas demandé l''autorisation de sortir : mise en garde du n°11A. Coup franc indirect pour l''équipe B à l''endroit où le joueur a récupéré le ballon.',
 NULL, 3, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 5'), 'open',
 '75e minute, ballon en jeu : le gardien de A, soigné par-dessus la ligne de but sans sortir du terrain, voit l''attaquant n°9B frapper en pleine lucarne ; il se précipite et détourne en corner. Décisions ?',
 'Corner.',
 NULL, 2, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 5'), 'open',
 'Le n°7A est blessé et le n°2B est averti suite à sa faute. Alors que le n°7A se fait soigner sur le terrain, il faut aussi soigner le n°2B. Ce dernier pourra-t-il reprendre dans les mêmes conditions que le n°7A ?',
 'Non : la reprise immédiate du jeu pour le joueur blessé ne concerne que le cas où l''adversaire a été averti. Le fautif n''entre pas dans cette application : le n°2B devra quitter le terrain, attendre que le jeu soit repris et, après le signal de l''arbitre, pourra reprendre part au jeu.',
 NULL, 3, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 5'), 'open',
 'Une équipe "jeunes" se déplace uniquement avec un entraîneur majeur licencié, exclu avant la rencontre. Qui pourra soigner un joueur blessé de son équipe en cas de nécessité ?',
 'L''arbitre sera dans l''obligation de faire revenir cette personne et de l''autoriser à apporter des soins au joueur blessé ; elle devra ensuite quitter à nouveau le terrain.',
 NULL, 2, 'CFA/DA Juillet 2025'),

-- §3 Approche disciplinaire
((SELECT id FROM public.rq_categories WHERE law_number='Loi 5'), 'open',
 'Le n°7A tacle irrégulièrement le n°8B qui réplique d''un coup de pied : l''arbitre montre le rouge aux deux. Au même moment l''assistant procède au remplacement du n°8B par le n°13B sans savoir qu''il venait d''être exclu. Le jeu reprend par un coup franc direct ; plus tard le capitaine A signale que B joue à 11. Décisions et explications ?',
 'Annulation du remplacement (le n°13B doit quitter le terrain, sans avertissement car c''est une erreur des arbitres) ; il pourra remplacer ultérieurement un partenaire. L''équipe B continue obligatoirement à 10. Reprise consécutive à l''arrêt. Rapport.',
 NULL, 3, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 5'), 'open',
 'Un défenseur commet une faute passible d''un avertissement ; l''arbitre laisse l''avantage, le ballon revient à un autre attaquant, et le même défenseur commet une nouvelle faute passible d''un avertissement sur ce second attaquant. Décisions et explications ?',
 'Arrêt du jeu. Si la 1re faute consistait à perturber/stopper une attaque prometteuse : le défenseur n''est pas averti pour la 1re, il reçoit l''avertissement uniquement pour la 2e. Si la 1re faute nécessitait un avertissement : l''arbitre indique clairement les deux fautes (deux cartons jaunes successifs) puis présente le carton rouge (exclusion). Coup franc direct pour l''équipe attaquante à l''endroit de la 2e faute, ou penalty si commise dans la surface du défenseur. Rapport en cas d''exclusion.',
 NULL, 3, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 5'), 'open',
 'L''arbitre découvre qu''une équipe est à 12 ; le joueur supplémentaire est le capitaine (l''équipe a changé de capitaine en cours de match, ce joueur ayant reçu le brassard en cours de match et n''étant pas capitaine au début). Décisions et explications ?',
 'Le joueur supplémentaire recevra un avertissement pour avoir pénétré sans autorisation. Dans le cas d''une équipe comportant un joueur supplémentaire, l''avertissement au capitaine n''apparaît plus dans les textes de Loi.',
 NULL, 3, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 5'), 'open',
 'Un but doit être refusé (ex. but marqué de la main) mais l''arbitre ne voit pas la faute et siffle la fin de la période ; l''assistant concerné l''appelle alors. Décisions et explications selon le moment ?',
 'Fin de la 1re période, fin du match avant la prolongation, ou fin de la 1re période de prolongation : l''arbitre peut revenir sur sa décision tant qu''il n''a pas quitté le terrain → but refusé, avertissement au buteur, fin de la période. Fin de la rencontre (sans prolongation ni tirs au but) : l''arbitre ne peut pas revenir sur sa décision même s''il est encore sur le terrain → le but reste validé. Fin de la 2e période de prolongation avec tirs au but à suivre : l''arbitre peut revenir sur sa décision → but refusé, avertissement au buteur, fin de la période.',
 NULL, 3, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 5'), 'open',
 'Le ballon est dévié en corner par le défenseur n°5, replié sur sa ligne de but entre les montants. L''arbitre siffle la fin de la 1re période ; c''est après avoir quitté le terrain que l''assistant l''informe que le n°5 a détourné délibérément le ballon de la main, empêchant un but. Décisions ?',
 'L''assistant ne s''étant pas manifesté immédiatement et l''arbitre ayant quitté le terrain, la faute de main du n°5 ne peut plus être sanctionnée techniquement. En revanche, le n°5 sera exclu pour avoir empêché un but d''être marqué en commettant une main.',
 NULL, 3, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 5'), 'open',
 'L''équipe A donne le coup d''envoi initial, puis redonne le coup d''envoi au début de la 2e période (à tort). Quelques secondes après (sans arrêt de jeu), l''arbitre exclut le n°5B pour avoir annihilé une occasion manifeste de but. B veut déposer une réserve technique sur ce coup d''envoi. Décisions ? (Et si l''exclusion était pour faute grossière ?)',
 'Pour une faute grossière ou un acte de brutalité, l''arbitre maintiendra l''exclusion. Mais si le joueur a simplement annihilé une occasion manifeste de but, il ne recevra aucune sanction disciplinaire puisque le but n''aurait pas pu être validé. L''arbitre fera recommencer la seconde période en donnant le coup d''envoi à l''équipe B.',
 NULL, 3, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 5'), 'open',
 'Le n°5A est averti en 1re période. À la 60e, il commet une faute passible d''un avertissement sur le n°9B qui se dirige vers le but ; l''arbitre laisse l''avantage, le n°9B tire, le gardien A capte et dégage vers le n°5A. Décisions et explications ?',
 'Si la faute consistait à perturber/stopper une attaque prometteuse : le n°5A ne sera pas averti, l''arbitre laisse le jeu se poursuivre. Si la faute nécessitait un avertissement : arrêt du jeu (la Loi 12, chapitre avantage, impose d''interrompre le jeu lorsque le fautif interfère à nouveau, pour l''exclure au titre d''un second avertissement) ; coup franc indirect pour l''équipe B à l''endroit où le n°5A interfère dans le jeu, sous réserve de la procédure de la Loi 13 ; rapport.',
 NULL, 3, 'CFA/DA Juillet 2025'),

-- §4 Questions diverses
((SELECT id FROM public.rq_categories WHERE law_number='Loi 5'), 'open',
 'Le capitaine est exclu. Qui doit le remplacer ?',
 'L''arbitre demande aux joueurs de l''équipe concernée de désigner un nouveau capitaine. À défaut, l''arbitre désignera lui-même ce nouveau capitaine.',
 NULL, 1, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 5'), 'open',
 'Un joueur empêche volontairement de la main un but adverse. L''arbitre, qui a vu la faute, accorde le penalty mais n''arrive pas à identifier le véritable fautif. Décisions et explications ?',
 'Selon la Loi 3, le capitaine est, dans une certaine mesure, responsable du comportement de son équipe : l''arbitre le place face à ses responsabilités en lui demandant de désigner le partenaire fautif. En cas de refus : il est d''abord averti pour comportement antisportif ; s''il persiste, second avertissement pour comportement antisportif → exclusion (deux avertissements), nomination d''un nouveau capitaine. En tout état de cause, l''équipe du joueur fautif ne pourra reprendre le jeu qu''à 10. Rapport en cas d''exclusion. Mêmes dispositions lorsque c''est l''assistant qui voit la faute sans pouvoir identifier le fautif.',
 NULL, 3, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 5'), 'open',
 'L''arbitre n''identifie pas l''auteur d''un acte de brutalité ; il s''adresse au capitaine qui refuse de le signaler et qui, persistant, est averti puis exclu. Avant la reprise, le fautif se dénonce. Décisions et explications ?',
 'Le jeu n''ayant pas encore repris, l''arbitre exclut le vrai coupable et retire l''exclusion infligée au capitaine. Toutefois, le comportement du capitaine ne peut être totalement "blanchi" : l''arbitre maintient le 1er avertissement pour comportement antisportif. Le capitaine reprend donc sa place.',
 NULL, 3, 'CFA/DA Juillet 2025')
;
