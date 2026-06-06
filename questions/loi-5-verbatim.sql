-- RefQuiz : ré-import verbatim Loi 5 depuis CFA/DA Juillet 2025
-- Source : cfa-da-qr-loi-5-juillet-2025.pdf
-- 27 questions (IDs 123-149)
-- NB : §3 saute la Q3 (PDF passe de Q2 à Q4) ; trou d'IDs 97-122 en base avant la Loi 5.
-- À exécuter dans le SQL Editor de Supabase

BEGIN;

-- §1 Réserve technique

UPDATE public.rq_questions SET
  question = 'Des dirigeants, conscients que la réserve technique déposée contre leur équipe est fondée, s’arrangent, dès le coup de sifflet final, pour faire disparaître leur capitaine et le soustraire ainsi à la formalité de la signature de la feuille de match. Que doit faire l’arbitre ?',
  expected_answer = 'Dès la fin de la rencontre, il appartient à l’arbitre de demander aux capitaines de venir signer la feuille de match.
Constatant l’absence du capitaine, l’arbitre le mentionne sur la feuille de match et dans son rapport.'
WHERE id = 123;

UPDATE public.rq_questions SET
  question = '45ème minute de jeu. Coup franc direct pour l’équipe A. Une fois toutes les conditions nécessaires remplies, l’arbitre donne le signal d’exécution par un coup de sifflet. Au moment où le tireur botte le ballon, l’arbitre siffle parce qu’un défenseur de l’équipe B s’est approché à moins de 9,15 m du ballon.
Le but est marqué directement. L’arbitre l’accorde malgré les protestations de l’équipe défendante, notamment du gardien, puis renvoie aux vestiaires les deux équipes pour la mi-temps.
a) Au moment du coup d’envoi de la 2ème période, le capitaine de l’équipe B dépose une réserve technique suite au but de la 45ème en jugeant que le jeu n’a toujours pas été repris. Décisions et explications ?
b) Quelle serait la décision si, à la place d’un coup franc direct, les mêmes faits s’étaient produits sur un penalty ?
c) À quel moment la réserve technique doit-elle être déposée pour être recevable ?',
  expected_answer = 'L’arbitre accepte le dépôt de la réserve technique.
a) Le moment du coup d’envoi de la seconde période ne peut pas être considéré comme le 1er arrêt de jeu consécutif au coup de sifflet de fin de la 1ère période.
b) La décision serait identique si les faits s’étaient produits sur un penalty.
c) Pour être recevable, la réserve technique doit être déposée dès le coup de sifflet de la fin de la 1ère période et avant que les deux équipes aient quitté le terrain.'
WHERE id = 124;

UPDATE public.rq_questions SET
  question = 'Lorsqu’un arbitre fait une faute technique en reprenant le jeu par une balle à terre, à quel moment un capitaine d’équipe peut-il déposer une réserve technique pour que celle-ci soit recevable ?',
  expected_answer = 'La réserve technique doit être déposée avant que l’arbitre effectue la balle à terre.'
WHERE id = 125;

UPDATE public.rq_questions SET
  question = 'Ballon en jeu. Le gardien de but de l’équipe A tient le ballon en mains. Le capitaine adverse demande à l’arbitre pour effectuer un remplacement. L’arbitre fait signe au gardien d’arrêter de jouer, sans donner de coup de sifflet, et autorise le remplacement.
Alors que le remplacement est effectué, l’arbitre, toujours sans donner un coup de sifflet pour la reprise du jeu, indique au gardien, par un geste du bras, de reprendre le jeu. Le gardien dégage le ballon des mains. Le capitaine de l’équipe B dépose une réserve technique concernant cette reprise de jeu.
Quand cette réserve doit-elle être déposée pour être recevable ?',
  expected_answer = 'Cela ne peut être qu’à l’arrêt de jeu suivant le dégagement du gardien puisque le jeu n’a pas été arrêté.'
WHERE id = 126;

UPDATE public.rq_questions SET
  question = 'Le capitaine d’une équipe se blesse et sort du terrain pour se faire soigner. L’arbitre, estimant que la sortie est de courte durée, n’impose pas à juste titre la nomination d’un nouveau capitaine. Pendant l’absence de celui-ci, une réserve technique est déposée. Décisions ?',
  expected_answer = 'Il appartient à l’arbitre de faire respecter la procédure de dépôt de la réserve. Dans la mesure où le capitaine blessé peut procéder au dépôt de la réserve, l’arbitre enregistrera la réserve en sa présence.
Dans le cas contraire, il demandera à l’équipe concernée de désigner un capitaine pour la circonstance.'
WHERE id = 127;

UPDATE public.rq_questions SET
  question = 'Une réserve technique est déposée en 1ère période par le capitaine A en présence du capitaine B et de l’arbitre assistant le plus proche. Après le match, la réserve doit être signée par le capitaine A, le capitaine B, l’arbitre et l’arbitre assistant.
Qui doit signer la feuille de match si l’un des capitaines est exclu en seconde période ou après le coup de sifflet final ? Même question si le fait se produit en compétition "jeunes" ?',
  expected_answer = 'L’arbitre fera signer les personnes présentes (capitaines, dirigeants, arbitres) au moment du dépôt de la réserve. Toutefois, en cas d’absence de l’une de ces personnes, celles qui les auront remplacées contresigneront la réserve.
L’arbitre mentionnera dans son rapport les explications nécessaires permettant de comprendre pourquoi la réserve est signée par des personnes non présentes sur le terrain au moment de son dépôt.'
WHERE id = 128;

UPDATE public.rq_questions SET
  question = 'Une équipe de catégorie "jeunes" se déplace uniquement avec un entraîneur licencié majeur. Celui-ci est exclu par l’arbitre avant la rencontre. Le cas échéant, qui peut déposer une réserve technique (ou tout autre type de réserve) ?',
  expected_answer = 'Dans ce contexte particulier, l’entraîneur exclu conservera toutefois ses fonctions administratives et c’est lui qui déposera la réserve.'
WHERE id = 129;

-- §2 Joueur blessé

UPDATE public.rq_questions SET
  question = 'Dans un choc, sans qu’aucune faute n’ait été commise, entre un gardien de but et un joueur, les deux joueurs sont blessés. Décisions ?',
  expected_answer = 'Le gardien de but et le joueur de champ pourront être tous les deux soignés sur le terrain.
Par conséquent, le joueur de champ, comme le gardien de but, pourront reprendre le jeu immédiatement.
Toutefois, si les soins du joueur de champ se prolongent après que le gardien de but est rétabli, l’arbitre fera sortir ce joueur afin de faire reprendre le jeu rapidement.'
WHERE id = 130;

UPDATE public.rq_questions SET
  question = 'Lors d’un duel entre un gardien et un attaquant, l’arbitre siffle une faute contre l’attaquant. Les deux joueurs nécessitent des soins. Décisions et explications ?',
  expected_answer = '• Le gardien de but pourra être soigné sur le terrain.
• L’attaquant doit obligatoirement sortir du terrain, y compris lorsque les soins qui lui sont prodigués peuvent être terminés avant ou en même temps que le gardien de but.
• Coup franc direct pour l’équipe du gardien de but à l’endroit de la faute, sous réserve de la procédure de la Loi 13.
Explications :
La faute sanctionnée (avec avertissement ou sans avertissement) entraîne une obligation de sortie pour soins, contrairement à une simple collision.
Cette mesure vise à renforcer le respect des règles et à éviter tout avantage indu pour le joueur fautif.'
WHERE id = 131;

UPDATE public.rq_questions SET
  question = 'Sur une action de jeu, deux adversaires se blessent. Le jeu est arrêté. Les soigneurs interviennent et évacuent les joueurs sur une civière. À cet instant, l’entraîneur de l’un des blessés demande à faire entrer un remplaçant à la place de son joueur. Décisions ?',
  expected_answer = 'Le remplacement est accepté parce que l’obligation d’attendre la reprise du jeu pour revenir sur le terrain ne s’applique qu’au joueur blessé préalablement sorti du terrain.
Elle ne concerne en aucun cas son remplaçant qui peut immédiatement rentrer sur le terrain avec l’autorisation de l’arbitre.'
WHERE id = 132;

UPDATE public.rq_questions SET
  question = 'Quelle est la procédure à appliquer lorsqu’un joueur refoulé pour saignement demande à revenir sur le terrain ? Décisions ?',
  expected_answer = 'Le joueur peut revenir sur le terrain avec l’accord de l’arbitre qui vérifie, lors d’un arrêt de jeu, la fin du saignement. Cela peut se faire aussi pendant le déroulement de la partie après vérification par l’arbitre assistant ou, le cas échéant, par le 4ème arbitre qui indique à l’arbitre que le saignement est stoppé.'
WHERE id = 133;

UPDATE public.rq_questions SET
  question = 'Quelle est la durée maximale d’interruption lorsque la blessure importante d’un joueur nécessite l’intervention de secours extérieurs sur le terrain ?',
  expected_answer = 'Le délai d’interruption de la partie, prévu pour les cas d’intempéries ou de pannes d’éclairage (45 minutes), ne s’applique pas à cette situation.
Le délai est laissé à l’appréciation de l’arbitre qui doit prendre en compte la possibilité ou non de mener la rencontre à son terme.'
WHERE id = 134;

UPDATE public.rq_questions SET
  question = 'Que doit faire l’arbitre, dans le cas d’une "mini blessure" où le joueur s’approche de la ligne de touche et se fait administrer "un peu de bombe", alors que le jeu se déroule ?',
  expected_answer = 'Cela n’a aucune interférence avec le jeu, l’arbitre tolère et n’intervient pas parce que, selon la Loi 5, les décisions arbitrales reposent sur son opinion et décide de prendre les mesures appropriées dans le cadre des Lois du Jeu.'
WHERE id = 135;

UPDATE public.rq_questions SET
  question = 'À la 75ème minute, ballon en jeu, le joueur n°11A se rapproche de son banc, sans sortir du terrain, se plaignant d’une douleur au mollet gauche. Le soigneur lui administre des soins par-dessus la ligne de touche. Au même moment, ce joueur voit le ballon passer proche de lui. Il le récupère et va marquer un but pour son équipe. Décisions ?',
  expected_answer = '• But refusé.
• Si l’arbitre avait donné l’autorisation au joueur pour sortir : avertissement au joueur n°11A pour comportement antisportif
• Si le joueur n’a pas demandé l’autorisation pour sortir : mise en garde du joueur n°11A.
• Coup franc indirect pour l’équipe B à l’endroit où le joueur a récupéré le ballon.'
WHERE id = 136;

UPDATE public.rq_questions SET
  question = 'À la 75ème minute, ballon en jeu, le gardien de but de l’équipe A se plaint d’une douleur au mollet gauche. Le soigneur, tout en restant hors du terrain, administre par-dessus la ligne de but des soins au gardien de but qui ne sort pas du terrain. Au même moment l’attaquant n°9B frappe au but. Le ballon se dirige en pleine lucarne. Le gardien de but se précipite vers son but et arrive à détourner le ballon en corner. Décisions ?',
  expected_answer = '• Corner.'
WHERE id = 137;

UPDATE public.rq_questions SET
  question = 'Le joueur n°7A est blessé et le joueur n°2B est averti suite à la faute qu’il a commise. Alors que le joueur n°7A se fait soigner sur le terrain, il est également nécessaire de soigner le joueur n°2B. Ce dernier pourra-t-il reprendre le jeu dans les mêmes conditions que le joueur n°7A ?',
  expected_answer = 'L’application de la Loi 5 quant à la reprise du jeu immédiate pour le joueur blessé ne concerne que le cas où l’adversaire a été averti.
Par conséquent, le fautif n’entre pas dans cette application de la Loi. Le joueur n°2B devra donc quitter le terrain, attendre que le jeu soit repris et, après le signal de l’arbitre, il pourra reprendre part au jeu.'
WHERE id = 138;

UPDATE public.rq_questions SET
  question = 'Une équipe de catégorie "jeunes" se déplace uniquement avec un entraîneur majeur licencié. Celui-ci est exclu par l’arbitre avant la rencontre. Qui pourra soigner un joueur blessé de son équipe en cas de nécessité ?',
  expected_answer = 'L’arbitre sera dans l’obligation de faire revenir cette personne et de l’autoriser à apporter des soins au joueur blessé.
Il devra ensuite quitter à nouveau le terrain.'
WHERE id = 139;

-- §3 Approche disciplinaire (le PDF saute la Q3)

UPDATE public.rq_questions SET
  question = 'En seconde période, l’attaquant n°7A tacle irrégulièrement le joueur n°8B. Ce dernier se relève et donne un coup de pied à son agresseur. Au moment où l’arbitre montre le carton rouge aux deux joueurs, l’assistant est sollicité par l’entraîneur de l’équipe B pour un remplacement. L’arbitre donne son accord pour le remplacement puis note les deux exclusions sur sa carte d’arbitrage. L’assistant procède au remplacement du n°8B par le n°13B et ne se rend pas compte que le joueur n°8B venait d’être exclu. L’arbitre fait reprendre le jeu par un coup franc direct. Quelques instants plus tard, lors d’un nouvel arrêt de jeu, le capitaine de l’équipe A fait remarquer à l’arbitre que l’équipe adverse joue à 11. L’arbitre se rend compte de la situation. Décisions et explications ?',
  expected_answer = '• Annulation du remplacement du n°13A sans avertissement (erreur des arbitres).
• Le remplaçant n°13A doit quitter le terrain et il pourra remplacer ultérieurement un partenaire.
• L’équipe A continue obligatoirement le match à 10.
• Reprise consécutive à l’arrêt.
• Rapport.'
WHERE id = 140;

UPDATE public.rq_questions SET
  question = 'Un défenseur commet une faute passible d’un avertissement. L’arbitre laisse l’avantage et le ballon revient vers un autre attaquant qui poursuit l’action. Ce même défenseur commet une nouvelle faute passible d’un avertissement sur le second attaquant. Décisions et explications ?',
  expected_answer = '• Arrêt du jeu.
• Si la 1ère faute consistait à perturber ou à stopper une attaque prometteuse :
   o Le défenseur ne sera pas averti pour la 1ère faute, il recevra un avertissement uniquement pour la 2ème faute.
• Si la 1ère faute nécessitait un avertissement :
   o L’arbitre prendra soin de clairement indiquer qu’il sanctionne, sur le plan disciplinaire, successivement les deux fautes en montrant du bras les deux endroits où elles ont été commises et lèvera le carton jaune deux fois. Ensuite, l’arbitre présentera le carton rouge indiquant l’exclusion.
• Coup franc direct pour l’équipe attaquante à l’endroit de la 2ème faute ou penalty si celle-ci été commise dans la surface de réparation du défenseur.
• Rapport en cas d’exclusion.'
WHERE id = 141;

UPDATE public.rq_questions SET
  question = 'L’arbitre découvre qu’une équipe est à 12. Il s’avère que le joueur supplémentaire est le capitaine de cette équipe, celle-ci ayant changé une fois de capitaine au cours de match. Le joueur supplémentaire n’était pas le capitaine au début du match. Il a reçu le brassard au cours du match. Décisions et explications ?',
  expected_answer = 'Le joueur supplémentaire recevra un avertissement pour avoir pénétré sans autorisation.
Dans le cas d’une équipe comportant un joueur supplémentaire, l’avertissement au capitaine n’apparaît plus dans les textes de Loi.'
WHERE id = 142;

UPDATE public.rq_questions SET
  question = 'Un but doit être refusé en application des Lois du Jeu (ex : but marqué de la main) mais l’arbitre ne se rend pas compte de la faute et il siffle la fin de la période. C’est alors que l’arbitre assistant concerné par la phase de jeu l’appelle. Décisions et explications ?',
  expected_answer = 'S’il s’agit de la fin de la 1ère période, de la fin du match avant de la prolongation ou de la fin de la 1ère période de la prolongation :
• L’arbitre peut revenir sur sa décision tant qu’il n’a pas quitté le terrain. But refusé. Avertissement au buteur. Fin de la période.
S’il s’agit de la fin de la rencontre (sans prolongation ni tirs au but) :
• L’arbitre ne peut pas revenir sur sa décision même s’il est encore sur le terrain. Le but reste validé.
S’il s’agit de la fin de la seconde période de la prolongation avec tirs au but à suivre :
• L’arbitre peut revenir sur sa décision. But refusé. Avertissement au buteur. Fin de la période.'
WHERE id = 143;

UPDATE public.rq_questions SET
  question = 'Le ballon est dévié en corner par le défenseur n°5. Celui-ci se trouvait replié sur sa ligne de but entre les montants. L’arbitre siffle la fin de la première période. C’est après avoir quitté le terrain que l’arbitre assistant réussit à informer l’arbitre que le joueur n°5 a détourné délibérément le ballon de la main, empêchant ainsi le but d’être marqué. Décisions ?',
  expected_answer = 'À partir du moment où l’arbitre assistant ne s’est pas manifesté immédiatement, l’arbitre ayant quitté le terrain, il ne pourra plus sanctionner techniquement la faute de main du joueur n°5.
Par contre, le joueur n°5 sera exclu pour avoir empêché un but d’être marqué en commettant une main.'
WHERE id = 144;

UPDATE public.rq_questions SET
  question = 'L’équipe A donne le coup d’envoi initial. Au début de la seconde période, cette même équipe donne à nouveau le coup d’envoi. Quelques secondes après (sans arrêt de jeu entre temps), l’arbitre donne un carton rouge au joueur n°5B pour avoir annihilé une occasion manifeste de but. À cet instant, le capitaine de l’équipe B souhaite déposer une réserve technique concernant le coup d’envoi qui devait revenir à son équipe. Décisions ?
Même question, si l’exclusion a été donnée pour une faute grossière ?',
  expected_answer = 'Pour une faute grossière ou un acte de brutalité, l’arbitre maintiendra l’exclusion. Mais si le joueur a simplement annihilé une occasion manifeste de but, il ne recevra aucune sanction disciplinaire puisque le but n’aurait pas pu être validé.
L’arbitre fera recommencer la seconde période en donnant le coup d’envoi à l’équipe B.'
WHERE id = 145;

UPDATE public.rq_questions SET
  question = 'Le joueur n°5A est averti en 1ère période. À la 60ème minute, ce joueur n°5A commet une faute passible d’un avertissement sur l’attaquant n°9B qui se dirige vers le but adverse. L’arbitre laisse l’avantage. Le joueur n°9B tire et le ballon est capté par le gardien A. Ce dernier dégage le ballon vers son partenaire n°5A. Décisions et explications ?',
  expected_answer = '• Si la faute consistait à perturber ou à stopper une attaque prometteuse :
   o Le joueur n°5A ne sera pas averti.
   o L’arbitre laisse le jeu se poursuivre.
• Si la faute nécessitait un avertissement :
   o Arrêt du jeu.
   o La Loi 12, chapitre "avantage" précise qu’en pareil cas, lorsque l’arbitre a laissé le jeu se dérouler, il est tenu de l’interrompre si le fautif interfère à nouveau dans le jeu, afin de l’exclure pour un second avertissement.
   o Coup franc indirect pour l’équipe B à l’endroit où le n°5A interfère dans le jeu, sous réserve de la procédure de la Loi 13.
   o Rapport.'
WHERE id = 146;

-- §4 Questions diverses

UPDATE public.rq_questions SET
  question = 'Le capitaine est exclu. Qui doit le remplacer ?',
  expected_answer = 'L’arbitre demande aux joueurs de l’équipe concernée de désigner un nouveau capitaine.
À défaut, l’arbitre désignera de lui-même ce nouveau capitaine.'
WHERE id = 147;

UPDATE public.rq_questions SET
  question = 'Un joueur empêche volontairement, de la main, qu’un but soit marqué par l’équipe adverse. L’arbitre, qui a vu la faute, accorde le penalty qui s’impose mais n’arrive pas à identifier le véritable fautif. Décisions et explications ?',
  expected_answer = 'Dans la Loi 3, le paragraphe "capitaine de l’équipe" précise que celui-ci est, "dans une certaine mesure, responsable du comportement de son équipe". Dans cette situation, l’arbitre doit donc placer le capitaine face à ses responsabilités en lui demandant de désigner le partenaire fautif.
Il sera notamment informé qu’en cas de refus d’apporter son aide :
• Il sera tout d’abord averti pour comportement antisportif.
• S’il persiste à refuser d’apporter son aide, il recevra un second avertissement pour comportement antisportif. Il sera alors exclu pour avoir reçu deux avertissements. Nomination d’un nouveau capitaine.
• En tout état de cause, l’équipe du joueur fautif ne pourra reprendre le jeu qu’à 10.
• Rapport en cas d’exclusion.
Il sera fait application de ces mêmes dispositions par l’arbitre lorsque c’est l’arbitre assistant qui voit la faute mais ne peut pas identifier le joueur fautif.'
WHERE id = 148;

UPDATE public.rq_questions SET
  question = 'L’arbitre n’arrive pas à identifier le coupable d’un acte de brutalité. Il s’adresse à son capitaine qui refuse de signaler le partenaire fautif. Le capitaine, qui persiste dans son refus, est d’abord averti puis exclu. Avant la reprise du jeu, le fautif se dénonce à l’arbitre. Décisions et explications ?',
  expected_answer = 'Le jeu n’ayant pas encore repris, l’arbitre exclura le vrai coupable et retirera l’exclusion infligée au capitaine.
Par contre, son comportement ne peut pas être totalement "blanchi". L’arbitre maintiendra le 1er avertissement pour le comportement antisportif. Ce dernier reprend donc sa place.'
WHERE id = 149;

SELECT COUNT(*) AS questions_loi_5_updated
FROM public.rq_questions q JOIN public.rq_categories c ON c.id = q.category_id
WHERE c.law_number = 'Loi 5';

COMMIT;
