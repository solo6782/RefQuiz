-- RefQuiz : ré-import verbatim Loi 4 depuis CFA/DA Juillet 2025
-- Source : cfa-da-qr-loi-4-juillet-2025.pdf
-- 26 questions (IDs 71-96)
-- À exécuter dans le SQL Editor de Supabase

BEGIN;

-- §1 L’équipement

UPDATE public.rq_questions SET
  question = 'Le gardien de but a un maillot de couleur identique à celui de l’arbitre ou des arbitres assistants. Qui doit en changer ?',
  expected_answer = 'Le gardien, conformément à la Loi 4.'
WHERE id = 71;

UPDATE public.rq_questions SET
  question = 'Quelles sont les caractéristiques du brassard du capitaine ?',
  expected_answer = 'Le capitaine de l’équipe doit porter le brassard fourni ou autorisé par l’organisateur de la compétition concernée ou un brassard d’une seule couleur sur lequel pourra figurer le mot « capitaine », une traduction de ce mot ou encore la lettre « C » ; ces inscriptions devront être d’une seule couleur.'
WHERE id = 72;

UPDATE public.rq_questions SET
  question = 'Les deux gardiens de but peuvent-ils jouer avec un maillot de couleur identique ?',
  expected_answer = 'La Loi 4 prévoit que les gardiens de but évoluent dans des couleurs différentes. Cependant, si dans des circonstances particulières, cette obligation s’avérait difficile à respecter (exemple : équipement à plusieurs couleurs dominantes, dotation de maillots à l’occasion de certaines compétitions : Coupe de France, …), l’arbitre tolèrera que les deux gardiens de but jouent dans les mêmes couleurs.
Dans ce cas, l’arbitre devra redoubler de vigilance, dans l’hypothèse où l’un des gardiens viendrait à évoluer dans la surface de réparation adverse.'
WHERE id = 73;

UPDATE public.rq_questions SET
  question = 'L’arbitre constate qu’un joueur possède des chaussettes trouées. Décisions ?',
  expected_answer = 'Si l’arbitre s’en rend compte avant le match ou à la mi-temps : il interdira au joueur de participer ainsi à la rencontre et l’invitera à changer de chaussettes.
Si l’arbitre s’en rend compte en cours de match : il n’arrêtera pas le jeu. Il laissera le joueur poursuivre la rencontre ainsi.'
WHERE id = 74;

UPDATE public.rq_questions SET
  question = 'Quelle attitude adopter en ce qui concerne le port des bijoux ?',
  expected_answer = 'Tous les bijoux même protégés par un strap sont interdits pour les matchs de la Fédération. Dans les compétitions de Ligue et de District, seul le port des alliances est toléré à condition qu’elles soient protégées.'
WHERE id = 75;

UPDATE public.rq_questions SET
  question = 'À la suite d’une blessure, un joueur blessé est-il autorisé à porter des protections ?',
  expected_answer = 'Le port de protections permettant, à un joueur blessé de participer à une rencontre, est autorisé sous réserve que ce dispositif ne présente aucun danger pour les autres joueurs. Dans ce cas de figure, il est nécessaire que l’arbitre soit informé d’une telle demande suffisamment tôt afin qu’il puisse vérifier la conformité du dispositif.'
WHERE id = 76;

UPDATE public.rq_questions SET
  question = 'Une équipe dispose d’un jeu de maillots à manches courtes. En raison du froid, des joueurs revêtent des maillots manches longues en dessous de leur maillot. Les manches longues de ces maillots devront-elles toutes être de la même couleur ?',
  expected_answer = 'En conformité avec les Lois du jeu IFAB, les joueurs ne pourront participer à la rencontre que si les manches longues de leur maillot sont toutes de la même couleur et qu’elles correspondent à la couleur principale des manches du maillot à manches courte ou d’un motif ou de couleurs reprenant à l’identique celui/celles des manches du maillot.'
WHERE id = 77;

UPDATE public.rq_questions SET
  question = 'Quelle(s) décision(s) doit prendre l’arbitre si un capitaine ne peut pas ou ne veut pas porter de brassard ?',
  expected_answer = 'Chaque équipe doit désigner un capitaine sur le terrain, identifiable par un brassard. Si le capitaine refuse de porter le brassard ou l’enlève pendant le match, l’arbitre ne permettra pas le début ou la reprise du jeu tant que les deux capitaines ne portent pas leur brassard.
Il est de la responsabilité de l’équipe ou de l’entraîneur de s’assurer qu’un joueur porte le brassard et occupe ainsi le rôle de capitaine.'
WHERE id = 78;

UPDATE public.rq_questions SET
  question = 'Dans un match de Coupe de France joué par grand froid, de nombreux joueurs, "frigorifiés" dans le rond central, se couvrent d’un anorak pendant l’épreuve des tirs au but. Décisions ?',
  expected_answer = 'L’arbitre autorisera le port de l’anorak. Mais il est bien entendu que tout joueur qui vient exécuter un tir au but devra, à ce moment-là, retirer l’anorak afin d’avoir une tenue conforme à la Loi 4.'
WHERE id = 79;

UPDATE public.rq_questions SET
  question = 'Une personne inscrite à la fois comme entraîneur et comme remplaçant peut-elle être en costume sur le banc de touche pendant la rencontre ou doit-elle être en tenue sportive ?',
  expected_answer = 'Cette personne, clairement identifiée et susceptible d’entrer en jeu à n’importe quel moment, est obligée d’être en tenue sportive sur le banc de touche.'
WHERE id = 80;

UPDATE public.rq_questions SET
  question = 'Lors de la vérification de l’équipement, l’arbitre constate qu’un joueur porte des chaussettes coupées. Décisions ?',
  expected_answer = 'L’arbitre permettra au joueur de participer à la rencontre à condition que l’équipement situé sous les chaussettes coupées soit de la même couleur que celles-ci.
Si un ruban adhésif est utilisé, celui doit être de la couleur que la partie de la chaussette sur laquelle il est appliqué ou qu’il couvre.'
WHERE id = 81;

UPDATE public.rq_questions SET
  question = 'Un joueur se blesse sur une action de jeu. L’arbitre interrompt le jeu et se rend compte que le joueur présente une plaie qui saigne et son maillot est maculé de sang. Il l’invite donc à sortir du terrain pour en changer. Le jeu reprend et quelques minutes plus tard, lors d’un nouvel arrêt de jeu, le joueur blessé demande à revenir sur le terrain. Décisions ?',
  expected_answer = 'Si le joueur ne saigne plus, l’arbitre autorisera son retour à condition qu’il ait changé de maillot et qu’une vérification ait été effectuée préalablement par l’un des arbitres.
Si ces conditions ont été respectées, l’arbitre pourra autoriser son retour pendant le jeu.'
WHERE id = 82;

UPDATE public.rq_questions SET
  question = 'Un capitaine porte un brassard non conforme. Quelle décision doit prendre l’arbitre ?',
  expected_answer = 'Dans les compétitions nationales, le capitaine doit porter le brassard fourni ou autorisé par l’organisateur de la compétition concernée ou un brassard d’une seule couleur. Les caractéristiques de ce brassard sont définies dans le texte de la Loi 4.
Dans les compétitions de Ligue et Districts, si le capitaine de l’équipe porte un brassard non conforme à la Loi 4 mais permettant tout de même de l’identifier (par exemple, un morceau de tissu noué autour du bras), l’arbitre doit faire preuve de souplesse en respectant l’esprit du jeu et autoriser son utilisation et sa participation à la rencontre.'
WHERE id = 83;

UPDATE public.rq_questions SET
  question = 'Un arbitre vérifie l’équipement des remplaçants avant qu’ils n’entrent sur le terrain de jeu. L’arbitre est-il chargé de contrôler la taille et le matériau de leurs protège-tibias ?',
  expected_answer = 'Les protège-tibias sont obligatoires pour tous les joueurs, et l’arbitre doit vérifier qu’ils sont portés et couverts par les chaussettes. Cependant, il appartient à chaque joueur de s’assurer que la taille et le matériau de ses protège-tibias offrent une protection adéquate.'
WHERE id = 84;

-- §2 Équipement non-conforme en cours de jeu

UPDATE public.rq_questions SET
  question = 'Ballon en jeu. Un joueur de l’équipe A tient à la main une chaussure (ou un protège-tibia) qu’il vient de perdre. Au moment même où il tente de se rechausser ou de remettre son protège-tibia en place, le ballon arrive dans sa direction. Il continue alors de jouer avec son équipement à la main et dispute un ballon aérien à un adversaire. Décisions et explications ?',
  expected_answer = 'Un joueur perdant accidentellement une chaussure ou un protège-tibia peut continuer à jouer jusqu’au prochain arrêt de jeu. L’arbitre laissera le jeu se dérouler.
Si un but est marqué, pour ou contre l’équipe de ce joueur, il sera accordé.'
WHERE id = 85;

-- §3 Joueur refoulé pour mise en conformité avec la Loi 4, revenant sans autorisation

UPDATE public.rq_questions SET
  question = 'L’arbitre a fait quitter le terrain à un joueur afin qu’il mette son équipement en conformité avec la Loi 4. Ce dernier revient sur le terrain sans autorisation et l’arbitre constate immédiatement sa présence sans qu’il n’interfère dans le jeu. Décisions ?',
  expected_answer = 'L’arbitre n’est pas tenu d’arrêter immédiatement le jeu. Au premier arrêt de jeu, dans tous les cas :
• Avertissement au joueur fautif pour être revenu sur le terrain sans autorisation.
• Vérification de l’équipement. L’arbitre doit lui faire quitter le terrain si celui-ci n’est toujours pas conforme.
S’il venait à siffler prématurément :
• Coup franc indirect pour l’équipe adverse à l’endroit où se trouvait le ballon au moment de l’arrêt, sous réserve de la procédure de la Loi 13.'
WHERE id = 86;

UPDATE public.rq_questions SET
  question = 'Un joueur pénètre sur le terrain sans l’autorisation de l’arbitre après avoir été refoulé pour mettre son équipement en conformité avec la Loi 4. Décisions si :
a) Ce joueur touche le ballon de la main et tente d’empêcher un but contre son camp sans y parvenir ?
b) Ce joueur touche le ballon du pied et empêche le but en le détournant en corner ?
c) Ce joueur marque un but dans le camp adverse ?
d) Ce joueur commet une faute ?',
  expected_answer = 'Dans tous les cas, le joueur est averti pour être entré sans autorisation. Dans le cas où l’arbitre laisse le jeu se dérouler, l’avertissement sera donné au premier arrêt de jeu. L’arbitre doit lui faire quitter le terrain. Une fois le jeu repris, il pourra revenir sur le terrain après avoir reçu l’accord de l’arbitre.
a) But accordé. 2ème avertissement au joueur fautif pour comportement antisportif. Exclusion pour avoir reçu deux avertissements. Coup d’envoi.
Si le but n’avait pas été marqué, ce joueur aurait été exclu directement pour avoir anéanti une occasion de but manifeste. Penalty.
b) Exclusion pour avoir annihilé une occasion de but manifeste.
Coup franc direct pour l’équipe adverse à l’endroit où ce joueur se trouvait ou penalty.
c) Coup franc direct pour l’équipe adverse à l’endroit où ce joueur se trouvait, sous réserve de la procédure de la Loi 13.
d) Sanction disciplinaire selon la gravité de la faute.
Dans le cas où le joueur est averti pour comportement antisportif suite à la faute commise, il sera exclu pour avoir reçu deux avertissements au cours du même match.
Coup franc direct pour l’équipe adverse à l’endroit de la faute ou penalty.
Rapport en cas d’exclusion.'
WHERE id = 87;

UPDATE public.rq_questions SET
  question = 'À la suite d’une faute du joueur n°5B sur le joueur n°7A, l’équipe A bénéficie d’un penalty. Avant l’exécution du tir, le capitaine de l’équipe B fait remarquer à l’arbitre que le joueur n°7A, refoulé pour infraction à la Loi 4, était rentré sur l’aire de jeu à son insu et jouait depuis 5 minutes. Décisions et explications ?',
  expected_answer = '• Avertissement au joueur n°7A pour être revenu sur le terrain sans autorisation.
• Vérification de l’équipement du joueur n°7A. L’arbitre doit lui faire quitter le terrain si celui-ci n’est toujours pas conforme.
• L’infraction est constituée au moment où l’arbitre s’en aperçoit. À partir de ce moment-là, l’arbitre ne peut pas reprendre le jeu par l’exécution de la remise en jeu consécutive à la faute commise sur le joueur n°7A. Il est dans l’obligation de sanctionner la présence non autorisée de ce joueur.
• Coup franc direct pour l’équipe B à l’endroit où ce joueur a interféré lors de la faute, sous réserve de la procédure de la Loi 13.'
WHERE id = 88;

UPDATE public.rq_questions SET
  question = 'Un joueur de l’équipe A, refoulé pour mise en conformité de son équipement avec la Loi 4, revient sur le terrain sans autorisation. Quelques instants plus tard, ce joueur marque un but pour son équipe. Sur le coup d’envoi, l’équipe B botte le ballon en touche et le capitaine de cette équipe interpelle l’arbitre sur la présence du joueur entré sans autorisation. Décisions et explications ?',
  expected_answer = '• Avertissement au joueur pour être revenu sur le terrain sans autorisation.
• Vérification de l’équipement. L’arbitre doit lui faire quitter le terrain si celui-ci n’est toujours pas conforme.
• L’arbitre ne peut plus revenir sur le but accordé car le coup d’envoi a été effectué.
• Le ballon étant sorti et l’arbitre n’ayant pas arrêté le jeu auparavant, il sera repris par la rentrée de touche.'
WHERE id = 89;

UPDATE public.rq_questions SET
  question = 'Un joueur, qui avait été refoulé momentanément pour remettre son équipement en conformité avec la Loi 4, rentre à l’insu de l’arbitre et effectue une rentrée de touche. Le ballon, dévié par un autre joueur, pénètre dans le but adverse. Décisions et explications ?',
  expected_answer = '• But refusé.
• Avertissement à ce joueur pour être revenu sur le terrain sans l’autorisation de l’arbitre.
• Vérification de l’équipement du joueur concerné. L’arbitre doit lui faire quitter le terrain si celui-ci n’est toujours pas conforme.
• Coup franc direct pour l’équipe adverse sur la ligne de touche.'
WHERE id = 90;

UPDATE public.rq_questions SET
  question = 'À la 28ème minute, le joueur n°6A profite d’un arrêt de jeu et demande à l’arbitre pour quitter le terrain afin de changer de chaussures. L’arbitre accepte. À la 32ème minute, l’arbitre constate que ce joueur est revenu sans autorisation et vient de marquer un but contre son camp :
- Sur une action normale de jeu ou
- Sur un coup franc direct
Décisions et explications ?',
  expected_answer = 'Dans tous les cas :
• Avertissement au joueur n°6A pour être entré sur le terrain sans autorisation.
• Vérification de l’équipement. L’arbitre doit lui faire quitter le terrain si celui-ci n’est toujours pas conforme.
• But marqué sur une action normale de jeu : but accordé, coup d’envoi.
• Un but ne peut pas être validé s’il est marqué directement contre son camp sur un coup franc direct et ce joueur ayant interféré dans le jeu : coup franc direct pour l’équipe B à l’endroit du coup franc initial ou penalty.'
WHERE id = 91;

UPDATE public.rq_questions SET
  question = 'Le ballon sort en ligne de but en faveur de l’équipe A. L’arbitre se rend compte à cet instant qu’un joueur de l’équipe A, qu’il avait refoulé précédemment afin de remettre son équipement en conformité avec la Loi 4, se trouve sur le terrain sans avoir reçu son autorisation. Décisions ?',
  expected_answer = '• Avertissement au joueur fautif pour être entré sur le terrain sans autorisation.
• Vérification de l’équipement. L’arbitre doit lui faire quitter le terrain si celui-ci n’est toujours pas conforme.
• L’équipe A est défendante :
   o Si ce joueur n’a pas interféré : coup de pied de but.
   o Si ce joueur a interféré : coup franc direct pour l’équipe B à l’endroit de l’interférence ou penalty.
• L’équipe A est attaquante :
   o Si ce joueur n’a pas interféré : corner.
   o Si ce joueur a interféré : coup franc direct pour l’équipe B à l’endroit de l’interférence, sous réserve de la procédure de la Loi 13.'
WHERE id = 92;

UPDATE public.rq_questions SET
  question = 'Refoulé pour remettre son équipement en conformité avec la Loi 4, un joueur rentre sur le terrain sans autorisation. Il commet une faute passible d’un avertissement pour comportement antisportif. Décisions ?',
  expected_answer = '• Arrêt du jeu.
• Le joueur sera averti une première fois pour être revenu sur le terrain sans autorisation et une seconde fois pour ce comportement antisportif. Il est donc exclu pour avoir reçu deux avertissements.
• Coup franc direct à l’endroit de la faute ou penalty.
• Rapport.'
WHERE id = 93;

UPDATE public.rq_questions SET
  question = 'À la suite d’une faute du joueur n°5A sur le joueur n°10B, l’arbitre accorde un penalty à l’équipe B. Avant l’exécution du penalty, l’arbitre s’aperçoit que le joueur n°6B qui avait été refoulé pour infraction à la Loi 4 est revenu sur le terrain sans son autorisation. Décisions ?',
  expected_answer = '• Avertissement au joueur n°6B pour être revenu sur le terrain sans autorisation. L’arbitre doit lui faire quitter le terrain si celui-ci n’est toujours pas conforme.
• Si le joueur n°6B a interféré : coup franc direct pour l’équipe A à l’endroit où ce joueur à interféré, sous réserve de la procédure de la Loi 13.
• Si le joueur n°6 n’a pas interféré : penalty pour l’équipe B.'
WHERE id = 94;

-- §4 Questions diverses

UPDATE public.rq_questions SET
  question = 'L’arbitre donne le coup d’envoi après avoir interdit la participation d’un joueur dont l’équipement n’est pas conforme à la Loi 4. Alors que l’équipe A est en possession du ballon au centre du terrain, ce joueur qui attend pour faire vérifier la conformité de sa tenue, échange des coups avec une ou plusieurs personnes assises sur le banc de touche adverse (dirigeant, remplaçant, entraîneur …). Décisions ?',
  expected_answer = 'L’arbitre procèdera à l’exclusion du joueur en question et de la (ou des) personne(s) présente(s) sur le banc pour actes de brutalité. L’équipe à laquelle il appartient continue la partie à 10.
• L’arbitre ne sait pas qui a commencé : arrêt du jeu. Balle à terre donnée à un joueur de l’équipe A à l’endroit où le jeu a été arrêté.
• Le joueur est à l’origine des faits : sous réserve de l’avantage, arrêt du jeu. Coup franc direct pour l’équipe adverse sur la ligne de touche à l’endroit le plus proche de la victime.
• Une personne sur le banc est à l’origine des faits : sous réserve de l’avantage, arrêt du jeu. Coup franc direct pour l’équipe adverse sur la ligne de touche à l’endroit le plus proche de la victime.
Rapport.'
WHERE id = 95;

UPDATE public.rq_questions SET
  question = 'Les joueurs enlèvent leurs maillots pour les échanger sur le terrain à la fin d’un match. Un joueur en profite pour dévoiler des slogans provocateurs, politiques ou racistes. Comment doit agir l’arbitre ?',
  expected_answer = 'L’arbitre tiendra compte de la Loi 12 (Fautes et Incorrections) qui l’oblige à prendre des mesures contre un joueur qui :
• Tient des propos ou fait des gestes blessants, injurieux et/ou grossiers. Le joueur doit être exclu.
• Fait des gestes provocateurs, moqueurs ou offensants ou agit de façon provocatrice, moqueuse ou offensante. Le joueur doit être averti.
Tout slogan, déclaration ou image se classant dans l’une de ces catégories n’est pas autorisé. Le joueur doit être exclu.'
WHERE id = 96;

SELECT COUNT(*) AS questions_loi_4_updated
FROM public.rq_questions q JOIN public.rq_categories c ON c.id = q.category_id
WHERE c.law_number = 'Loi 4';

COMMIT;
