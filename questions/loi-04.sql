-- ============================================================
-- RefQuiz — Questions Loi 4 (L'équipement des joueurs)
-- Source : CFA/DA — Section "Lois du Jeu" — Questions/Réponses — Juillet 2025
-- Format : questions ouvertes (évaluées par IA), réponses = corrigé officiel.
-- ============================================================

ALTER TABLE public.rq_questions ADD COLUMN IF NOT EXISTS source TEXT;

INSERT INTO public.rq_questions (category_id, type, question, expected_answer, explanation, difficulty, source)
VALUES
-- §1 L'équipement
((SELECT id FROM public.rq_categories WHERE law_number='Loi 4'), 'open',
 'Le gardien de but a un maillot de couleur identique à celui de l''arbitre ou des arbitres assistants. Qui doit en changer ?',
 'Le gardien de but, conformément à la Loi 4.',
 NULL, 1, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 4'), 'open',
 'Quelles sont les caractéristiques du brassard du capitaine ?',
 'Le capitaine doit porter le brassard fourni ou autorisé par l''organisateur de la compétition, ou un brassard d''une seule couleur sur lequel pourra figurer le mot « capitaine » (ou sa traduction) ou la lettre « C » ; ces inscriptions devront être d''une seule couleur.',
 NULL, 1, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 4'), 'open',
 'Les deux gardiens de but peuvent-ils jouer avec un maillot de couleur identique ?',
 'La Loi 4 prévoit que les gardiens évoluent dans des couleurs différentes. Toutefois, si dans des circonstances particulières cette obligation s''avère difficile à respecter (équipement à plusieurs couleurs dominantes, dotation de maillots type Coupe de France, etc.), l''arbitre tolèrera que les deux gardiens jouent dans les mêmes couleurs. Il devra alors redoubler de vigilance si l''un des gardiens vient à évoluer dans la surface de réparation adverse.',
 NULL, 2, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 4'), 'open',
 'L''arbitre constate qu''un joueur possède des chaussettes trouées. Décisions ?',
 'Si l''arbitre s''en rend compte avant le match ou à la mi-temps : il interdit au joueur de participer ainsi et l''invite à changer de chaussettes. S''il s''en rend compte en cours de match : il n''arrête pas le jeu et laisse le joueur poursuivre ainsi.',
 NULL, 2, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 4'), 'open',
 'Quelle attitude adopter concernant le port des bijoux ?',
 'Tous les bijoux, même protégés par un strap, sont interdits pour les matches de la Fédération. Dans les compétitions de Ligue et de District, seul le port des alliances est toléré, à condition qu''elles soient protégées.',
 NULL, 1, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 4'), 'open',
 'À la suite d''une blessure, un joueur blessé est-il autorisé à porter des protections ?',
 'Oui, sous réserve que le dispositif ne présente aucun danger pour les autres joueurs. Il est nécessaire que l''arbitre soit informé suffisamment tôt de la demande afin qu''il puisse vérifier la conformité du dispositif.',
 NULL, 2, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 4'), 'open',
 'Une équipe dispose d''un jeu de maillots à manches courtes. En raison du froid, des joueurs revêtent des maillots à manches longues en dessous. Les manches longues doivent-elles toutes être de la même couleur ?',
 'Oui : conformément aux Lois du Jeu IFAB, les joueurs ne peuvent participer que si les manches longues sont toutes de la même couleur et correspondent à la couleur principale des manches du maillot à manches courtes (ou reprennent à l''identique le motif/les couleurs des manches du maillot).',
 NULL, 2, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 4'), 'open',
 'Quelle(s) décision(s) doit prendre l''arbitre si un capitaine ne peut pas ou ne veut pas porter de brassard ?',
 'Chaque équipe doit désigner un capitaine identifiable par un brassard. Si le capitaine refuse de porter le brassard ou l''enlève pendant le match, l''arbitre ne permet pas le début ou la reprise du jeu tant que les deux capitaines ne portent pas leur brassard. Il appartient à l''équipe ou à l''entraîneur de s''assurer qu''un joueur porte le brassard et occupe le rôle de capitaine.',
 NULL, 2, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 4'), 'open',
 'Match de Coupe de France par grand froid : pendant l''épreuve des tirs au but, de nombreux joueurs "frigorifiés" dans le rond central se couvrent d''un anorak. Décisions ?',
 'L''arbitre autorise le port de l''anorak. Mais tout joueur qui vient exécuter un tir au but devra, à ce moment-là, retirer l''anorak afin d''avoir une tenue conforme à la Loi 4.',
 NULL, 2, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 4'), 'open',
 'Une personne inscrite à la fois comme entraîneur et comme remplaçant peut-elle être en costume sur le banc de touche, ou doit-elle être en tenue sportive ?',
 'Étant clairement identifiée et susceptible d''entrer en jeu à tout moment, cette personne est obligée d''être en tenue sportive sur le banc de touche.',
 NULL, 1, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 4'), 'open',
 'Lors de la vérification de l''équipement, l''arbitre constate qu''un joueur porte des chaussettes coupées. Décisions ?',
 'L''arbitre permet au joueur de participer à condition que l''équipement situé sous les chaussettes coupées soit de la même couleur que celles-ci. Si un ruban adhésif est utilisé, il doit être de la couleur de la partie de la chaussette sur laquelle il est appliqué ou qu''il couvre.',
 NULL, 2, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 4'), 'open',
 'Un joueur se blesse, présente une plaie qui saigne, son maillot est maculé de sang ; l''arbitre l''invite à sortir pour en changer. Quelques minutes plus tard, lors d''un arrêt de jeu, il demande à revenir. Décisions ?',
 'Si le joueur ne saigne plus, l''arbitre autorise son retour à condition qu''il ait changé de maillot et qu''une vérification ait été effectuée préalablement par l''un des arbitres. Ces conditions remplies, l''arbitre peut autoriser le retour pendant le jeu.',
 NULL, 2, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 4'), 'open',
 'Un capitaine porte un brassard non conforme. Quelle décision doit prendre l''arbitre ?',
 'Dans les compétitions nationales, le capitaine doit porter le brassard fourni/autorisé par l''organisateur ou un brassard d''une seule couleur (caractéristiques définies par la Loi 4). Dans les compétitions de Ligue et District, si le brassard n''est pas conforme mais permet tout de même d''identifier le capitaine (ex. un morceau de tissu noué autour du bras), l''arbitre doit faire preuve de souplesse, respecter l''esprit du jeu et autoriser son utilisation et la participation à la rencontre.',
 NULL, 2, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 4'), 'open',
 'L''arbitre vérifie l''équipement des remplaçants avant leur entrée. Est-il chargé de contrôler la taille et le matériau de leurs protège-tibias ?',
 'Les protège-tibias sont obligatoires pour tous les joueurs et l''arbitre doit vérifier qu''ils sont portés et couverts par les chaussettes. Cependant, il appartient à chaque joueur de s''assurer que la taille et le matériau de ses protège-tibias offrent une protection adéquate.',
 NULL, 2, 'CFA/DA Juillet 2025'),

-- §2 Équipement non-conforme en cours de jeu
((SELECT id FROM public.rq_categories WHERE law_number='Loi 4'), 'open',
 'Ballon en jeu. Un joueur de A tient à la main une chaussure (ou un protège-tibia) qu''il vient de perdre ; au moment où il tente de se rechausser, le ballon arrive et il dispute un ballon aérien à un adversaire, équipement à la main. Décisions et explications ?',
 'Un joueur perdant accidentellement une chaussure ou un protège-tibia peut continuer à jouer jusqu''au prochain arrêt de jeu : l''arbitre laisse le jeu se dérouler. Si un but est marqué, pour ou contre l''équipe de ce joueur, il sera accordé.',
 NULL, 2, 'CFA/DA Juillet 2025'),

-- §3 Joueur refoulé pour mise en conformité, revenant sans autorisation
((SELECT id FROM public.rq_categories WHERE law_number='Loi 4'), 'open',
 'L''arbitre a fait quitter le terrain à un joueur pour mise en conformité (Loi 4). Le joueur revient sans autorisation et l''arbitre constate immédiatement sa présence, sans qu''il interfère avec le jeu. Décisions ?',
 'L''arbitre n''est pas tenu d''arrêter immédiatement le jeu. Au premier arrêt de jeu, dans tous les cas : avertissement pour être revenu sans autorisation ; vérification de l''équipement et le faire quitter le terrain s''il n''est toujours pas conforme. S''il siffle prématurément : coup franc indirect pour l''adverse à l''endroit du ballon au moment de l''arrêt, sous réserve de la procédure de la Loi 13.',
 NULL, 2, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 4'), 'open',
 'Un joueur refoulé pour mise en conformité (Loi 4) revient sans autorisation. Décisions si : a) il touche le ballon de la main et tente d''empêcher un but contre son camp sans y parvenir ; b) il touche du pied et empêche le but en le détournant en corner ; c) il marque dans le camp adverse ; d) il commet une faute ?',
 'Dans tous les cas, avertissement pour être entré sans autorisation (donné au 1er arrêt si l''arbitre laisse jouer) et le faire quitter le terrain (retour possible ensuite avec accord de l''arbitre). a) But accordé ; 2e avertissement pour comportement antisportif → exclusion (deux avertissements) ; coup d''envoi. (Si le but n''avait pas été marqué : exclusion directe pour avoir anéanti une occasion de but manifeste, penalty.) b) Exclusion pour avoir annihilé une occasion de but manifeste ; coup franc direct pour l''adverse à l''endroit du joueur, ou penalty. c) Coup franc direct pour l''adverse à l''endroit du joueur, sous réserve de la procédure de la Loi 13. d) Sanction disciplinaire selon la gravité (si avertissement pour comportement antisportif → exclusion pour deux avertissements) ; coup franc direct pour l''adverse à l''endroit de la faute, ou penalty ; rapport en cas d''exclusion.',
 NULL, 3, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 4'), 'open',
 'A bénéficie d''un penalty (faute du n°5B sur le n°7A). Avant le tir, le capitaine B signale que le n°7A, refoulé pour infraction à la Loi 4, était rentré à son insu et jouait depuis 5 minutes. Décisions et explications ?',
 'Avertissement au n°7A pour être revenu sans autorisation ; vérification de son équipement et le faire quitter le terrain s''il n''est pas conforme. L''infraction étant constituée au moment où l''arbitre s''en aperçoit, il ne peut pas reprendre par le penalty consécutif à la faute sur le n°7A : il doit sanctionner la présence non autorisée. Coup franc direct pour B à l''endroit où ce joueur a interféré lors de la faute, sous réserve de la procédure de la Loi 13.',
 NULL, 3, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 4'), 'open',
 'Un joueur de A refoulé (Loi 4) revient sans autorisation et marque pour son équipe. Sur le coup d''envoi, B botte en touche et son capitaine signale la présence du joueur entré sans autorisation. Décisions et explications ?',
 'Avertissement au joueur pour être revenu sans autorisation ; vérification de l''équipement et le faire quitter le terrain s''il n''est pas conforme. L''arbitre ne peut plus revenir sur le but accordé car le coup d''envoi a été effectué. Le ballon étant sorti et le jeu n''ayant pas été arrêté avant, reprise par la rentrée de touche.',
 NULL, 3, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 4'), 'open',
 'Un joueur refoulé momentanément (Loi 4) rentre à l''insu de l''arbitre et effectue une rentrée de touche ; le ballon, dévié par un autre joueur, pénètre dans le but adverse. Décisions et explications ?',
 'But refusé. Avertissement au joueur pour être revenu sans autorisation ; vérification de l''équipement et le faire quitter le terrain s''il n''est pas conforme. Coup franc direct pour l''équipe adverse sur la ligne de touche.',
 NULL, 2, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 4'), 'open',
 '28e minute : le n°6A, autorisé à sortir changer de chaussures, revient sans autorisation à la 32e et marque contre son camp, soit sur une action normale, soit sur un coup franc direct. Décisions et explications ?',
 'Dans tous les cas : avertissement au n°6A pour être entré sans autorisation ; vérification de l''équipement et le faire quitter le terrain s''il n''est pas conforme. But contre son camp sur action normale de jeu : but accordé, coup d''envoi. But marqué directement contre son camp sur un coup franc direct (le joueur ayant interféré) : but non validé, coup franc direct pour l''équipe B à l''endroit du coup franc initial, ou penalty.',
 NULL, 3, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 4'), 'open',
 'Le ballon sort en ligne de but en faveur de A. L''arbitre constate alors qu''un joueur de A, refoulé pour mise en conformité (Loi 4), est sur le terrain sans autorisation. Décisions ?',
 'Avertissement au joueur pour être entré sans autorisation ; vérification de l''équipement et le faire quitter le terrain s''il n''est pas conforme. Si A est défendante : pas d''interférence → coup de pied de but ; interférence → coup franc direct pour B à l''endroit de l''interférence, ou penalty. Si A est attaquante : pas d''interférence → corner ; interférence → coup franc direct pour B à l''endroit de l''interférence, sous réserve de la procédure de la Loi 13.',
 NULL, 3, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 4'), 'open',
 'Refoulé pour mise en conformité (Loi 4), un joueur rentre sans autorisation et commet une faute passible d''un avertissement pour comportement antisportif. Décisions ?',
 'Arrêt du jeu. Le joueur est averti une 1re fois pour être revenu sans autorisation et une 2e fois pour le comportement antisportif → exclusion pour deux avertissements. Coup franc direct à l''endroit de la faute, ou penalty. Rapport.',
 NULL, 2, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 4'), 'open',
 'B bénéficie d''un penalty (faute du n°5A sur le n°10B). Avant le tir, l''arbitre s''aperçoit que le n°6B, refoulé pour infraction à la Loi 4, est revenu sans son autorisation. Décisions ?',
 'Avertissement au n°6B pour être revenu sans autorisation ; le faire quitter le terrain si son équipement n''est toujours pas conforme. Si le n°6B a interféré : coup franc direct pour l''équipe A à l''endroit où il a interféré, sous réserve de la procédure de la Loi 13. S''il n''a pas interféré : penalty pour l''équipe B.',
 NULL, 3, 'CFA/DA Juillet 2025'),

-- §4 Questions diverses
((SELECT id FROM public.rq_categories WHERE law_number='Loi 4'), 'open',
 'L''arbitre a donné le coup d''envoi après avoir interdit un joueur à l''équipement non conforme. Alors que A a le ballon au centre, ce joueur (qui attend la vérification de sa tenue) échange des coups avec une ou plusieurs personnes du banc adverse. Décisions ?',
 'Exclusion du joueur en question et de la (des) personne(s) du banc pour actes de brutalité ; son équipe continue à 10. Reprise : si l''arbitre ne sait pas qui a commencé → balle à terre donnée à un joueur de A à l''endroit de l''arrêt ; si le joueur est à l''origine → sous réserve de l''avantage, arrêt du jeu, coup franc direct pour l''adverse sur la ligne de touche au plus proche de la victime ; si une personne du banc est à l''origine → sous réserve de l''avantage, arrêt du jeu, coup franc direct pour l''adverse sur la ligne de touche au plus proche de la victime. Rapport.',
 NULL, 3, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 4'), 'open',
 'À la fin d''un match, des joueurs enlèvent leurs maillots pour les échanger ; l''un en profite pour dévoiler des slogans provocateurs, politiques ou racistes. Comment doit agir l''arbitre ?',
 'L''arbitre applique la Loi 12 : un joueur qui tient des propos / fait des gestes blessants, injurieux et/ou grossiers doit être exclu ; un joueur qui fait des gestes provocateurs, moqueurs ou offensants doit être averti. Tout slogan, déclaration ou image entrant dans ces catégories n''est pas autorisé : le joueur doit être exclu.',
 NULL, 2, 'CFA/DA Juillet 2025')
;
