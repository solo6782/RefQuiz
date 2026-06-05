-- RefQuiz : ré-import verbatim Loi 16 depuis CFA/DA Juillet 2025
-- 6 questions (IDs 330-335)

BEGIN;

UPDATE public.rq_questions SET
  question = 'Lors d’un coup de pied de but, après le botté, le ballon est renvoyé en arrière par un vent violent. À ce moment-là, un remplaçant qui se trouvait hors du terrain à proximité du but, pénètre et, en voulant dégager, détourne le ballon dans son propre but. Décisions ?',
  expected_answer = '• But accordé.
• Avertissement au remplaçant pour être entré sans autorisation. L’arbitre doit lui faire quitter le terrain.
• Coup d’envoi.'
WHERE id = 330;

UPDATE public.rq_questions SET
  question = 'Coup de pied de but pour l’équipe A. Un joueur de cette équipe botte le ballon. Aucun autre joueur ne l’a touché au moment où une rafale de vent violent le rabat dans la surface de but dans laquelle le joueur était resté. Celui-ci tente alors de l’arrêter de la main, le touche, mais ne peut l’empêcher de pénétrer dans le but. Décisions ?',
  expected_answer = '• Le joueur est le gardien de but :
   o But refusé.
   o Pas d’avertissement au gardien de but.
   o Coup franc indirect pour l’équipe B sur la ligne de la surface de but parallèle à la ligne de but au point le plus proche d’où le gardien a touché une seconde fois le ballon.
• Le joueur n’est pas le gardien de but :
   o But refusé.
   o Avertissement au joueur pour comportement antisportif.
   o Penalty pour l’équipe B.'
WHERE id = 331;

UPDATE public.rq_questions SET
  question = 'Lors d’un coup de pied de but au profit de l’équipe défendante, le joueur de cette équipe qui a exécuté la remise en jeu, touche le ballon une seconde fois consécutivement. Au moment du second contact, le ballon était en jeu. Le défenseur le perd aussitôt au profit d’un attaquant adverse qui tire et marque le but. Décisions et Explications ?',
  expected_answer = 'Si le jeu n’a pas été arrêté par l’arbitre pour sanctionner le second contact, et compte tenu du fait que le ballon a été mis en jeu normalement avant que ne se produise le second contact, il y a lieu :
• D’appliquer la règle de l’avantage et d’accorder le but.
• De reprendre le jeu par le coup d’envoi.
Toutefois si lors du botté du coup de pied de but, l’attaquant se trouvait dans la surface de réparation, le coup de pied de but est à retirer.'
WHERE id = 332;

UPDATE public.rq_questions SET
  question = 'Un défenseur de l’équipe A, dans sa surface de réparation, joue rapidement un coup de pied de but alors qu’un adversaire se trouve encore dans ladite surface et n’interfère pas avec le jeu. Sur la remise en jeu complètement ratée, le ballon franchit la ligne de la surface de réparation et arrive dans les pieds d’un autre attaquant situé tout près. Décisions ?',
  expected_answer = '• Laisser jouer.'
WHERE id = 333;

UPDATE public.rq_questions SET
  question = 'Lors de l’exécution d’un coup de pied de but, le ballon est joué par un défenseur n°5A lorsqu’un adversaire l’intercepte dans la surface de réparation et marque un but contre l’équipe A. Décisions ?',
  expected_answer = '• L’attaquant n’était pas dans la surface de réparation au moment où le ballon a été botté :
   o But accordé.
   o Coup d’envoi.
• L’attaquant n’a pas eu le temps de sortir de la surface de réparation avant le botté du coup de pied de but et n’a pas gêné l’exécution :
   o But accordé.
   o Coup d’envoi.
• L’attaquant est resté ou entré dans la surface de réparation avant le botté du coup de pied de but :
   o But refusé.
   o Coup de pied de but à refaire.'
WHERE id = 334;

UPDATE public.rq_questions SET
  question = 'Coup de pied de but pour l’équipe A. Le gardien de but lève le ballon vers un partenaire situé sur le terrain (dans ou hors de sa surface de réparation) qui le lui renvoie de la tête. Décisions ?',
  expected_answer = 'Le gardien contournant volontairement la Loi :
• Arrêt du jeu.
• Avertissement au gardien de but pour comportement antisportif.
• Coup franc indirect pour l’équipe B à l’endroit où le gardien a initié la stratégie, sous réserve de la procédure de la Loi 13.'
WHERE id = 335;

SELECT COUNT(*) AS questions_loi_16_updated
FROM public.rq_questions q JOIN public.rq_categories c ON c.id = q.category_id
WHERE c.law_number = 'Loi 16';

COMMIT;
