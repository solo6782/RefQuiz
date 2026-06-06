-- RefQuiz : ré-import verbatim Loi 9 depuis CFA/DA Juillet 2025
-- Source : cfa-da-qr-loi-9-juillet-2025.pdf
-- 2 questions (IDs 160-161)
-- À exécuter dans le SQL Editor de Supabase

BEGIN;

-- §1 Contact avec l’arbitre

UPDATE public.rq_questions SET
  question = 'Lors d’une attaque de l’équipe B, le joueur n°8B veut donner le ballon à son partenaire n°7B. Le ballon heurte l’arbitre assistant. Décisions ?',
  expected_answer = 'Le contact avec l’arbitre assistant a eu lieu hors du terrain :
• Rentrée de touche pour l’équipe A.
Le contact avec l’arbitre assistant a eu lieu sur le terrain ou sur la ligne de touche :
• Le ballon sort du terrain :
   o Rentrée de touche pour l’équipe A.
• Le ballon reste sur le terrain et entraine une attaque prometteuse pour l’équipe B :
   o Arrêt du jeu.
   o Balle à terre donnée à un joueur de l’équipe B à l’endroit où le jeu a été arrêté.
• Le ballon reste sur le terrain et n’entraine pas une attaque prometteuse pour l’équipe B :
   o Laisser jouer.
• Le ballon reste sur le terrain et est récupéré par l’équipe A :
   o Arrêt du jeu.
   o Balle à terre donnée à un joueur de l’équipe A à l’endroit où le jeu a été arrêté.'
WHERE id = 160;

UPDATE public.rq_questions SET
  question = 'Depuis sa surface de réparation, le gardien de but de l’équipe A relance le ballon à la main. Celui-ci vient toucher le dos de l’arbitre en dehors de cette surface de réparation avant de retomber dans les pieds d’un adversaire. Décisions et explications ?',
  expected_answer = '• Arrêt du jeu.
• La Loi 9 indique que le ballon se trouve hors du jeu lorsqu’il touche l’arbitre et qu’il est récupéré par l’équipe adverse. Le ballon est donc devenu hors du jeu au moment du contact avec l’arbitre.
• Balle à terre donnée à un joueur de l’équipe A à l’endroit où le jeu a été arrêté.'
WHERE id = 161;

SELECT COUNT(*) AS questions_loi_9_updated
FROM public.rq_questions q JOIN public.rq_categories c ON c.id = q.category_id
WHERE c.law_number = 'Loi 9';

COMMIT;
