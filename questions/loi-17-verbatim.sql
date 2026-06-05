-- RefQuiz : ré-import verbatim Loi 17 depuis CFA/DA Juillet 2025
-- 3 questions (IDs 336-338)

BEGIN;

UPDATE public.rq_questions SET
  question = 'Lors de l’exécution d’un corner, le tireur, en le ballon du pied droit, casse le poteau de corner. Après avoir rebondit sur son pied gauche, le ballon reste sur le terrain. Décisions ?',
  expected_answer = '• Arrêt du jeu.
• Réparation ou remplacement du poteau de corner.
• Coup franc indirect pour l’équipe adverse à l’endroit où le botteur a touché deux fois consécutivement le ballon.'
WHERE id = 336;

UPDATE public.rq_questions SET
  question = 'À cause du vent, le poteau de corner flexible empêche l’exécution du corner. Le botteur décide de le retirer. Décisions ?',
  expected_answer = 'Il n’est pas possible de retirer le poteau de corner. Un partenaire peut le tenir le temps de l’exécution.'
WHERE id = 337;

UPDATE public.rq_questions SET
  question = 'Corner pour l’équipe A. L’arbitre donne le signal et le tir est exécuté. Le joueur n°9A entre alors dans la zone délimitée par les filets en passant derrière le gardien de but puis revient sur le terrain. Surpris, le gardien de but n’a pas bougé. Le joueur n°9A, à 2 mètres du but, détourne de la tête le ballon qui pénètre dans le but. Décisions ?',
  expected_answer = 'L’arbitre doit évaluer le comportement de l’attaquant :
• Sortie naturelle du terrain pour éviter les mouvements du gardien de but :
   o But accordé.
   o Coup d’envoi.
• Sortie tactique pour interférer sur le comportement du gardien de but :
   o But refusé.
   o Le joueur n°9A doit être averti pour être comportement antisportif.
   o Coup franc direct pour l’équipe B en un point quelconque de la surface de but.'
WHERE id = 338;

SELECT COUNT(*) AS questions_loi_17_updated
FROM public.rq_questions q JOIN public.rq_categories c ON c.id = q.category_id
WHERE c.law_number = 'Loi 17';

COMMIT;
