-- RefQuiz : ré-import verbatim Loi 1 depuis CFA/DA Juillet 2025
-- 12 questions (IDs 1-12)

BEGIN;

UPDATE public.rq_questions SET
  question = 'En raison d’une panne d’éclairage, le coup d’envoi d’une rencontre prévue à 20 heures n’a lieu qu’à 20H15. Au coup de sifflet indiquant la fin de la 1ère période, qui s’est déroulée normalement, une panne d’éclairage survient. Comment l’arbitre agira-t-il dans le décompte du temps d’interruption de la rencontre ? Les 30 minutes maximales doivent-elles inclure ou non le temps de la mi-temps ?',
  expected_answer = 'Le décompte du temps d’interruption de la rencontre débute aussitôt car l’arbitre fait le constat de la panne immédiatement. La durée de la mi-temps fait partie du temps décompté.'
WHERE id = 1;

UPDATE public.rq_questions SET
  question = 'Toutes les heures indiquées sont des heures précises (pile…) : match à 20 heures.
Panne d’électricité à 19H50. Le match commence à 20 H 32. L’arbitre siffle la mi-temps à 21H17 et en même temps la panne débute. Quand le match est-il arrêté définitivement ? 21H17 + 13 = 21H30 ?',
  expected_answer = 'Le match sera reporté à un autre jour au moment où la montre affiche 21H30.'
WHERE id = 2;

UPDATE public.rq_questions SET
  question = 'Panne d’électricité. Un dirigeant informe l’arbitre au vestiaire. Celui-ci est-il tenu d’aller vérifier afin de décompter le temps d’interruption immédiatement ou peut-il attendre le retour sur le terrain pour en prendre acte ?',
  expected_answer = 'L’arbitre doit décompter le temps d’interruption dès qu’il constate lui-même la panne, après en avoir été informé.
Dans le cas présent, il se rendra immédiatement sur le terrain pour en prendre acte.'
WHERE id = 3;

UPDATE public.rq_questions SET
  question = 'Un match est interrompu à plusieurs reprises pour des motifs liés, à la fois, aux conditions atmosphériques et à des pannes d’électricité. L’arbitre doit-il cumuler les arrêts selon les différents motifs ?',
  expected_answer = 'L’interruption maximale de 45 minutes comprend à la fois les motifs d’arrêts pour intempéries et pour pannes d’éclairage.'
WHERE id = 4;

UPDATE public.rq_questions SET
  question = 'La durée maximale d’interruption d’un match, en raison de mauvaises conditions atmosphériques (brouillard, etc…), est-elle la même pour toutes les catégories de rencontre (match de jeunes par exemple) ?',
  expected_answer = 'La durée d’interruption maximale est de 45 minutes pour toutes les catégories de rencontres, quelle que soit la durée de chaque période de jeu prévue par les règlements.'
WHERE id = 5;

UPDATE public.rq_questions SET
  question = 'Lorsque l’arbitre, en cours de rencontre, est amené à interrompre celle-ci pour faire retracer les lignes, quel délai doit-il laisser au club organisateur pour remettre le terrain en conformité ?',
  expected_answer = 'Il y a lieu d’appliquer un délai de 45 minutes.
Ce délai est celui correspondant au délai d’acceptabilité d’une réserve d’avant match portant sur la non-conformité du terrain.'
WHERE id = 6;

UPDATE public.rq_questions SET
  question = 'Dans le cas de réserves concernant l’équipement du terrain, l’équipe adverse doit les déposer 45 minutes avant la rencontre. Si le club recevant ne peut pas répondre favorablement à la demande de l’arbitre au regard des réserves, le match n’aura pas lieu. Par contre, si ces réserves sont posées 20 minutes avant la rencontre et que les modifications ne peuvent être apportées (réserve fondée) le match aura lieu. Comment peut-on expliquer qu’un arbitre puisse laisser un match se dérouler sur un terrain non conforme ?',
  expected_answer = 'Le délai de 45 minutes a été institué par la Fédération pour permettre au club recevant, en cas d’anomalie, de procéder aux modifications nécessaires. Ce délai est d’ailleurs à rapprocher au délai normal d’une heure minimum avant le coup d’envoi pour l’arrivée de l’arbitre au stade. Dès son arrivée, celui-ci doit procéder à l’inspection du terrain et faire part au club recevant des anomalies constatées.
Par exemple, en cas de réserves fondées sur des éléments de non-conformité, déposées seulement 20 minutes avant le coup d’envoi, deux cas de figure peuvent se produire :
• L’anomalie est légère, le match aura lieu.
• L’anomalie est importante (barre transversale brisée lors de l’échauffement), le match n’aura pas lieu.'
WHERE id = 7;

UPDATE public.rq_questions SET
  question = 'Que doit faire l’arbitre lorsque le poteau de corner se brise de façon accidentelle en cours de match ?',
  expected_answer = 'Arrêt du jeu. Faire retirer le poteau défectueux et demander sa réparation ou son remplacement par un poteau conforme.
Dans le cas où le club recevant ne peut pas fournir un nouveau poteau de corner ou si le poteau n’est pas réparable, l’arbitre doit faire reprendre la rencontre en s’efforçant de trouver un moyen de remplacement provisoire (de fortune).'
WHERE id = 8;

UPDATE public.rq_questions SET
  question = 'Lors de l’inspection du terrain avant la rencontre, l’arbitre se rend compte que les montants des buts sont couverts de diverses publicités. Quelle est la conduite à tenir ?',
  expected_answer = 'Conformément à la Loi 1, qui dit que "Tout type de publicité est interdit sur les buts, les filets de but, les poteaux de corner et le drapeau de coin", l’arbitre demandera que les publicités soient enlevées afin que le match puisse débuter.
Si le club recevant n’est pas en mesure d’enlever les publicités, le match n’aura pas lieu. L’arbitre fera un rapport.'
WHERE id = 9;

UPDATE public.rq_questions SET
  question = 'Lever de rideau – Retard d’équipe
1. Si une heure avant le coup d’envoi du match principal, deux équipes s’apprêtent seulement à donner le coup d’envoi de leur match, le délégué ou l’arbitre du match principal peuvent-ils d’autorité, l’un ou l’autre, interdire ce lever de rideau, étant donné que son déroulement normal retardera d’au moins 30 minutes le coup d’envoi du match principal ?
2. Même question mais la demande d’arrêt est faite par un capitaine d’équipe.
3. Même question, mais le match de lever de rideau se terminera avec seulement un quart d’heure de retard.',
  expected_answer = 'Bien que cette question soit plutôt du domaine réglementaire, la Section dit qu’il appartient à l’arbitre du lever de rideau de prendre ses responsabilités.
Toutefois, si c’est impératif, l’arbitre du match de lever de rideau doit arrêter le lever de rideau à temps (sauf circonstances exceptionnelles qui ont fait que l’arbitre du match principal ait donné son accord), pour que le match principal débute à l’heure prévue.'
WHERE id = 10;

UPDATE public.rq_questions SET
  question = 'Match de lever de rideau susceptible de rendre le terrain impraticable pour le match principal. Que doit faire l’arbitre ?',
  expected_answer = 'Le délégué, ou mieux l’arbitre, doit interrompre le lever de rideau dès qu’il se rend compte que le terrain est ou va devenir impraticable, sans tenir compte du temps qu’il reste à jouer.
Il est précisé que les Commissions Fédérales des Championnats Nationaux admettent la possibilité de poursuivre la rencontre sur un terrain de repli homologué.'
WHERE id = 11;

UPDATE public.rq_questions SET
  question = 'Comment l’arbitre agira-t-il si l’équipe locale lui présente un arrêté municipal alors que le match a débuté ?',
  expected_answer = 'L’arbitre devra arrêter immédiatement la rencontre.
Il gardera l’arrêté municipal et l’enverra avec son rapport en précisant, en particulier, les conditions dans lesquelles l’arrêté lui a été présenté.'
WHERE id = 12;

SELECT COUNT(*) AS questions_loi_1_updated
FROM public.rq_questions q JOIN public.rq_categories c ON c.id = q.category_id
WHERE c.law_number = 'Loi 1';

COMMIT;
