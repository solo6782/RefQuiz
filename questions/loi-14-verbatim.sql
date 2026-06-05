-- RefQuiz : ré-import verbatim Loi 14 depuis CFA/DA Juillet 2025
-- 28 questions (IDs 289-316)

BEGIN;

UPDATE public.rq_questions SET
  question = 'Après le botté du joueur, à quel moment le penalty est-il considéré comme pleinement exécuté ?',
  expected_answer = 'Le penalty est terminé lorsque :
• Le ballon arrête de bouger,
• Il sort en dehors des limites du terrain,
• L’arbitre arrête le jeu pour sanctionner une infraction aux Lois du Jeu.'
WHERE id = 289;

UPDATE public.rq_questions SET
  question = 'Penalty à l’issue du temps réglementaire. Le ballon est botté régulièrement et le gardien le dévie sur la barre transversale. Le ballon rebondit au sol 5m devant la ligne de but puis, par un effet "rétro", pénètre dans le but. Décisions et explications ?',
  expected_answer = '• But accordé.
• L’IFAB précise que "le penalty est terminé lorsque le ballon arrête de bouger".
• Fin de la période.'
WHERE id = 290;

UPDATE public.rq_questions SET
  question = 'Quelle doit être la reprise du jeu lorsque le ballon éclate lors de l’exécution d’un penalty ?',
  expected_answer = '• Le ballon devient défectueux sur le botté ou bien après avoir été botté mais avant de toucher les poteaux, la barre transversale ou le gardien, sans avoir traversé la ligne de but :
   o Arrêt du jeu.
   o Changement de ballon.
   o Le penalty doit être recommencé.
   o Dans le cas où l’arbitre a prolongé une période pour permettre l’exécution du penalty : la période de jeu doit être prolongée.
• Le ballon devient défectueux après avoir été botté et après avoir touché les poteaux, la barre transversale ou le gardien, sans avoir traversé la ligne de but :
   o Arrêt du jeu.
   o Changement de ballon.
   o Balle à terre donnée au gardien de but.
   o Dans le cas où l’arbitre a prolongé une période pour permettre l’exécution du penalty : fin de la période.
• Le ballon éclate après avoir franchi la ligne de but :
   o Changement de ballon.
   o But accordé, coup d’envoi ou reprise consécutive à la sortie du ballon'
WHERE id = 291;

UPDATE public.rq_questions SET
  question = 'Penalty. Un défenseur, blessé, se fait soigner derrière la ligne de but. Le ballon, joué par le tireur, est en jeu normalement lorsque le blessé rentre sur le terrain et d’un coup de pied l’empêche de pénétrer dans le but. Décisions ?',
  expected_answer = '• Arrêt du jeu.
• Exclusion du joueur fautif pour avoir empêché l’équipe adverse de marquer un but.
• Penalty à recommencer.
• Rapport.'
WHERE id = 292;

UPDATE public.rq_questions SET
  question = 'Lors de l’exécution d’un penalty, le gardien de but sautille latéralement sur sa ligne de but sans la quitter. Décisions et explications ?',
  expected_answer = 'Dans cette situation, il faut considérer que l’obligation pour le gardien de but de rester sur sa ligne est respectée.
Il doit obligatoirement faire face au tireur, entre les poteaux avant que le tir ne soit effectué.
Il ne peut distraire abusivement le tireur, par exemple en retardant l’exécution du penalty ou en touchant les poteaux, la barre transversale ou les filets.
Si ces conditions sont toutes réunies, l’arbitre n’interviendra pas.'
WHERE id = 293;

UPDATE public.rq_questions SET
  question = 'Lors de l’exécution d’un penalty, le gardien de but s’avance avant que le ballon ne soit botté et le tir est exécuté. Décisions ?',
  expected_answer = '• Le ballon pénètre dans le but :
   o But accordé.
   o Coup d’envoi.
• Le ballon ne pénètre pas dans le but :
   Le gardien de but a au moins un pied sur ou derrière sa ligne de but :
   o Laisser jouer ou reprise consécutive à l’arrêt.
   Le gardien de but n’a pas au moins un pied sur ou derrière sa ligne de but :
   o Pas d’influence sur le tireur (ballon hors du but ou sur un montant et/ou barre transversale) : laisser jouer ou reprise consécutive à l’arrêt.
   o Influence sur le tireur ou tir repoussé par le gardien : arrêt du jeu. Mise en garde du gardien de but. Penalty à refaire.'
WHERE id = 294;

UPDATE public.rq_questions SET
  question = 'À la 30ème minute de match, lors de l’exécution d’un penalty, quelles décisions devra prendre l’arbitre si :
a) Le tireur use d’une feinte illégale entre le signal de l’arbitre et le botté ?
b) Le tireur et le gardien de but se rendent coupables en même temps d’une infraction ?',
  expected_answer = 'a)
• Dans tous les cas : arrêt du jeu ou but refusé. Avertissement au tireur pour comportement antisportif. Coup franc indirect pour l’équipe défendante sur le point de penalty.
b)
• Dans tous les cas : arrêt du jeu ou but refusé. Avertissement au tireur pour comportement antisportif. Coup franc indirect pour l’équipe défendante sur le point de penalty.'
WHERE id = 295;

UPDATE public.rq_questions SET
  question = 'Un défenseur, entre le signal et le botté, pénètre dans la surface de réparation ou s’approche à moins de 9,15 m du ballon (faute d’empiètement). Décisions ?',
  expected_answer = '• But marqué : but accordé, coup d’envoi.
• Dans tous les autres cas :
   o Si incidence : penalty à recommencer.
   o Si pas d’incidence : reprise consécutive à l’arrêt ou laisser jouer.
N.B. : Penalty à la fin du temps réglementaire : mêmes réponses que ci-dessus et fin de la période ou du match.'
WHERE id = 296;

UPDATE public.rq_questions SET
  question = 'Penalty. Le joueur devant tirer se présente à l’arbitre. Entre le coup de sifflet et le botté, un partenaire du tireur entre dans la surface de réparation et tire le penalty à sa place. Le ballon franchit la ligne de but en dehors des montants. Décisions ?',
  expected_answer = '• Avertissement au botteur pour comportement antisportif.
• Coup franc indirect pour l’équipe adverse sur le point de penalty.
N.B. : Penalty à la fin du temps réglementaire : fin de la période ou du match.'
WHERE id = 297;

UPDATE public.rq_questions SET
  question = 'Penalty durant le temps réglementaire. Un attaquant se place en dehors de la surface de réparation, entre la ligne de but et une ligne parallèle à celle-ci, passant par le point de réparation. Le penalty est tiré régulièrement, le ballon est repoussé par le gardien sur ce joueur qui marque. Décisions et explications ?',
  expected_answer = '• But refusé.
• L’arbitre a donné à tort le signal d’exécution du penalty sans s’assurer que tous les joueurs aient pris une position conforme à la Loi 14.
• Penalty à retirer.'
WHERE id = 298;

UPDATE public.rq_questions SET
  question = 'Lors de l’exécution d’un penalty, un attaquant autre que le botteur, est situé hors de la surface de réparation, derrière le ballon. Après le coup de sifflet, il se porte en avant du ballon, se trouvant ainsi plus rapproché de la ligne de but que celui-ci au moment du botté. Le tir est effectué et le ballon est repoussé dans le terrain. Décisions ?',
  expected_answer = 'Si cet attaquant joue ou dispute le ballon à un adversaire :
• Arrêt du jeu.
• Coup franc indirect en faveur de l’équipe adverse à l’endroit de l’interférence, sous réserve de la procédure de la Loi 3.
Sinon :
• Laisser jouer.'
WHERE id = 299;

UPDATE public.rq_questions SET
  question = 'Un attaquant, autre que le botteur du penalty, entre le signal et le botté, pénètre dans la surface de réparation ou s’approche à moins de 9,15 m du ballon (faute d’empiètement). Décisions ?',
  expected_answer = '• But marqué :
   o Si incidence : but refusé, penalty à recommencer.
   o Si pas d’incidence : but accordé, coup d’envoi.
• Dans tous les autres cas :
   o Si incidence : coup franc indirect pour l’équipe adverse à l’endroit de l’incidence, sous réserve de la procédure de la Loi 13.
   o Si pas d’incidence : reprise consécutive à l’arrêt ou laisser jouer.
N.B. : Penalty à la fin du temps réglementaire : but accordé le cas échéant et fin de la période ou du match. Si le but ne peut pas être accordé, dans tous les cas, fin de la période ou du match.'
WHERE id = 300;

UPDATE public.rq_questions SET
  question = 'Un joueur, bottant un penalty, feinte le gardien avant de tirer. Décisions ?',
  expected_answer = 'Il est permis au tireur de réaliser une feinte lors de l’exécution d’un penalty.
Par contre, la feinte est considérée comme illégale lorsque, après avoir terminé sa course, tout juste avant de botter le ballon, le tireur fait semblant de botter, pour attendre le plongeon du gardien de but et botte seulement ensuite. On doit considérer que cela rompt la fluidité et le rythme du botté. La dernière foulée et le tir doivent donc constituer un ensemble fluide et un même mouvement. Dans ce cas, le tireur sera averti pour comportement antisportif.'
WHERE id = 301;

UPDATE public.rq_questions SET
  question = 'La Loi 14 ne précise pas l’endroit de la remise en jeu lorsque le botteur commet une feinte illégale, quand le but n’est pas marqué et après que l’arbitre ait adressé un avertissement au botteur pour comportement antisportif ?',
  expected_answer = '• Coup franc indirect pour l’équipe défendante à l’endroit où la faute a été commise (point de penalty).'
WHERE id = 302;

UPDATE public.rq_questions SET
  question = 'Penalty. Le botteur commet une feinte illégale (arrêt de sa course et attente du plongeon du gardien) puis tire. Décisions ?',
  expected_answer = 'Dans tous les cas :
• Arrêt du jeu.
• Avertissement au botteur pour comportement antisportif.
• Coup franc indirect pour l’équipe défendante sur le point de penalty.
N.B. : si penalty à la fin du temps réglementaire, dans tous les cas, fin de la période ou du match.'
WHERE id = 303;

UPDATE public.rq_questions SET
  question = 'Lors de l’exécution d’un penalty, deux fautes sont commises en même temps (feinte illégale du botteur et une faute par un autre joueur). Décisions et explications ?',
  expected_answer = '• En cas de fautes commises en même temps, la feinte illégale du botteur est considérée la plus grave.
• Dans tous les cas : arrêt du jeu ou but refusé. Avertissement au botteur pour comportement antisportif. Coup franc indirect pour l’équipe défendante sur le point de penalty.
N.B. : si penalty à la fin du temps réglementaire, dans tous les cas, fin de la période ou du match.'
WHERE id = 304;

UPDATE public.rq_questions SET
  question = 'Penalty. Le botteur de l’équipe A use d’une feinte illégale. Le ballon est repoussé par un montant et est repris par le botteur. Décisions et explications ?',
  expected_answer = '• Arrêt du jeu.
• Avertissement au botteur pour comportement antisportif.
• S’agissant de deux fautes consécutives commises par la même équipe, la feinte illégale est à sanctionner avant la faute de "toucher deux fois consécutivement le ballon".
• Coup franc indirect pour l’équipe B sur le point de penalty.
N.B. : si penalty à la fin du temps réglementaire, dans tous les cas, fin de la période ou du match.'
WHERE id = 305;

UPDATE public.rq_questions SET
  question = 'Le joueur identifié, chargé du botté, s’élance et passe au-dessus du ballon sans le toucher. Dans le même temps, un de ses coéquipiers, régulièrement placé, le suit et effectue le tir à sa place. Décisions si :
a) Le but est marqué.
b) Le ballon va en sortie de but.
c) Le ballon est détourné en corner, en ligne de touche ou bien revient en jeu.',
  expected_answer = '• Si le but est marqué : but refusé.
• Avertissement aux deux joueurs pour comportement antisportif.
• Dans tous les cas : coup franc indirect pour l’équipe défendante sur le point de penalty.
N.B. : si penalty à la fin du temps réglementaire, dans tous les cas, fin de la période ou du match.'
WHERE id = 306;

UPDATE public.rq_questions SET
  question = 'Un penalty est tiré tout à fait normalement par l’équipe B et le but est marqué. C’est alors qu’un assistant fait observer à l’arbitre que, pendant l’exécution du penalty, un remplaçant qui s’échauffait a traversé une partie du terrain sans nuire en quoi que ce soit à l’exécution du penalty. Cela, afin de regagner son banc de touche dans la perspective d’un remplacement imminent. Décisions et explications ?',
  expected_answer = '• Avertissement au remplaçant pour avoir pénétré délibérément sur le terrain sans l’autorisation de l’arbitre.
• Ce fait n’a eu aucune interférence sur l’exécution du penalty :
   o Le remplaçant appartient à l’équipe B qui botte le penalty : but accordé. Coup d’envoi.
   o Le remplaçant appartient à l’équipe A : but accordé. Coup d’envoi.'
WHERE id = 307;

UPDATE public.rq_questions SET
  question = 'Lors de l’exécution d’un penalty en cours de rencontre, un remplaçant A pénètre volontairement sur le terrain de jeu. Décisions ?',
  expected_answer = 'Dans tous les cas :
• Avertissement au remplaçant pour avoir pénétré délibérément sur le terrain sans l’autorisation de l’arbitre.
• L’arbitre doit lui faire quitter le terrain.
Le remplaçant n’interfère pas :
• L’arbitre laissera l’exécution du penalty se dérouler.
Le remplaçant interfère :
• Le remplaçant est un partenaire du tireur :
   o But marqué : but refusé. Coup franc direct pour l’équipe B à l’endroit où se trouvait le remplaçant lorsque l’interférence s’est produite, sous réserve de la procédure de la Loi 13.
   o But non marqué : arrêt du jeu. Coup franc direct pour l’équipe B à l’endroit où se trouvait le remplaçant lorsque l’interférence s’est produite, sous réserve de la procédure de la Loi 13.
• Le remplaçant est un adversaire du tireur :
   o But marqué : but accordé. Coup d’envoi.
   o But non marqué : arrêt du jeu. Penalty à retirer.'
WHERE id = 308;

UPDATE public.rq_questions SET
  question = 'Lors d’un penalty, sans qu’aucune faute à la procédure d’exécution soit commise, le tireur botte le ballon qui parcourt 10 mètres en avant. À ce moment-là :
a) Un attaquant frappe un défenseur.
b) Un défenseur frappe un attaquant.',
  expected_answer = 'Dans les deux cas, exclusion du joueur fautif pour acte de brutalité.
a) Quel que soit le résultat du tir : coup franc direct pour l’équipe défendante à l’endroit de la faute.
b) Sous réserve de l’avantage, coup franc direct pour l’équipe attaquante à l’endroit de la faute ou penalty si l’attaquant était entré dans la surface de réparation au moment de la faute.
Rapport.'
WHERE id = 309;

UPDATE public.rq_questions SET
  question = 'Lors de l’exécution d’un penalty, entre le signal et le botté, un attaquant a un comportement antisportif ou brutal. Le but n’est pas marqué. Décisions et explications ?',
  expected_answer = '• Arrêt du jeu
• Sanction disciplinaire appropriée (avertissement pour comportement antisportif ou exclusion pour avoir commis un acte de brutalité).
• L’IFAB précise qu’une fois le signal donné mais avant que le ballon soit en jeu et si un coéquipier enfreint les Lois du Jeu : "l’arbitre interrompt le jeu et le fait reprendre par un coup franc indirect si le ballon ne pénètre pas dans le but".
• Coup franc indirect pour l’équipe défendante à l’endroit de la faute.
• Rapport en cas d’exclusion.'
WHERE id = 310;

UPDATE public.rq_questions SET
  question = 'Après le coup de sifflet donnant l’ordre d’exécution d’un penalty et avant le botté du ballon, un partenaire du tireur, placé irrégulièrement dans la surface de réparation, frappe un adversaire régulièrement placé. L’arbitre n’a pas le temps d’intervenir et laisse exécuter le penalty. Le ballon frappe le montant de but et revient en jeu. Décisions ?',
  expected_answer = '• Arrêt du jeu.
• Exclusion du joueur fautif pour acte de brutalité.
• Coup franc indirect pour l’équipe défendante à l’endroit de la faute.
• Rapport.'
WHERE id = 311;

UPDATE public.rq_questions SET
  question = 'L’arbitre prolonge le match pour permettre l’exécution d’un penalty. Pendant que le botteur effectue son tir, un joueur de l’équipe défendante est l’auteur d’un comportement antisportif ou d’un acte de brutalité. Le ballon va directement au fond des filets. Décisions et explications ?',
  expected_answer = '• But accordé.
• Sanction disciplinaire appropriée (avertissement pour comportement antisportif ou exclusion pour avoir commis un acte de brutalité).
• Fin du match.
• Rapport en cas d’exclusion.'
WHERE id = 312;

UPDATE public.rq_questions SET
  question = 'La partie est prolongée pour l’exécution d’un penalty en faveur de l’équipe A. Après le coup de sifflet et après le botté, pendant la trajectoire du ballon, un défenseur de l’équipe B régulièrement placé jette une pierre sur le tireur. Le ballon sort en ligne de but en dehors des montants. Décisions et explications ?',
  expected_answer = '• Exclusion du défenseur de l’équipe B pour acte de brutalité.
• Le but n’ayant pas été marqué et le tireur étant situé dans la surface de réparation, l’arbitre sanctionnera l’équipe fautive d’un nouveau penalty.
• Il prolongera à nouveau la partie pour en permettre son exécution.
• Rapport.'
WHERE id = 313;

UPDATE public.rq_questions SET
  question = 'Penalty à la fin du temps réglementaire. Le tireur frappe le ballon de telle manière que celui-ci roule lentement vers l’avant. Un partenaire, régulièrement placé, pénètre dans la surface de réparation, reprend le ballon et marque. Décisions ?',
  expected_answer = '• But refusé.
• Match arrêté définitivement dès que le partenaire touche le ballon.'
WHERE id = 314;

UPDATE public.rq_questions SET
  question = 'Penalty. Le joueur botte avant le signal de l’arbitre. Décisions ?',
  expected_answer = '• Dans tous les cas, le penalty est à recommencer.'
WHERE id = 315;

UPDATE public.rq_questions SET
  question = 'Lors d’un penalty, sans qu’aucune autre faute à la procédure d’exécution soit commise, le tireur, au moment de botter le ballon du point de penalty, effectue deux contacts consécutifs avec le ballon.
a) Décisions s’il s’agit de deux contacts consécutifs accidentels (botteur qui glisse involontairement lors de la frappe) ?
b) Décisions s’il s’agit de deux contacts consécutifs délibérés (botteur qui cherche intentionnellement un deuxième contact) ?',
  expected_answer = 'a) Si le penalty est marqué : but refusé et penalty à retirer.
   Si le penalty est manqué : coup franc indirect sur le point de penalty.
   N.B. : si penalty à la fin du temps réglementaire et si le but n’est pas marqué, fin de la période ou du match.
b) Dans tous les cas : coup franc indirect sur le point de penalty.
   N.B. : si penalty à la fin du temps réglementaire, fin de la période ou du match.'
WHERE id = 316;

SELECT COUNT(*) AS questions_loi_14_updated
FROM public.rq_questions q
JOIN public.rq_categories c ON c.id = q.category_id
WHERE c.law_number = 'Loi 14';

COMMIT;
