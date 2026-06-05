-- RefQuiz : ré-import verbatim Loi 15 depuis CFA/DA Juillet 2025
-- 13 questions (IDs 317-329)

BEGIN;

UPDATE public.rq_questions SET
  question = 'Rentrée de touche effectuée régulièrement par l’équipe A, à l’intention de son gardien de but. Celui-ci, situé à l’extérieur de sa surface de réparation, contrôle le ballon du pied et le ramène dans sa surface puis s’en saisit des mains. Décisions ?',
  expected_answer = '• Arrêt du jeu.
• Coup franc indirect à l’endroit où il se saisit du ballon des mains, sous réserve de la procédure de la Loi 13.'
WHERE id = 317;

UPDATE public.rq_questions SET
  question = 'Lors d’une rentrée de touche, le ballon rebondit à l’extérieur du terrain avant d’y pénétrer. Décisions ?',
  expected_answer = '• Que la rentrée de touche soit régulière ou irrégulière : à refaire par la même équipe au même endroit.'
WHERE id = 318;

UPDATE public.rq_questions SET
  question = 'Lors d’une rentrée de touche, le joueur lance le ballon en dehors du champ de jeu de façon :
a) volontaire
b) involontaire
Décisions ?',
  expected_answer = 'a) Avertissement au joueur pour comportement antisportif. Rentrée de touche à refaire par la même équipe au même endroit.
b) Rentrée de touche à refaire par la même équipe.'
WHERE id = 319;

UPDATE public.rq_questions SET
  question = 'Doit-on considérer qu’il y a faute, ou non, lorsqu’un joueur exécute une rentrée de touche à plus d’un mètre de la ligne de touche, ou doit-on considérer que la rentrée de touche n’est pas correctement effectuée et donner l’autorisation à l’équipe bénéficiaire de la remise en jeu de la recommencer ?',
  expected_answer = 'La rentrée de touche a été effectué régulièrement, elle est considérée comme valable.
La distance entre le joueur qui l’exécute et la ligne de touche est laissée à l’appréciation de l’arbitre.'
WHERE id = 320;

UPDATE public.rq_questions SET
  question = 'Sur une rentrée de touche, un joueur, adversaire de celui qui fait la remise en jeu, se place sur la ligne de touche ou près de celle-ci. Quelle doit être l’attitude de l’arbitre, voire de l’arbitre assistant, en cette circonstance ?',
  expected_answer = 'Le joueur adverse doit se tenir à une distance d’au moins 2 mètres du point de la ligne de touche où doit être effectuée la rentrée de touche.
L’arbitre ou l’arbitre assistant doit faire respecter cette distance.
Si le joueur n’obtempère pas, il reçoit un avertissement pour comportement antisportif.'
WHERE id = 321;

UPDATE public.rq_questions SET
  question = 'Sur une rentrée de touche pour l’équipe A, un adversaire reste à moins de 2 mètres de la ligne de touche et dévie le ballon de la tête derrière sa ligne de but, en dehors des montants. Décisions et explications ?',
  expected_answer = '• Avertissement au joueur de l’équipe B pour comportement antisportif.
• L’arbitre choisira la reprise de jeu la plus avantageuse au profit de l’équipe A entre le coup franc indirect à l’endroit de la position du joueur B et le corner.'
WHERE id = 322;

UPDATE public.rq_questions SET
  question = 'Lors d’une rentrée de touche effectuée régulièrement, un joueur de l’équipe A envoie volontairement et violemment le ballon au visage d’un adversaire que ne situait pas à plus de 2 mètres du lieu de la remise en jeu. Décisions ?',
  expected_answer = 'Deux cas de figure sont à envisager :
• L’adversaire ne se situe pas à la distance en raison de l’action de jeu qui précédait (ce joueur n’a pas eu le temps de se reculer) :
   o Arrêt du jeu.
   o Exclusion de l’exécutant pour acte de brutalité.
   o Coup franc direct pour l’équipe B à l’endroit où se trouvait le joueur B qui reçoit le ballon dans la figure.
• L’adversaire vient volontairement se placer à une distance inférieure à 2 mètres et avant que l’arbitre ne puisse intervenir pour le faire reculer, l’exécutant de la rentrée de touche lance le ballon dans la figure de son adversaire :
   o Arrêt du jeu.
   o Exclusion de l’exécutant pour acte de brutalité.
   o Avertissement au joueur B pour comportement antisportif.
   o Coup franc indirect pour l’équipe A à l’endroit où se situait le joueur B.
• Rapport.'
WHERE id = 323;

UPDATE public.rq_questions SET
  question = 'Une rentrée de touche est exécutée par un joueur de l’équipe A alors qu’un adversaire B n’est pas à distance. Décisions ?',
  expected_answer = '• Le joueur B gêne abusivement l’exécutant (Loi 15 – IFAB) :
   o Rentrée de touche régulière : arrêt du jeu. Avertissement au joueur B pour comportement antisportif. Coup franc indirect pour l’équipe A à l’endroit du joueur B.
   o Rentrée de touche irrégulière : arrêt du jeu. Avertissement au joueur B pour comportement antisportif. Rentrée de touche à refaire par l’équipe A.
• Le joueur B ne gêne pas abusivement l’exécutant :
   o Rentrée de touche régulière : laisser jouer.
   o Rentrée de touche irrégulière : arrêt du jeu. Touche à refaire par l’équipe B.'
WHERE id = 324;

UPDATE public.rq_questions SET
  question = 'Rentrée de touche. Le joueur chargé de remettre le ballon en jeu s’accroupit afin de donner le ballon dans les pieds de son coéquipier situé à un mètre du lieu de la remise en jeu. Décisions et explications ?',
  expected_answer = 'Cette façon d’exécuter la rentrée de touche n’est pas permise par la Loi 15. L’arbitre la considérera comme irrégulière et il demandera à l’équipe adverse de la refaire au même endroit.'
WHERE id = 325;

UPDATE public.rq_questions SET
  question = 'Le ballon sort en ligne de touche juste à côté du drapeau de coin. Le joueur qui effectue la remise en jeu, dans la précipitation, lance le ballon de façon correcte dans le terrain mais le ballon pénètre sur le terrain par la ligne de but et non par la ligne de touche. Décisions ?',
  expected_answer = '• Rentrée de touche à refaire par la même équipe.'
WHERE id = 326;

UPDATE public.rq_questions SET
  question = 'Rentrée de touche. Un joueur, pour gagner du temps, effectue la remise en jeu à plus de 2 mètres de la ligne de touche mais le ballon ne rentre pas en jeu. Décisions ?
De même, un joueur n’a qu’un seul pied qui touche le sol lors d’une rentrée de touche. Le ballon ne rentre pas sur le terrain. Décisions ?',
  expected_answer = 'Lorsque le ballon ne rentre pas sur le terrain, la rentrée de touche est à refaire par l’équipe bénéficiaire.
La distance de 2 mètres, intervenant dans la question, ne constitue plus un critère d’évaluation de la validité de la rentrée de touche, la distance qui sépare l’exécutant et la ligne de touche est laissée à l’appréciation de l’arbitre.
De même, si un joueur exécute de manière irrégulière la rentrée de touche (un seul pied au sol), mais que le ballon ne rentre pas sur le terrain, il n’est pas en jeu donc la rentrée de touche sera à refaire par la même équipe.'
WHERE id = 327;

UPDATE public.rq_questions SET
  question = 'Un joueur de l’équipe A, a un différend avec un partenaire lors d’une rentrée de touche en sa faveur. Ce même joueur l’insulte et lui lance violemment le ballon au visage lors de l’exécution. Décisions ?',
  expected_answer = '• Arrêt du jeu.
• Exclusion du joueur fautif pour acte de brutalité.
• La victime se trouve sur le terrain :
   o Rentrée de touche irrégulière : à refaire par l’équipe adverse
   o Rentrée de touche régulière : coup franc direct pour l’équipe B à l’endroit où se trouvait la victime.
• La victime se trouve en dehors du terrain : rentrée de touche à refaire par la même équipe.
• Rapport.'
WHERE id = 328;

UPDATE public.rq_questions SET
  question = 'Lors d’une rentrée de touche effectuée régulièrement, un joueur reste à moins de 2 mètres du lieu de la remise en jeu. Avant l’intervention de l’arbitre, la touche est exécutée et le joueur dévie volontairement le ballon de la main. Décisions ?',
  expected_answer = '• Sous réserve de l’avantage, arrêt du jeu.
• Premier avertissement au fautif pour comportement antisportif, second avertissement pour comportement antisportif (main), exclusion pour avoir reçu deux avertissements au cours de la même rencontre.
• Coup franc direct pour l’équipe adverse à l’endroit de la faute de main.
• Rapport.'
WHERE id = 329;

SELECT COUNT(*) AS questions_loi_15_updated
FROM public.rq_questions q JOIN public.rq_categories c ON c.id = q.category_id
WHERE c.law_number = 'Loi 15';

COMMIT;
