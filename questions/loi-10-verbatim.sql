-- RefQuiz : ré-import verbatim Loi 10 depuis CFA/DA Juillet 2025
-- Source : cfa-da-qr-loi-10-juillet-2025.pdf
-- 24 questions (IDs 162-185)
-- À exécuter dans le SQL Editor de Supabase

BEGIN;

-- §1 Épreuve des tirs au but – Égalisation du nombre de joueurs autorisés

UPDATE public.rq_questions SET
  question = 'Lors de l’épreuve des tirs au but, la Loi dit qu’il faut rendre égal le nombre de joueurs autorisés avant l’épreuve. Un joueur se blesse au moment du tir, ce qui l’oblige à quitter le terrain. Décisions et explications ?',
  expected_answer = 'L’équipe qui se trouve en supériorité numérique à cet instant devra informer l’arbitre du nom et du numéro du joueur qui sera retiré de la liste des joueurs autorisés.
Le joueur blessé ne pourra plus revenir et participer à la fin de l’épreuve.'
WHERE id = 162;

UPDATE public.rq_questions SET
  question = 'Épreuve des tirs au but. Les deux équipes comportent 8 joueurs chacune et sont à 7 tirs à 7. Le joueur n°10, 8ème joueur de l’équipe A, botte et manque son tir. Il se blesse et ne peut poursuivre l’épreuve. Le joueur n°5B, 8ème joueur de l’équipe B, doit-il tirer ? Explications.',
  expected_answer = '• Le joueur n°10A blessé doit être évacué du terrain pour recevoir les soins nécessaires.
• Le 8ème joueur de l’équipe B doit tirer.
   o Le joueur n°5B marque : fin de l’épreuve.
   o Le joueur n°5B manque son tir : le capitaine de l’équipe B doit informer l’arbitre du nom et du numéro du joueur qui est retiré des joueurs qui vont continuer l’épreuve. Poursuite de l’épreuve à 7 joueurs contre 7.'
WHERE id = 163;

UPDATE public.rq_questions SET
  question = 'À l’issue d’un match de Coupe (y compris à l’issue de la prolongation le cas échéant) ou pendant l’épreuve des tirs au but, un joueur quitte le terrain et ne revient pas, tout en n’étant pas blessé. Décisions ?',
  expected_answer = 'L’épreuve des tirs au but ne doit pas être retardée par un joueur ayant quitté le terrain. Le tir du joueur sera considéré comme raté si le joueur ne revient pas à temps pour exécuter le dernier tir.'
WHERE id = 164;

UPDATE public.rq_questions SET
  question = 'À l’issue d’un match de Coupe (y compris à l’issue de la prolongation le cas échéant), 1, 2 ou même 3 joueurs accompagnés de leur entraîneur ou du médecin font constater à l’arbitre qu’ils ne sont plus aptes à participer à l’épreuve des tirs au but en raison de blessures qui n’ont pas été détectées ou constatées pendant le match. L’arbitre doit-il obliger ces joueurs à effectuer le tir ou peut-il, après consultations, autoriser les joueurs en question à s’abstenir de tirer ?',
  expected_answer = 'L’arbitre n’obligera pas les joueurs blessés à participer à l’épreuve mais il demandera à l’équipe adverse d’égaliser son nombre de joueurs. En effet il n’y a pas de nombre minimal de joueurs imposés pour l’épreuve des tirs au but.'
WHERE id = 165;

UPDATE public.rq_questions SET
  question = 'L’équipe A termine la rencontre à 10. Avant le début de l’épreuve des tirs aux buts, l’arbitre demande au capitaine B d’égaliser le nombre de joueurs pour son équipe. Cela fait, avant que l’épreuve ne débute, un joueur de l’équipe B participant à l’épreuve (autre que celui retiré de la procédure) est exclu par l’arbitre pour avoir tenu des propos injurieux envers un adversaire. Décisions ?',
  expected_answer = 'L’arbitre demandera au capitaine de l’équipe A de retirer à son tour un joueur de la liste des joueurs autorisés à tirer. L’épreuve débute avec 9 joueurs dans chaque équipe.'
WHERE id = 166;

-- §2 Épreuve des tirs au but – Tireur refusant d’exécuter son tir

UPDATE public.rq_questions SET
  question = 'Un joueur autorisé et prévu pour le botté d’un tir au but s’y refuse. Décisions ?',
  expected_answer = 'a) Il doit regagner le rond central pour être échangé avec un autre joueur de son équipe qui tirera à sa place.
b) Si tous les joueurs autorisés de cette équipe ont déjà participé, ce joueur doit obligatoirement tirer.
S’il refuse, il sera sanctionné d’un avertissement pour désapprobation des décisions de l’arbitre. S’il persiste, il sera exclu (second avertissement pour le même motif) et son tir sera comptabilisé comme raté.'
WHERE id = 167;

-- §3 Épreuve des tirs au but – Ballon défectueux

UPDATE public.rq_questions SET
  question = 'Lors de l’épreuve des tirs au but, le ballon devient défectueux après le botté mais avant de toucher un montant ou le gardien de but et sans avoir franchi la ligne de but. Décisions ?',
  expected_answer = '• Arrêt du jeu.
• Remplacement du ballon défectueux par un nouveau ballon.
• Tir au but à recommencer.'
WHERE id = 168;

UPDATE public.rq_questions SET
  question = 'Lors de l’épreuve des tirs au but, le premier tir au but est exécuté correctement par le joueur n°5A. Pendant la trajectoire, le ballon éclate et finit au fond des buts. Décisions ?',
  expected_answer = '• But refusé.
• Remplacement du ballon défectueux par un nouveau ballon.
• Tir au but à recommencer.'
WHERE id = 169;

UPDATE public.rq_questions SET
  question = 'Lors de l’épreuve des tirs au but, le ballon devient défectueux après le botté et après avoir touché un montant ou le gardien de but sans avoir franchi la ligne de but. Décisions ?',
  expected_answer = '• Arrêt du jeu.
• Remplacement du ballon défectueux par un nouveau ballon.
• Tir comptabilisé comme raté.'
WHERE id = 170;

UPDATE public.rq_questions SET
  question = 'Lors de l’épreuve des tirs au but, l’équipe B est menée 3 buts à 2. Le joueur n°8B s’élance pour le 5ème tir décisif de son équipe. Celui-ci est exécuté correctement et le ballon frappe le montant, éclate puis pénètre dans le but. Décisions et explications ?',
  expected_answer = '• But refusé.
• Le tir au but est considéré comme raté dès que le ballon a éclaté sur le montant.
• Fin de l’épreuve.'
WHERE id = 171;

-- §4 Épreuve des tirs au but – Remplaçant prenant la place du gardien de but

UPDATE public.rq_questions SET
  question = 'Épreuve des tirs au but. Le gardien de but de l’équipe A se blesse en plongeant à l’occasion du 6ème tir. Il est remplacé par un remplaçant inscrit. Le gardien remplaçant peut-il effectuer le 7ème tir au but de son équipe ?',
  expected_answer = 'Oui, sous réserve que le gardien titulaire n’ait pas déjà exécuté un tir parmi les cinq premiers de son équipe.'
WHERE id = 172;

UPDATE public.rq_questions SET
  question = 'L’équipe B utilise son 11ème joueur qui marque. Cette équipe mène alors par 9 tirs à 8. Le dernier joueur de l’équipe B devant tirer au but est le gardien. Au moment où il s’élance, il se blesse sérieusement et se trouve dans l’incapacité de tirer. Le capitaine demande à l’arbitre d’utiliser un remplaçant n’ayant pas pris part au jeu. Décisions ?',
  expected_answer = 'Sous réserve que l’équipe A n’a pas épuisé le nombre maximum de remplacements autorisés, l’arbitre acceptera que l’équipe A utilise son remplaçant. Le gardien titulaire n’ayant pas encore effectué son tir, son remplaçant devra tirer à sa place.'
WHERE id = 173;

UPDATE public.rq_questions SET
  question = 'Lors d’une rencontre de Coupe, une épreuve des tirs au but est nécessaire pour déterminer le vainqueur. Suite à l’exclusion de son joueur n°7, l’équipe A est composée de 10 joueurs alors que l’équipe B est au complet. Le capitaine de l’équipe B informe l’arbitre que le joueur n°2B est retiré de la liste des joueurs autorisés. Pendant l’épreuve, après le 2ème tir, le gardien de l’équipe B se blesse et est obligé de quitter le terrain. Décisions et Explications ?',
  expected_answer = '• Pour remplacer le gardien de but blessé, le capitaine de l’équipe B peut faire appel :
   o Soit à un remplaçant n’ayant pas encore participé à la rencontre, si son équipe n’a pas épuisé le nombre de remplacements maximum autorisés,
   o Soit au joueur n°2B qui a été retiré de la liste des joueurs autorisés pour mettre le nombre de joueurs à égalité.
L’équipe A ne retirera donc pas un de ses joueurs de la liste de ses joueurs.
L’épreuve se poursuivra avec 10 joueurs dans chaque équipe.
• Le capitaine peut aussi décider de remplacer le gardien de but blessé par un des joueurs présents sur le terrain :
   o Le capitaine adverse devra retirer un joueur de son équipe.
   o L’épreuve se poursuivra avec 9 joueurs dans chaque équipe.'
WHERE id = 174;

-- §5 Épreuve des tirs au but – Blessure d’un joueur autre que le gardien

UPDATE public.rq_questions SET
  question = 'Lors d’une rencontre de Coupe, un joueur blessé sort pour se faire soigner. L’arbitre met un terme à la rencontre (ou de la prolongation le cas échéant) avant que celui-ci ne sollicite l’autorisation de rentrer. Sa blessure n’étant pas grave, avant le début de l’épreuve des tirs au but, il demande à y participer. Décisions et explications ?',
  expected_answer = 'Le joueur blessé peut participer à l’épreuve des tirs au but.
La notion de présence sur le terrain s’étend aux joueurs blessés, sortis momentanément du terrain pour se faire soigner.'
WHERE id = 175;

UPDATE public.rq_questions SET
  question = 'Le joueur n°6A, blessé, se fait soigner en dehors du terrain alors que l’arbitre siffle la fin d’un match de Coupe (ou de la prolongation le cas échéant). Alors que l’épreuve des tirs au but va commencer, le joueur est toujours en train de se faire soigner. Décisions ?',
  expected_answer = 'L’arbitre demandera au capitaine de l’équipe A si son joueur n°6 participe ou non à l’épreuve.
• Le joueur n°6A n’est pas en état physique de participer à l’épreuve :
   o Le capitaine B donnera le nom et le numéro de son joueur qui sera retiré de la liste des tireurs.
   o Chaque équipe débutera l’épreuve avec 10 joueurs.
• Le capitaine A souhaite que son joueur n°6 participe à l’épreuve :
   o L’équipe B ne réduira pas son nombre de joueurs autorisés.
   o L’épreuve débutera à 11 contre 11 même si le joueur n°6A n’est pas présent dans le rond central au début de l’épreuve.
   o L’arbitre informe le capitaine A que si le joueur n°6A ne revient pas à temps pour exécuter son tir au but (11ème), il sera considéré comme raté.
   o Si, avant le dernier tir des deux équipes, le capitaine A informe l’arbitre que le joueur n°6A ne pourra pas participer à l’épreuve, on procèdera alors à l’égalisation du nombre de joueurs autorisés.'
WHERE id = 176;

-- §6 Épreuve des tirs au but – Tricherie du tireur

UPDATE public.rq_questions SET
  question = 'Épreuve des tirs au but. L’équipe visiteuse mène par 10 buts à 9. Tous les joueurs, sauf un, ont tiré. Le 11ème joueur de l’équipe locale exécute le dernier tir, use d’une feinte illégale et marque le but. Décisions ?',
  expected_answer = '• But refusé.
• Avertissement au tireur pour comportement antisportif.
• Tir au but considéré comme raté.
• Fin de l’épreuve.'
WHERE id = 177;

UPDATE public.rq_questions SET
  question = 'Épreuve des tirs au but. Quelles décisions devra prendre l’arbitre si :
a) Le gardien de but s’avance dans le terrain avant le botté ?
b) Le tireur use d’une feinte illégale entre le signal de l’arbitre et le botté ?
c) Le tireur et le gardien de but se rendent coupables en même temps des infractions précitées en a) et b) ?',
  expected_answer = 'a) Le gardien de but s’avance dans le terrain avant le botté :
• But marqué : tir au but validé.
• But non marqué :
Le gardien de but a au moins un pied sur ou derrière sa ligne de but :
   o Tir au but considéré comme raté.
Le gardien de but n’a pas au moins un pied sur ou derrière sa ligne de but :
   o Pas d’influence sur le tireur (ballon hors du but ou sur un montant et/ou barre transversale) : tir au but considéré comme raté.
   o Influence sur le tireur ou tir repoussé par le gardien : mise en garde du gardien de but. Tir au but à refaire.
b) Le tireur use d’une feinte illégale entre le signal de l’arbitre et le botté :
• Dans tous les cas : avertissement au tireur pour comportement antisportif. Tir au but considéré comme raté.
c) Le tireur et le gardien de but se rendent coupables en même temps des infractions précitées en a) et b) :
• Dans tous les cas : avertissement au tireur pour comportement antisportif. Tir au but considéré comme raté.'
WHERE id = 178;

UPDATE public.rq_questions SET
  question = 'Lors de l’épreuve des tirs au but, dix joueurs de chaque équipe ont déjà participé. Le 11ème joueur de l’équipe A s’élance à son tour, commet une feinte illégale lors de son tir et marque le but. Le joueur, mécontent de la décision de l’arbitre, retourne dans le rond central. Décisions et explications ?',
  expected_answer = '• But refusé.
• Avertissement au joueur pour comportement antisportif.
• Tir au but comptabilisé comme raté.
• Poursuite de l’épreuve par le 11ème tireur de l’équipe B.'
WHERE id = 179;

UPDATE public.rq_questions SET
  question = 'Épreuve des tirs au but. Le joueur n°5B botte le ballon avant le coup de sifflet de l’arbitre. Quel que soit le résultat du tir, ce dernier est à recommencer. Le tireur s’y refuse. Décisions ?',
  expected_answer = 'Le joueur n°5B n’était pas le dernier tireur de son équipe :
• L’arbitre demandera au capitaine de désigner un autre tireur autorisé et n’ayant pas encore participé à l’épreuve.
Le joueur n°5B est le dernier tireur de son équipe :
• L’arbitre met le joueur en demeure de tirer.
• Si celui-ci refuse : avertissement pour désapprobation des décisions de l’arbitre. S’il persiste, il est alors exclu après avoir reçu un second avertissement.
• Son tir au but est considéré comme raté.
• En cas de nouvelle égalité, l’arbitre demandera au capitaine de l’équipe A de retirer un joueur autorisé afin d’égaliser le nombre de joueurs.
• Rapport.'
WHERE id = 180;

UPDATE public.rq_questions SET
  question = 'Épreuve des tirs au but. Le joueur tire sans le signal de l’arbitre. Décisions ?',
  expected_answer = '• Tir au but à recommencer.'
WHERE id = 181;

UPDATE public.rq_questions SET
  question = 'Lors de l’épreuve de tirs au but, sans qu’aucune autre faute à la procédure d’exécution soit commise, le tireur, au moment de botter le ballon du point de penalty, effectue deux contacts consécutifs avec le ballon.
a) Décisions s’il s’agit de deux contacts consécutifs accidentels (botteur qui glisse involontairement lors de la frappe) ?
b) Décisions s’il s’agit de deux contacts consécutifs délibérés (botteur qui cherche intentionnellement un deuxième contact) ?',
  expected_answer = 'a) Si le tir au but est marqué : but refusé et tir au but à recommencer.
Si le tir au but est manqué : tir au but comptabilisé comme raté.
b) Dans tous les cas : tir au but comptabilisé comme raté'
WHERE id = 182;

-- §7 Épreuve des tirs au but interrompue

UPDATE public.rq_questions SET
  question = 'Lors d’un match de Coupe de France, l’épreuve des tirs au but, par suite d’une panne d’éclairage, ne peut avoir lieu. Décisions ?',
  expected_answer = 'L’arbitre fera un rapport à la commission compétente qui statuera.'
WHERE id = 183;

-- §8 Questions diverses

UPDATE public.rq_questions SET
  question = 'À la fin d’un match de Coupe (y compris de la prolongation le cas échéant), tous les joueurs ayant terminé le match doivent rester sur le terrain et se trouver dans le rond central pour l’exécution des tirs au but. Que doivent précisément faire les joueurs retirés de cette procédure ? Sont-ils autorisés à rester dans le rond central ?',
  expected_answer = 'L’accès à l’aire de jeu n’est possible qu’aux joueurs autorisés à participer à l’épreuve des tirs au but.
Dans ces conditions, les joueurs retirés de la procédure pour égaliser le nombre de joueurs des équipes en présence ne peuvent être autorisés à rester dans le rond central. Ils seront situés dans la surface technique.'
WHERE id = 184;

UPDATE public.rq_questions SET
  question = 'Lors d’une rencontre de Coupe, les deux équipes doivent se départager par la séance des tirs au but. Le capitaine de l’équipe A a reçu un avertissement durant la rencontre. Lors du tirage au sort pour le choix du premier tir, il tient des propos désobligeants à l’arbitre qui lui valent un avertissement avec présentation du carton jaune. Décisions et explications ?',
  expected_answer = 'La rencontre s’est terminée lors du coup de sifflet final.
Considérant que la Loi 10 précise que les mises en garde ou avertissements reçus durant le match ne sont pas pris en compte lors de la séance de tirs au but, l’arbitre doit considérer que le nouvel avertissement est bien délivré dans le cadre de la séance des tirs au but même si le premier tir n’a pas encore été réalisé.
Le capitaine de l’équipe A peut continuer à participer à la séance des tirs au but.'
WHERE id = 185;

SELECT COUNT(*) AS questions_loi_10_updated
FROM public.rq_questions q JOIN public.rq_categories c ON c.id = q.category_id
WHERE c.law_number = 'Loi 10';

COMMIT;
