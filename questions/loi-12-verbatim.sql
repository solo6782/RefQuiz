-- RefQuiz : ré-import verbatim Loi 12 depuis CFA/DA Juillet 2025
-- Source : cfa-da-qr-loi-12-juillet-2025.pdf
-- 69 questions (IDs 203-271)
-- À exécuter dans le SQL Editor de Supabase

BEGIN;

UPDATE public.rq_questions SET
  question = 'Dans le cadre de fautes commises en même temps, comment l’arbitre doit apprécier la gravité de la faute afin de déterminer la reprise du jeu ?',
  expected_answer = 'L’IFAB a répondu à la Section :
"Il est attendu des arbitres qu’ils fassent preuve de pertinence lors de telles situations. En conséquence, il n’est pas possible de fournir une réponse définitive au regard de « cracher » ou de « frapper ». L’appréciation des faits peut varier d’une situation à l’autre (exemples : est-ce que le crachat a atteint ou pas l’adversaire ? Quelle a été la force ou l’impact du coup de poing ? Etc…)'
WHERE id = 203;

UPDATE public.rq_questions SET
  question = 'Quelle est la décision à prendre lorsque deux fautes sont commises simultanément par deux joueurs de la même équipe ?',
  expected_answer = 'L’arbitre doit sanctionner la faute la plus grave. Peu importe le nombre de joueurs ou à quelle équipe ils appartiennent.'
WHERE id = 204;

UPDATE public.rq_questions SET
  question = 'Quelle est la décision à prendre lorsque deux fautes sont commises simultanément par le même joueur ?',
  expected_answer = 'L’arbitre doit sanctionner la faute la plus grave.'
WHERE id = 205;

UPDATE public.rq_questions SET
  question = 'Corner effectué par le n°7 de l’équipe A. Le ballon heurte la barre transversale, revient vers le n°7 qui marque mais, au moment où il reprend le ballon, le libéro adverse, situé sur la ligne de but, donne un coup de poing à un adversaire. Ce dernier, dans l’action, avait pénétré dans les filets. Décisions et explications ?',
  expected_answer = '• But refusé.
• Exclusion du libéro pour acte de brutalité.
• Le fait de frapper est une faute plus grave que celle de toucher deux fois consécutivement le ballon.
• Penalty pour l’équipe A.
• Rapport.'
WHERE id = 206;

UPDATE public.rq_questions SET
  question = 'Coup franc en faveur de l’équipe A à l’intérieur de la surface de réparation adverse. Le joueur lève le ballon du pied à une hauteur de 1,50 m et, d’un coup de tête, lobe le mur au moment même où un défenseur B frappe un adversaire A situé à l’extérieur du terrain et qui recevait des soins. Le ballon termine sa course au fond des filets. Décisions ?',
  expected_answer = '• But refusé.
• Exclusion du défenseur de l’équipe B pour acte de brutalité.
• Coup franc direct pour l’équipe A exécuté sur le point de la limite du terrain le plus proche de l’endroit où se trouvait la victime.
• Penalty pour l’équipe A, si ledit point se trouve sur une des parties de la ligne de but délimitant la surface de réparation de l’équipe B.
• Rapport.'
WHERE id = 207;

UPDATE public.rq_questions SET
  question = 'Le ballon est en jeu. Le joueur n°5A crache sur un partenaire. Au même moment, dans sa surface de réparation, le joueur n°10B frappe le joueur n°7A, situé lui aussi sur le terrain. Ce dernier se met à saigner. Décisions et explications ?',
  expected_answer = '• Arrêt du jeu.
• Ici, le coup de poing est plus grave que le crachat.
• Exclusion du joueur n°5A pour avoir craché sur un partenaire.
• Exclusion du joueur n°10B pour acte de brutalité.
• Le joueur blessé doit quitter le terrain pour faire stopper le saignement.
• Le joueur n°7A se trouve dans la surface de réparation de l’équipe B : penalty pour l’équipe A.
• Le joueur n°7A est hors de la surface de réparation de l’équipe B : coup franc direct pour l’équipe A à l’endroit où se trouvait le joueur n°7A, sous réserve de la procédure de la Loi 13.
• Rapport.'
WHERE id = 208;

UPDATE public.rq_questions SET
  question = 'Dans sa surface de réparation, le gardien de but de l’équipe A détourne le ballon en corner à l’aide du protège-tibia qu’il tient à la main. Décisions et explications ?',
  expected_answer = '• Arrêt du jeu.
• Le fait de toucher le ballon avec un objet tenu en main est une faute de la Loi 12.
• Avertissement au gardien pour comportement antisportif ou exclusion s’il empêche un but d’être marqué.
• Penalty pour l’équipe B.'
WHERE id = 209;

UPDATE public.rq_questions SET
  question = 'Dans sa surface de réparation, le gardien de but de l’équipe A détourne le ballon dans son but à l’aide du protège-tibia qu’il tient à la main. Décisions ?',
  expected_answer = '• But accordé.
• Avertissement au gardien pour comportement antisportif.
• Coup d’envoi.'
WHERE id = 210;

UPDATE public.rq_questions SET
  question = 'À l’aide du ballon qu’il tient en mains, un gardien de but, repousse violemment, en dehors de sa surface de réparation, un attaquant qui s’est déplacé latéralement pour lui faire intentionnellement obstruction et l’empêcher de dégager le ballon. Décisions ?',
  expected_answer = '• Arrêt du jeu.
• Avertissement à l’attaquant pour comportement antisportif.
• Exclusion du gardien de but pour acte de brutalité.
• Nomination d’un nouveau gardien de but.
• Obstacle sans contact :
   o Coup franc indirect pour l’équipe défendante à l’endroit de la faute.
• Obstacle avec contact :
   o Coup franc direct pour l’équipe défendante à l’endroit de la faute.
• Rapport'
WHERE id = 211;

UPDATE public.rq_questions SET
  question = 'En possession du ballon, un gardien de but, le fait rebondir au sol avant de le dégager. À ce moment-là, un attaquant le lui subtilise pour marquer un but. Décisions et explications ?',
  expected_answer = '• But refusé.
• Un gardien de but est considéré comme en possession du ballon en mains quand "il fait rebondir le ballon sur le sol ou le lance en l’air". Un adversaire ne peut donc pas le lui disputer.
• Coup franc indirect pour l’équipe défendante à l’endroit où l’attaquant a touché le ballon, sous réserve de la procédure de la Loi 13.'
WHERE id = 212;

UPDATE public.rq_questions SET
  question = 'Tenant le ballon en mains, un gardien de but, le fait rouler au sol pour le dégager. À ce moment-là, un attaquant le lui subtilise pour marquer un but. Décisions et explications ?',
  expected_answer = '• But accordé.
• Le gardien n’est plus considéré comme en possession du ballon, l’attaquant peut donc librement le jouer.
• Coup d’envoi.'
WHERE id = 213;

UPDATE public.rq_questions SET
  question = 'Sur un tir anodin d’un attaquant, le gardien de but adverse, dans sa propre surface de réparation, repousse volontairement le ballon avec les mains devant lui et le reprend immédiatement en mains alors qu’un attaquant tentait de le lui disputer. Décisions et explications ?',
  expected_answer = '• Arrêt du jeu.
• Un gardien de but est considéré comme en possession du ballon en mains quand « il tient le ballon entre ses mains ou entre sa main et une surface (par exemple : le sol, son corps) ou quand le ballon entre en contact avec une partie quelconque de ses mains ou de ses bras, sauf si le ballon rebondit sur lui ou qu’il l’a repoussé ».
• Dès lors que le gardien de but cherche à contourner l’esprit de la Loi il doit être sanctionné.
• Coup franc indirect accordé pour l’équipe adverse à l’endroit où le gardien de but a repris le ballon, sous réserve de la procédure de la Loi 13.'
WHERE id = 214;

UPDATE public.rq_questions SET
  question = 'Quelle attitude doit adopter l’arbitre lorsqu’un gardien de but est chargé par un adversaire ?',
  expected_answer = 'Le gardien de but est un joueur comme un autre et à ce titre il peut être chargé loyalement.
Par contre, un adversaire ne peut pas lui disputer le ballon lorsqu’il l’a en mains, c’est-à-dire quand :
• Le ballon entre en contact avec une partie quelconque de ses mains ou de ses bras, sauf si le ballon rebondit sur lui ou qu’il l’a repoussé.
• Il fait rebondir le ballon sur le sol ou le lance en l’air.
• Il tient le ballon entre les mains ou entre la main et une surface (par ex. : le sol, son corps).
• Il tient le ballon sur la main ouverte.'
WHERE id = 215;

UPDATE public.rq_questions SET
  question = 'Ballon en jeu, dans sa surface de réparation, le gardien de but frappe un adversaire avec le ballon (sans le lâcher). Ce dernier est situé en dehors du terrain au-delà de la ligne de but. Décisions ?',
  expected_answer = '• Arrêt du jeu.
• Exclusion du gardien de but pour acte de brutalité.
• Nomination d’un nouveau gardien de but.
• Si l’attaquant est en dehors de la zone délimitée par les filets : penalty pour l’équipe adverse.
• Si l’attaquant est dans la zone délimitée par les filets : but accordé. Coup d’envoi.
• Rapport.'
WHERE id = 216;

UPDATE public.rq_questions SET
  question = 'Un défenseur effectue un tacle régulier sur le ballon qui était jusqu’alors en possession de l’équipe attaquante. Sur ce tacle, le ballon parvient directement au gardien de but de l’équipe défendante qui s’en saisit des mains à l’intérieur de sa surface de réparation. Décisions et explications ?',
  expected_answer = 'L’arbitre doit considérer le tacle comme un geste maîtrisé.
• S’il s’agit d’une passe délibérée :
   o Arrêt du jeu.
   o Coup franc indirect pour l’équipe attaquante à l’endroit où le gardien de but prend le ballon à la main, sous réserve de la procédure de la Loi 13.
• S’il s’agit d’un tacle pour enlever/intercepter le ballon pour éviter qu’il n’arrive à un attaquant :
   o Laisser jouer.'
WHERE id = 217;

UPDATE public.rq_questions SET
  question = 'Un gardien fait rebondir le ballon après s’en être saisi des mains. Décisions ?',
  expected_answer = 'Dans le cas général, dans la limite des 8 secondes, le gardien de but peut faire rebondir le ballon après s’en être saisi.
Dans le cas où l’intention initiale du gardien de but était de dégager le ballon de la main et que celui-ci, se ravisant au dernier moment, fait rebondir le ballon pour le reprendre, l’arbitre laissera le jeu se dérouler.
Par contre, si le gardien de but, voulant dégager de la main, le laisse échapper par maladresse, il n’est alors plus à distance de jeu pour lui et s’il s’avance et le reprend de la main, il y a lieu de sanctionner cette action d’un coup franc indirect.'
WHERE id = 218;

UPDATE public.rq_questions SET
  question = 'Lors d’une action de jeu, un gardien de but dégage volontairement et violemment le ballon du pied sur un attaquant situé à quelques mètres de lui. Décisions ?',
  expected_answer = '• Sous réserve de l’avantage, arrêt du jeu.
• Exclusion du gardien de but pour acte de brutalité.
• Nomination d’un nouveau gardien de but.
• Coup franc direct pour l’équipe attaquante à l’endroit où se trouvait l’attaquant ou penalty s’il se trouvait dans la surface de réparation adverse.
• Rapport.'
WHERE id = 219;

UPDATE public.rq_questions SET
  question = 'Un spectateur entre sur le terrain alors que le ballon est en jeu dans les mains du gardien de but. Le gardien de but, mécontent, dégage volontairement et violemment le ballon du pied sur le spectateur qui était venu se positionner juste devant lui. Décisions ?',
  expected_answer = '• Arrêt du jeu.
• Exclusion du gardien de but pour acte de brutalité.
• L’arbitre demande à l’agent extérieur de quitter le terrain.
• Nomination d’un nouveau gardien de but.
• Balle à terre donnée au nouveau gardien de but.
• Rapport.'
WHERE id = 220;

UPDATE public.rq_questions SET
  question = 'Un gardien de but ou un joueur de champ botte régulièrement un coup de pied de but ou un coup franc depuis sa surface de réparation. Le ballon parcourt quelques mètres. Un attaquant se précipite dans la surface de réparation pour le jouer. Voyant que l’attaquant va récupérer le ballon, le botteur court et réussit à le dégager du pied. Décisions ?',
  expected_answer = '• Arrêt du jeu.
• Si le tireur a stoppé une attaque prometteuse : avertissement pour comportement antisportif.
• Si le tireur a privé l’attaquant d’un but ou d’une occasion de but manifeste : exclusion pour avoir annihilé une occasion de but manifeste. Nomination d’un nouveau gardien de but le cas échéant.
• Coup franc indirect à l’endroit où le tireur a touché une seconde fois le ballon, sous réserve de la procédure de la Loi 13.
• Rapport en cas d’exclusion.'
WHERE id = 221;

UPDATE public.rq_questions SET
  question = 'Un gardien de but vient de s’emparer du ballon avec les mains dans sa surface de réparation. De quelle manière l’arbitre doit veiller au respect du délai de 8 secondes ?',
  expected_answer = 'Dès que le gardien de but prend clairement possession du ballon avec ses mains (en le tenant, le faisant rebondir ou le lançant en l’air), l’arbitre doit commencer le décompte des 8 secondes en respectant le protocole suivant :
1. Début du décompte : L’arbitre détermine à partir de quand le gardien de but commence à conserver le ballon à la main.
2. Signal visuel et vocal de la 4ème à la 8ème seconde.
3. Fin du délai (8 secondes) : Si le gardien n’a toujours pas relâché le ballon après 8 secondes, l’arbitre arrête immédiatement le jeu et accorde un corner à l’équipe adverse. Le corner est exécuté du côté le plus proche de l’endroit où se trouvait le gardien au moment de l’infraction.
4. En cas de récidive : Si le gardien répète (délibérément) cette infraction, l’arbitre doit effectuer une mise en garde à celui-ci et accorder un corner à l’équipe adverse. Si le gardien récidive, un nouveau corner sera accordé et le gardien de but sera averti pour avoir retardé la reprise du jeu.'
WHERE id = 222;

UPDATE public.rq_questions SET
  question = 'Un défenseur récupère le ballon du pied, jongle et, de la tête, le passe à son gardien de but. Décisions et explications ?',
  expected_answer = '• Arrêt du jeu.
• Avertissement au défenseur pour comportement antisportif.
• Un joueur qui initie délibérément une stratégie pour que le ballon soit passé (y compris sur coup franc ou coup de pied de but) à son gardien de but de la tête, de la poitrine, du genou, etc. dans le but de contourner la Loi et ce, que le gardien touche ou non le ballon des mains ; le gardien de but est pénalisé s’il est celui qui initie cette stratégie délibérée.
• Coup franc indirect contre le défenseur sous réserve de la procédure de la Loi 13.'
WHERE id = 223;

UPDATE public.rq_questions SET
  question = 'À 25 mètres du but adverse, le joueur n°10A vient d’éliminer ses adversaires et se dirige vers le gardien de but B. Celui-ci sort alors de sa surface de réparation et ceinture l’attaquant sans parvenir à l’arrêter. L’arbitre laisse l’avantage. L’attaquant arrive à 5m du but et va marquer. Revenu en catastrophe, le joueur n°4B dégage le ballon en ligne de but par un tacle totalement incontrôlé et très dangereux. Il ne touche pas l’attaquant. Décisions et explications ?',
  expected_answer = '• Arrêt du jeu.
• Avertissement au gardien de but pour comportement antisportif.
• Exclusion du joueur n°4B pour faute grossière.
• Un tel tacle constitue une mise en danger de l’intégrité physique de l’adversaire.
• Penalty pour l’équipe A.
• Rapport.'
WHERE id = 224;

UPDATE public.rq_questions SET
  question = 'Un défenseur, à la lutte avec un attaquant, tente de couvrir le ballon pour que son gardien s’en empare dans la surface de réparation. Le ballon reste à distance de jeu et le défenseur fait volontairement écran de son corps, sans l’usage des mains et des bras, pour stopper l’attaquant. Celui-ci vient heurter le défenseur dans le dos et les deux joueurs tombent. Mécontent, l’attaquant se relève et adresse un violent coup de pied au défenseur. Décisions et explications ?',
  expected_answer = '• Arrêt du jeu.
• Exclusion de l’attaquant pour acte de brutalité.
• Un joueur a le droit de protéger le ballon en se plaçant entre un adversaire et le ballon pour autant que celui-ci reste à distance de jeu et que le joueur ne maintienne pas l’adversaire à distance avec les bras ou le corps. Si le ballon se trouve à distance de jeu, le joueur peut être chargé par un adversaire (dans le respect des Lois du Jeu).
• Coup franc direct pour l’équipe défendante à l’endroit de la faute, sous réserve de la procédure de la Loi 13.
• Rapport.'
WHERE id = 225;

UPDATE public.rq_questions SET
  question = 'Sur un long ballon aérien, un attaquant et un défenseur s’apprêtent à le disputer de la tête. Les deux joueurs sont en pleine extension quand le coude de l’attaquant, véritablement saillant, percute l’adversaire au visage. L’attaquant parvient toutefois à dévier le ballon. Décisions et explications ?',
  expected_answer = '• Arrêt du jeu.
• Exclusion de l’attaquant pour faute grossière
• IFAB : "Tacler ou disputer le ballon tout en mettant en danger l’intégrité physique d’un adversaire ou en agissant avec violence ou brutalité doit être sanctionné comme faute grossière".
• Coup franc direct pour l’équipe défendante, sous réserve de la procédure de la Loi 13.
• Rapport.'
WHERE id = 226;

UPDATE public.rq_questions SET
  question = 'Sur un long ballon aérien un attaquant et un défenseur s’apprêtent à le disputer de la tête. Les deux joueurs sont en pleine extension et le défenseur prend le dessus sur son adversaire. Il dévie le ballon vers son gardien qui le récupère et c’est à ce moment-là que l’attaquant lui assène un coup de coude. Décisions et explications ?',
  expected_answer = '• Arrêt du jeu.
• Exclusion de l’attaquant pour acte de brutalité
• Il ne s’agit pas d’une faute grossière puisqu’il ne dispute plus le ballon.
• Coup franc direct pour l’équipe défendante, sous réserve de la procédure de la Loi 13.
• Rapport.'
WHERE id = 227;

UPDATE public.rq_questions SET
  question = 'L’attaquant n°9, à 50 cm de la ligne de but adverse, n’a plus qu’à pousser le ballon de la tête dans le but. C’est un but immanquable ! À hauteur du visage de l’attaquant, un défenseur effectue alors un ciseau dangereux sans le toucher mais qui, de ce fait, ne peut marquer. Décisions et explications ?',
  expected_answer = '• Arrêt du jeu.
• Exclusion du défenseur pour avoir empêché un but en commettant une faute passible d’un coup franc.
• Coup franc indirect pour l’équipe attaquante, sur la ligne de la surface de but, parallèle à la ligne de but, à l’endroit le plus proche de la faute.
• La reprise technique n’étant pas un penalty, la sanction disciplinaire ne peut pas être ramenée à un avertissement.
• Rapport.'
WHERE id = 228;

UPDATE public.rq_questions SET
  question = 'Un attaquant est victime, à 30 m du but adverse, d’une faute d’un 1er défenseur, passible d’exclusion (hors faute grossière et acte de brutalité) car il l’empêche d’avoir une possibilité de marquer. Cependant, il en réchappe et l’arbitre laisse l’avantage.
Dans la surface de réparation, un 2ème défenseur commet sur lui une faute identique à celle du 1er défenseur donc passible d’exclusion. Quelles décisions devra prendre l’arbitre si :
a) L’attaquant réchappe à la 2ème faute et marque, l’arbitre ayant laissé l’avantage ?
b) L’attaquant perd le contrôle du ballon mais un de ses partenaires s’en empare et marque le but ?
c) L’attaquant perd le contrôle du ballon et la défense se dégage ?',
  expected_answer = 'Cas a) et b) :
• But accordé.
• Avertissement aux deux défenseurs fautifs pour comportement antisportif.
• Coup d’envoi.
Cas c) :
• Arrêt du jeu.
• Avertissement au 1er défenseur pour comportement antisportif.
• Avertissement au 2ème défenseur pour comportement antisportif ou exclusion pour avoir annihilé une occasion nette de but si :
   o La faute commise consiste à tenir, tirer ou pousser un adversaire ou
   o Le joueur fautif n’a pas essayé de jouer ou disputer le ballon ; ou n’était aucunement en mesure de le faire.
• Penalty.
• Rapport.'
WHERE id = 229;

UPDATE public.rq_questions SET
  question = 'Coup franc direct proche de la surface de réparation adverse. Après le signal de l’arbitre, le joueur n°9A frappe le ballon qui se dirige en pleine lucarne. Le défenseur n°2B s’appuie alors sur un coéquipier pour s’élever plus haut. Grâce à cela, il arrive à détourner le ballon de la tête hors du but. Décisions ?',
  expected_answer = '• Exclusion du joueur n°2B pour avoir empêché un but en commettant une faute passible d’un coup franc.
• Penalty pour l’équipe A.
• Rapport.'
WHERE id = 230;

UPDATE public.rq_questions SET
  question = 'Un attaquant pénètre dans la surface de réparation adverse avec une occasion nette de marquer quand il est victime d’une faute de la part d’un défenseur (ou du gardien). L’arbitre siffle le penalty qui s’impose. Quelle sera la sanction disciplinaire dans les cas suivants :
a) La faute est un tirage de maillot ?
b) Le défenseur lui a fait un croc en jambe délibéré, par derrière, sans jouer le ballon ?
c) Le défenseur l’a déséquilibré tout en tentant de tacler le ballon ?
d) Le défenseur a taclé avec virulence mettant en danger l’intégrité physique de l’attaquant ?',
  expected_answer = 'a) et b) Exclusion du joueur fautif pour avoir annihilé une occasion de but manifeste d’un adversaire se dirigeant vers le but adverse.
c) Avertissement pour comportement antisportif.
d) Exclusion pour faute grossière.'
WHERE id = 231;

UPDATE public.rq_questions SET
  question = 'Ballon en jeu, un gardien de but lance son protège-tibia et touche (ou non) le ballon. Décisions ?
a) Gardien de but en dehors de sa surface de réparation et ballon à l’intérieur.
b) Gardien de but et ballon dans la surface de réparation.
c) Gardien de but dans sa surface de réparation et ballon en dehors.',
  expected_answer = 'a) Gardien de but en dehors de sa surface de réparation et ballon à l’intérieur.
• Sous réserve de l’avantage, arrêt du jeu.
• Avertissement au gardien de but pour comportement antisportif ou exclusion s’il anéantit une occasion de but manifeste.
• Nomination éventuelle d’un nouveau gardien de but.
• Penalty pour l’équipe attaquante.
• Rapport en cas d’exclusion.
b) Gardien de but et ballon dans la surface de réparation.
• Sous réserve de l’avantage, arrêt du jeu.
• Avertissement au gardien de but pour comportement antisportif ou exclusion s’il anéantit une occasion de but manifeste.
• Nomination éventuelle d’un nouveau gardien de but.
• Penalty pour l’équipe attaquante.
• Rapport en cas d’exclusion.
c) Gardien de but dans sa surface de réparation et ballon en dehors.
• Sous réserve de l’avantage, arrêt du jeu.
• Avertissement au gardien de but pour comportement antisportif ou exclusion pour s’il anéantit une occasion de but manifeste.
• Nomination éventuelle d’un nouveau gardien de but.
• Coup franc direct pour l’équipe attaquante à l’endroit où le protège tibia est rentré en contact avec le ballon.
• Rapport en cas d’exclusion.
N.B. : pour les trois cas, les réponses sont identiques si le gardien de but touche le ballon avec un objet tenu à la main (protège-tibia, casquette, …).'
WHERE id = 232;

UPDATE public.rq_questions SET
  question = 'Sur le terrain, un joueur, tenant un objet à la main, tente de toucher le ballon sans parvenir à l’atteindre. Décisions ?',
  expected_answer = '• Sous réserve de l’avantage, arrêt du jeu
• Avertissement au joueur pour comportement antisportif.
• Coup franc indirect pour l’équipe adverse à l’endroit de la faute, sous réserve de la procédure de la Loi 13.'
WHERE id = 233;

UPDATE public.rq_questions SET
  question = 'Un défenseur repousse délibérément le ballon de la main alors que celui-ci allait pénétrer dans son but. Un attaquant reprend le ballon et tire au but. C’est alors qu’un autre défenseur le détourne également volontairement de la main sans l’empêcher de pénétrer dans le but. Décisions ?',
  expected_answer = '• But accordé.
• Avertissement au 1er défenseur pour comportement antisportif.
• Avertissement au 2ème défenseur pour comportement antisportif.
• Coup d’envoi.'
WHERE id = 234;

UPDATE public.rq_questions SET
  question = 'Lors d’une action de jeu, le joueur n°9A tire en direction du but de l’équipe B. Le joueur n°5B revenu en catastrophe sur la ligne de but, s’accroche à la barre transversale et dévie le ballon hors du but. Décisions ?',
  expected_answer = 'Dans tous les cas :
• Arrêt du jeu.
• Exclusion du joueur n°5B pour avoir empêché un but d’être marqué en commettant une faute passible d’un coup franc.
• Si le joueur n°5B a dévié le ballon de la main ou du bras : penalty pour l’équipe A.
• Si le joueur n°5B a dévié le ballon d’une autre partie du corps : coup franc indirect sur la ligne des 5,50m parallèle à la ligne de but au point le plus proche de la faute.
• Rapport.'
WHERE id = 235;

UPDATE public.rq_questions SET
  question = 'Sur une action de jeu, un joueur marque délibérément un but de la main contre son camp. Décisions et explications ?',
  expected_answer = '• But accordé.
• Le joueur recevra un avertissement pour comportement antisportif car il se comporte d’une manière irrespectueuse envers l’esprit du jeu.
• Coup d’envoi.'
WHERE id = 236;

UPDATE public.rq_questions SET
  question = 'Alors que le ballon est en jeu, en ce qui concerne les fautes de "lancer" ou de "cracher", quelle seront les reprises du jeu possibles lorsqu’un joueur, hors du terrain, commet une faute ou est victime d’une faute ?',
  expected_answer = 'Si ce joueur :
• Lance un objet ou crache sur un adversaire sur le terrain : coup franc direct ou un penalty.
• Lance un objet ou crache sur un partenaire ou un arbitre sur le terrain : coup franc direct ou un penalty.
• Lance un objet ou crache sur une personne de l’équipe adverse qui est un remplaçant, un remplacé, un officiel d’équipe, un joueur refoulé hors du terrain :
   o Coup franc direct exécuté sur le point de la limite du terrain le plus proche de l’endroit où se trouvait la victime.
   o Penalty, si ledit point se trouve sur une des parties de la ligne de but délimitant la surface de réparation du joueur fautif.
• Lance un objet ou crache sur une personne de son équipe qui est un remplaçant, un remplacé, un officiel d’équipe, un joueur refoulé hors du terrain :
   o Coup franc indirect exécuté sur le point de la limite du terrain le plus proche de l’endroit où se trouvait la victime.
Par contre, si ce joueur :
• Reçoit un objet lancé par un adversaire depuis le terrain :
   o Coup franc direct exécuté sur le point de la limite du terrain le plus proche de l’endroit où se trouvait la victime.
   o Penalty, si ledit point se trouve sur une des parties de la ligne de but délimitant la surface de réparation du joueur fautif.
• Reçoit un objet lancé par un partenaire depuis le terrain :
   o Coup franc indirect exécuté sur le point de la limite du terrain le plus proche de l’endroit où se trouvait la victime.
• Reçoit un objet lancé par un remplaçant ou officiel d’équipe situé hors du terrain :
   o Coup franc direct exécuté sur le point de la limite du terrain le plus proche de l’endroit où se trouvait la victime ou penalty si le fautif appartient à l’équipe adverse.
   o Coup franc indirect exécuté sur le point de la limite du terrain le plus proche de l’endroit où se trouvait la victime si le fautif est de son équipe.
N.B. : dans le cas d’une faute commise sur une personne de son équipe, l’arbitre n’est pas obligé d’arrêter immédiatement le jeu. Le fautif sera exclu au 1er arrêt de jeu.'
WHERE id = 237;

UPDATE public.rq_questions SET
  question = 'Alors que le ballon est en jeu, un gardien de but, dans sa surface de réparation, touche d’un jet de pierre un remplaçant de l’équipe adverse qui s’échauffait derrière l’arbitre assistant. Décisions ?',
  expected_answer = '• Sous réserve de l’avantage, arrêt du jeu.
• Exclusion du gardien pour acte de brutalité.
• Nomination d’un nouveau gardien.
• Coup franc direct pour l’équipe adverse exécuté sur le point de la ligne de touche le plus proche de l’endroit où se trouvait la victime.
• Rapport.'
WHERE id = 238;

UPDATE public.rq_questions SET
  question = 'Ballon en jeu. Un joueur refoulé pour remettre son équipement en conformité avec la Loi 4 attend un arrêt de jeu pour revenir sur le terrain. Il reçoit une pierre lancée par un adversaire situé dans sa surface de réparation. Décisions ?',
  expected_answer = '• Sous réserve de l’avantage, arrêt du jeu.
• Exclusion du fautif acte de brutalité.
• Coup franc direct pour l’équipe adverse exécuté sur le point de la limite du terrain le plus proche de l’endroit où se trouvait la victime.
• Penalty, si ledit point se trouve sur une des parties de la ligne de but délimitant la surface de réparation du joueur fautif.
• Rapport.'
WHERE id = 239;

UPDATE public.rq_questions SET
  question = 'Un gardien de but, ballon en jeu, jette le ballon qu’il tient en mains sur un attaquant adverse, situé en dehors du terrain, et emporté par son élan derrière la ligne de but. Décisions ?',
  expected_answer = '• Dans tous les cas :
   o Exclusion du gardien de but pour acte de brutalité.
   o Nomination d’un nouveau gardien de but.
   o Rapport.
• Si le joueur est situé dans le but :
   o But accordé.
   o Coup d’envoi.
• Si le joueur est situé derrière la ligne de but en dehors des buts : arrêt du jeu,
   o Coup franc direct pour l’équipe adverse exécuté sur le point de la ligne de but le plus proche de l’endroit où se trouvait la victime.
   o Penalty, si ledit point se trouve sur une des parties de la ligne de but délimitant la surface de réparation du gardien de but fautif.'
WHERE id = 240;

UPDATE public.rq_questions SET
  question = 'Alors que le joueur n°9A part seul au but, le remplaçant n°13B, qui s’échauffait derrière le but, prend un ballon à un ramasseur de balles et le lance dans les pieds de l’attaquant pour le gêner. Décisions ?',
  expected_answer = '• Sous réserve de l’avantage, arrêt du jeu.
• Évacuation du second ballon.
• Exclusion du remplaçant n°13B pour avoir empêché une occasion de but manifeste.
• Coup franc direct pour l’équipe A exécuté à l’endroit où le second ballon a interféré avec le jeu ou à l’endroit où il a touché ou aurait pu toucher l’adversaire ou le ballon du match.
• Penalty si le ballon du match ou le joueur A se trouvait dans la surface de réparation de l’équipe B.
• Rapport.'
WHERE id = 241;

UPDATE public.rq_questions SET
  question = 'Alors que le ballon est en jeu, un joueur, présent sur le terrain, crache sur un adversaire situé en dehors du terrain car il a été emporté par son élan. Décisions ?',
  expected_answer = '• Sous réserve de l’avantage, arrêt du jeu.
• Exclusion du fautif pour crachat.
• Coup franc direct pour l’équipe adverse exécuté sur le point de la ligne de but le plus proche de l’endroit où se trouvait la victime.
• Penalty, si ledit point se trouve sur une des parties de la ligne de but délimitant la surface de réparation du joueur fautif.
• Rapport.'
WHERE id = 242;

UPDATE public.rq_questions SET
  question = 'Un défenseur ou le gardien de but, dans sa surface de réparation, tient un objet à la main. Il le lance volontairement et détourne le ballon qui allait entrer dans son but. Décisions ?',
  expected_answer = '• Arrêt du jeu
• Exclusion du défenseur (ou du gardien de but) pour avoir empêché l’équipe adverse de marquer un but en touchant le ballon de la main.
• Nomination d’un nouveau gardien le cas échéant.
• Penalty pour l’équipe adverse.
• Rapport.'
WHERE id = 243;

UPDATE public.rq_questions SET
  question = 'Alors que le ballon est en jeu, un joueur de l’équipe A quitte délibérément le terrain pour aller cracher sur un officiel d’équipe assis sur le banc. Décisions ?',
  expected_answer = '• Sous réserve de l’avantage, arrêt du jeu.
• Exclusion du joueur fautif pour avoir craché sur une personne.
• Officiel de l’équipe A : coup franc indirect pour l’équipe B exécuté sur la ligne de touche au point le plus proche de l’endroit où se trouvait l’officiel d’équipe.
• Officiel de l’équipe B : coup franc direct pour l’équipe B exécuté sur la ligne de touche au point le plus proche de l’endroit où se trouvait l’officiel d’équipe.
• Rapport.'
WHERE id = 244;

UPDATE public.rq_questions SET
  question = 'Alors que le ballon est en jeu, un joueur quitte délibérément le terrain pour aller cracher sur un agent extérieur (spectateur). Décisions ?',
  expected_answer = '• Sous réserve de l’avantage, arrêt du jeu.
• Exclusion du joueur fautif pour avoir craché sur une personne.
• Coup franc indirect pour l’équipe adverse depuis le point de la limite du terrain où le joueur a quitté le terrain, sous réserve de la procédure de la Loi 13.
• Rapport.'
WHERE id = 245;

UPDATE public.rq_questions SET
  question = 'Le joueur n°8 de l’équipe A exécute correctement une remise en jeu. Le ballon est en jeu lorsqu’un joueur de l’équipe B lance un objet sur le ballon et en dévie la trajectoire. Le joueur n°8A reprend le ballon et marque un but pour son équipe. Décisions et explications ?',
  expected_answer = '• Par application de l’avantage, le but est accordé.
• Avertissement au joueur de l’équipe B pour comportement antisportif.
• Le joueur n°8 de l’équipe A n’a donc pas joué deux fois consécutivement le ballon.
• Coup d’envoi.'
WHERE id = 246;

UPDATE public.rq_questions SET
  question = 'Un officiel de l’équipe A, présent sur le banc de touche ou dans la surface technique et régulièrement inscrit sur la feuille de match, lance un objet sur ou vers :
a) Un adversaire B se trouvant sur le terrain ?
b) Un adversaire B refoulé par l’arbitre pour mise en conformité de son équipement ?
c) Un adversaire B se faisant soigner le long de la ligne de touche à l’extérieur du terrain ?
d) Un remplaçant ou un remplacé assis sur le banc de touche adverse ?
e) Un adversaire B, emporté par son élan, se trouvant momentanément hors du terrain ?',
  expected_answer = 'Dans tous les cas, exclusion de l’officiel de l’aire de jeu avec présentation du carton rouge pour avoir adopté un comportement violent. Rapport.
a) Coup franc direct pour l’équipe B exécuté à l’endroit où l’objet a interféré avec le jeu (ou à l’endroit où il a touché ou aurait pu toucher l’adversaire).
   Penalty si le joueur B se trouvait dans la surface de réparation de l’équipe A.
b) Coup franc direct pour l’équipe B exécuté sur le point de la limite du terrain le plus proche de l’endroit où se trouvait la victime.
c) Coup franc direct pour l’équipe B sur la ligne de touche au point le plus proche de l’endroit où il a touché ou aurait pu toucher le joueur.
d) Balle à terre à l’endroit où se trouvait le ballon lorsque le jeu a été arrêté, sous réserve de la procédure de la Loi 8.
e) Coup franc direct pour l’équipe B sur la ligne de touche au point le plus proche de l’endroit où il a touché ou aurait pu toucher le joueur.
N.B. : dans les cas b) et c), lors d’une faute commise sur une personne de son équipe, le jeu sera repris par un coup franc indirect sur la ligne de terrain la plus proche de l’endroit où se trouvait la victime.'
WHERE id = 247;

UPDATE public.rq_questions SET
  question = 'Le ballon est en jeu. Une attaque prometteuse se développe au profit de l’équipe A. Voyant cela, un joueur de l’équipe B, situé près de la ligne de touche, demande un ballon à un ramasseur de balles qui le lui envoie. Le joueur B botte ce second ballon qui arrive près de la surface de réparation de l’équipe A, à proximité du ballon du match. Décisions et explications ?',
  expected_answer = 'Le jeu ne sera pas arrêté si le second ballon n’interfère pas avec le jeu.
Si le ballon interfère :
• Arrêt du jeu.
• Évacuation du second ballon.
• Avertissement au joueur fautif pour comportement antisportif.
• Coup franc direct pour l’équipe A, exécuté à l’endroit où le second ballon a interféré avec le jeu.'
WHERE id = 248;

UPDATE public.rq_questions SET
  question = 'Ballon en jeu, un joueur de l’équipe B, sur le terrain, jette une pierre sur :
a) L’arbitre, sans l’atteindre.
b) Un partenaire.
c) Un adversaire.
d) Un officiel d’équipe situé dans sa surface technique.
e) Un remplaçant A qui avait pénétré sur le terrain, le long de la ligne de touche à plus de 25 m du ballon.',
  expected_answer = 'Dans tous les cas, arrêt du jeu.
Exclusion du joueur fautif pour acte de brutalité. Rapport.
a) Coup franc direct pour l’équipe A ou penalty en fonction de l’emplacement de la victime.
b) Le partenaire se trouve sur le terrain :
   • Coup franc direct pour l’équipe A ou penalty en fonction de l’emplacement de la victime.
   Le partenaire se trouve hors du terrain :
   • Coup franc indirect pour l’équipe A exécuté sur le point de la ligne du terrain le plus proche de l’endroit où se trouvait la victime.
c) Coup franc direct pour l’équipe A ou penalty en fonction de l’emplacement de la victime.
d) Officiel de l’équipe A :
   • Coup franc direct pour l’équipe A exécuté sur le point de la ligne de touche le plus proche de l’endroit où se trouvait l’officiel d’équipe.
   Officiel de l’équipe B :
   • Coup franc indirect pour l’équipe A exécuté sur la ligne de touche au point le plus proche de l’endroit où se trouvait l’officiel d’équipe.
e) Coup franc direct pour l’équipe B à l’endroit où se situait le remplaçant A. Celui-ci a interféré avec un adversaire. L’arbitre doit lui faire quitter le terrain après l’avoir averti pour être entré sans autorisation.'
WHERE id = 249;

UPDATE public.rq_questions SET
  question = 'Un joueur de l’équipe A, sur le terrain, frappe un joueur de l’équipe B également sur le terrain alors que le ballon est en jeu. Décisions ?',
  expected_answer = '• Arrêt du jeu.
• Exclusion du joueur de l’équipe A pour acte de brutalité.
• Coup franc direct pour l’équipe B à l’endroit où se trouvait le joueur de l’équipe B si celui-ci est en dehors de la surface de réparation adverse.
• Penalty pour l’équipe B si le joueur de l’équipe B se trouvait dans la surface de réparation adverse.
• Rapport.'
WHERE id = 250;

UPDATE public.rq_questions SET
  question = 'Un joueur de l’équipe A sur le terrain frappe un partenaire sur le terrain alors que le ballon est en jeu. Décisions ?',
  expected_answer = '• Arrêt du jeu.
• Exclusion du joueur de l’équipe A pour acte de brutalité.
• Coup franc direct pour l’équipe B à l’endroit où se trouvait le partenaire si celui-ci est en dehors ou dans la surface de réparation adverse.
• Penalty pour l’équipe B si le partenaire se trouvait dans sa propre surface de réparation.
• Rapport.'
WHERE id = 251;

UPDATE public.rq_questions SET
  question = 'Ballon en jeu. Sur le terrain, le joueur n°5A frappe le joueur n°8B situé au-delà du champ de jeu et qui attendait pour rentrer suite à une blessure. Décisions ?',
  expected_answer = '• Arrêt du jeu.
• Exclusion du joueur n°5A pour acte de brutalité.
• Coup franc direct pour l’équipe B exécuté sur le point de la limite du terrain le plus proche de l’endroit où se trouvait le joueur n°8B.
• Penalty pour l’équipe B, si ledit point se trouve sur une des parties de la ligne de but délimitant la surface de réparation du joueur n°5A.
• Rapport.'
WHERE id = 252;

UPDATE public.rq_questions SET
  question = 'Ballon au pied, le joueur n°7A déborde le long de la ligne de touche. Il centre puis, dans son élan, se retrouve à l’extérieur du terrain. À ce moment-là, le joueur n°2B quitte le terrain pour aller le frapper. Décisions ?',
  expected_answer = '• Arrêt du jeu.
• Exclusion du joueur n°2B pour acte de brutalité.
• Coup franc direct pour l’équipe A, exécuté sur le point de la ligne de touche le plus proche de l’endroit où se trouvait la victime.
• Rapport.'
WHERE id = 253;

UPDATE public.rq_questions SET
  question = 'Ballon en jeu. Le joueur n°11A, emporté par son élan en dehors du terrain, frappe un adversaire se trouvant sur le terrain. Décisions ?',
  expected_answer = '• Arrêt du jeu.
• Exclusion du joueur n°11A pour acte de brutalité.
• Coup franc direct pour l’équipe B à l’endroit où se trouvait la victime.
• Penalty pour l’équipe B, si la victime se trouvait dans la surface de réparation de l’équipe A.
• Rapport.'
WHERE id = 254;

UPDATE public.rq_questions SET
  question = 'Le joueur n°9A sort du terrain pour aller frapper un adversaire qui avait été emporté dans son élan lors d’une action de jeu. Décisions ?',
  expected_answer = '• Arrêt du jeu.
• Exclusion du joueur n°9A pour acte de brutalité.
• Coup franc direct pour l’équipe B, exécuté sur le point de la limite du terrain le plus proche de l’endroit où se trouvait la victime.
• Penalty, si ledit point se trouve sur une des parties de la ligne de but délimitant la surface de réparation du joueur fautif.
• Rapport.'
WHERE id = 255;

UPDATE public.rq_questions SET
  question = 'Lors d’une action de jeu, un attaquant n°10A, au duel avec un défenseur n°5B, parvient à centrer et, emportés par leur élan, les deux joueurs se retrouvent derrière la ligne de but. Le défenseur se retourne et frappe l’attaquant. Décisions ?',
  expected_answer = '• Sous réserve de l’avantage, arrêt du jeu.
• Exclusion du défenseur n°5B pour acte de brutalité.
• Coup franc direct pour l’équipe A exécuté sur le point de la ligne de but le plus proche de l’endroit où se trouvait la victime.
• Penalty, si ledit point se trouve sur une des parties de la ligne de but délimitant la surface de réparation du joueur fautif.
• Rapport.'
WHERE id = 256;

UPDATE public.rq_questions SET
  question = 'Un joueur qui a déjà reçu un avertissement en reçoit un second quelques minutes après. L’arbitre ne se rend pas compte du fait que ce joueur était déjà averti et il ne l’exclut pas. Quelques minutes après, ce joueur marque un but et l’arbitre s’aperçoit de son erreur. Décisions et explications si ce joueur marque :
a) Dans le but adverse.
b) Dans son propre but.',
  expected_answer = 'Dans les deux cas : Exclusion de ce joueur, consécutive à deux avertissements.
a) À partir du moment où les officiels sont responsables de l’erreur, l’équipe ayant une personne supplémentaire ne peut être pénalisée par une sanction technique. De ce fait, le but est refusé et le jeu doit être repris par une balle à terre donnée au gardien de but.
b) But accordé. Coup d’envoi.
Rapport.'
WHERE id = 257;

UPDATE public.rq_questions SET
  question = 'À la 75ème minute de jeu, l’arbitre donne un avertissement à un joueur et fait reprendre immédiatement le jeu par un coup franc direct accordé pour l’équipe adverse. Quelques minutes plus tard, un but est marqué par le joueur précédemment averti.
À ce moment-là, le capitaine de l’équipe qui vient d’encaisser le but fait remarquer à l’arbitre que le joueur venant de marquer avait déjà reçu un avertissement en 1ère période et donc, l’avertissement de la 75ème minute était le second. Il aurait dû être exclu. Il conteste la validité de ce but. Décisions et explications ?',
  expected_answer = 'L’arbitre doit vérifier sa carte d’arbitrage et, au besoin, consulter ses arbitres assistants officiels.
a) Si les faits sont réels :
• But refusé.
• Exclusion immédiate du joueur qui a été averti deux fois.
• À partir du moment où les officiels sont responsables de l’erreur, l’équipe ayant une personne supplémentaire ne peut être pénalisée par une sanction technique.
• De ce fait, le but est refusé et le jeu doit être repris par une balle à terre donnée au gardien de but.
• Rapport.
b) Si les faits sont faux :
• But accordé.
• Coup d’envoi.'
WHERE id = 258;

UPDATE public.rq_questions SET
  question = 'Le joueur n°7A reçoit un second avertissement mais, par erreur, l’arbitre ne l’exclut pas. Le jeu reprend et, sur l’action suivante, le joueur n° 7A en question marque un but. Les joueurs adverses protestent du fait de la non-exclusion du joueur n°7A. Après consultation de ses assistants, l’arbitre reconnaît son erreur. Quelle sera la décision à prendre si le buteur n’est pas le joueur n°7A ?',
  expected_answer = 'Que le but soit marqué par la personne supplémentaire ou un de ses partenaires, cela ne modifie pas la reprise technique à savoir :
• Exclusion du joueur n°7A pour avoir reçu un second avertissement.
• But marqué en faveur de l’équipe B :
   o But accordé.
   o Coup d’envoi.
• But marqué en faveur de l’équipe A :
   o But refusé.
   o Balle à terre donnée au gardien de but.
• Rapport.'
WHERE id = 259;

UPDATE public.rq_questions SET
  question = 'En 2ème période, le joueur n°8A reçoit un second avertissement mais il n’est pas exclu par l’arbitre. Quelques instants plus tard, l’entraîneur de l’équipe A demande pour effectuer un remplacement. Le joueur n°8A quitte le terrain et le remplaçant n°12A y pénètre. Le jeu est repris et, sur la 1ère action, le joueur n°12A marque un but pour son équipe. Le coup d’envoi est donné. Ce n’est que dans les secondes suivantes que l’arbitre se rend compte de son erreur précédente. Il arrête le jeu. Décisions et explications ?',
  expected_answer = 'Le jeu ayant repris, l’arbitre est dans l’obligation d’accorder le but.
• Il présentera le carton rouge au joueur n°8A se trouvant sur le banc de touche. Celui-ci doit quitter l’aire de jeu.
• L’équipe A continue obligatoirement le match à 10. Le remplaçant n°12A doit quitter le terrain et pourra remplacer ultérieurement un partenaire.
• Balle à terre donnée à l’équipe en possession du ballon à l’endroit où il se trouvait lors de l’arrêt de jeu.
• Rapport.'
WHERE id = 260;

UPDATE public.rq_questions SET
  question = 'À la 50ème minute de jeu, le joueur n°8B reçoit un second avertissement mais l’arbitre ne l’exclut pas. Il se rend compte de son erreur quand l’équipe marque un but directement sur un coup franc direct contre l’équipe A. Décisions ?',
  expected_answer = '• Dans tous les cas, exclusion du joueur n°8B pour avoir reçu un second avertissement. Rapport.
   o Le joueur n°8B est le buteur : but refusé. Coup franc direct à refaire.
   o Le joueur n°8B n’est pas le buteur : but refusé. Balle à terre donnée au gardien de but de l’équipe A.'
WHERE id = 261;

UPDATE public.rq_questions SET
  question = 'Un remplaçant, sur son banc de touche, insulte un adversaire sur le terrain alors que le ballon est en jeu. Décisions ?',
  expected_answer = '• Sous réserve de l’avantage, arrêt du jeu.
• Exclusion du remplaçant pour avoir tenu des propos injurieux.
• Coup franc indirect pour l’équipe adverse exécuté sur le point de la ligne de touche le plus proche de l’endroit où se trouvait le remplaçant.
• Rapport.'
WHERE id = 262;

UPDATE public.rq_questions SET
  question = 'Ballon en jeu. Un joueur, sur le terrain, insulte un adversaire, un partenaire ou l’arbitre, présent sur le terrain. Décisions ?',
  expected_answer = '• Sous réserve de l’avantage, arrêt du jeu.
• Exclusion du joueur pour propos injurieux.
• Coup franc indirect pour l’équipe adverse à l’endroit où se trouvait le joueur fautif, sous réserve de la procédure de la Loi 13.
• Rapport.'
WHERE id = 263;

UPDATE public.rq_questions SET
  question = 'Ballon en jeu. Un joueur blessé, qui se trouve hors du terrain, insulte un adversaire (ou un partenaire, un arbitre) présent sur le terrain, ou l’entraineur adverse situé sur son banc de touche. Décisions ?',
  expected_answer = '• Sous réserve de l’avantage, arrêt du jeu.
• Exclusion du joueur pour propos injurieux.
• Coup franc indirect pour l’équipe adverse exécuté sur le point de la ligne du terrain le plus proche de l’endroit où se trouvait le fautif.
• Rapport.'
WHERE id = 264;

UPDATE public.rq_questions SET
  question = 'Ballon en jeu. Un joueur quitte le terrain et vient insulter le 4ème arbitre. Décisions ?',
  expected_answer = '• Sous réserve de l’avantage, arrêt du jeu.
• Exclusion du joueur pour propos injurieux.
• Coup franc indirect pour l’équipe adverse exécuté sur le point de la ligne du terrain le plus proche de l’endroit où se trouvait le fautif.
• Rapport.'
WHERE id = 265;

UPDATE public.rq_questions SET
  question = 'Un remplaçant, sur son banc de touche, insulte un remplaçant ou un officiel d’équipe assis sur le banc de touche alors que le ballon est en jeu. Décisions ?',
  expected_answer = '• Sous réserve de l’avantage, arrêt du jeu.
• Exclusion du remplaçant pour avoir tenu des propos injurieux.
• Balle à terre, sous réserve de la procédure de la Loi 8.
• Rapport.'
WHERE id = 266;

UPDATE public.rq_questions SET
  question = 'Un joueur blessé sort du terrain pour aller se faire soigner. Doit-il être sanctionné d''un avertissement s’il n’a pas demandé l''autorisation de l’arbitre pour quitter le terrain ?',
  expected_answer = 'Un joueur doit informer l’arbitre avant de quitter le terrain. Toutefois cette disposition ne s’applique pas pour la sortie d’un joueur blessé.
Néanmoins, si le joueur désire reprendre part au jeu, il ne pourrait le faire qu’après accord de l’arbitre.'
WHERE id = 267;

UPDATE public.rq_questions SET
  question = 'Un défenseur commet une faute passible d’avertissement. L’arbitre accorde le coup franc réglementaire mais, avant qu’il ait pu notifier l’avertissement, l’attaquant victime de la faute joue le coup franc rapidement, conformément à la Loi 13, pour un partenaire qui marque. Décisions et explications ?',
  expected_answer = '• But accordé.
• L’arbitre délivrera la sanction disciplinaire avant le coup d’envoi sauf si la faute consistait à perturber ou stopper une attaque prometteuse
• L’IFAB dit : "Si l’équipe adverse joue rapidement le coup franc et se procure une occasion de but manifeste avant que l’arbitre ait pu commencer la procédure de signification de la sanction disciplinaire ; la sanction sera alors infligée au prochain arrêt de jeu, si l’infraction a perturbé ou stoppé une attaque prometteuse, le joueur n’est pas averti. ".
• Coup d’envoi.'
WHERE id = 268;

UPDATE public.rq_questions SET
  question = 'À la 57ème minute de jeu, l’attaquant n°11A entre dans la surface de réparation de l’équipe adverse. Le défenseur n°5B tacle l’attaquant au niveau de l’intersection de la surface de but et de la ligne de but dans le terrain. L’arbitre fait signe de jouer ou dit de la voix : "Jouez" ! Le ballon va directement en touche. L’arbitre va alors voir l’attaquant de l’équipe A et constate qu’il fait l’objet de blessures très graves. L’attaquant doit quitter le terrain définitivement tout en étant évacué à l’hôpital par les pompiers. Décisions et explications ?',
  expected_answer = 'L’arbitre, en disant "Jouez", ou en faisant signe de jouer, a signifié qu’il n’y avait pas de faute de la part du défenseur.
• Le jeu sera donc repris par la rentrée de touche correspondante et il n’y aura pas de sanction disciplinaire.
Toutefois, si l’arbitre pense avoir commis une erreur, il peut revenir sur sa décision puisque le jeu n’a pas repris.
• Le joueur n°5B doit être sanctionné d’une exclusion pour faute grossière.
• Le jeu doit être repris par un penalty pour l’équipe A.
• Rapport.'
WHERE id = 269;

UPDATE public.rq_questions SET
  question = 'Un joueur enlève son short après avoir marqué un but. Décisions ?',
  expected_answer = 'L’arbitre sanctionnera ce joueur d’un avertissement pour comportement antisportif.
De plus, s’il estime qu’il s’agit d’un geste obscène : le joueur fautif sera exclu pour gestes grossiers.'
WHERE id = 270;

UPDATE public.rq_questions SET
  question = 'Ballon en jeu. Un remplaçant, qui s’échauffait derrière le but de son équipe, distrait par son attitude provocante (verbale ou non) un attaquant adverse. De ce fait, ce dernier perd le ballon au profit d’un défenseur de l’équipe du remplaçant. Décisions ?',
  expected_answer = '• Arrêt du jeu.
• Avertissement au remplaçant pour comportement antisportif.
• Coup franc indirect pour l’équipe adverse sur la ligne de but à l’endroit le plus proche du remplaçant, sous réserve de la procédure de la Loi 13.'
WHERE id = 271;

-- Vérification : doit retourner 69 (les 4 LGEF IDs 339-342 sont exclus)
SELECT COUNT(*) AS questions_loi_12_cfa_updated
FROM public.rq_questions q
JOIN public.rq_categories c ON c.id = q.category_id
WHERE c.law_number = 'Loi 12' AND q.id BETWEEN 203 AND 271;

COMMIT;
