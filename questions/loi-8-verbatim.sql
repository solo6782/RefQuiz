-- RefQuiz : ré-import verbatim Loi 8 depuis CFA/DA Juillet 2025
-- Source : cfa-da-qr-loi-8-juillet-2025.pdf
-- 5 questions (IDs 155-159)
-- À exécuter dans le SQL Editor de Supabase

BEGIN;

-- §1 Tirage au sort

UPDATE public.rq_questions SET
  question = 'En raison de conditions climatiques difficiles (terrain totalement ou partiellement gelé), un capitaine demande à l’arbitre qu’il soit procédé au tirage au sort, avant l’heure officielle du coup d’envoi afin d’adapter l’équipement de son gardien de but.',
  expected_answer = 'La Loi 8 ne précise effectivement pas le lieu du tirage au sort. La procédure pourrait en effet, sous certaines conditions mentionnées dans le règlement de la compétition, se dérouler en un autre endroit que le rond central immédiatement avant le coup d’envoi, et donc pourrait se faire avant ou après l’échauffement.'
WHERE id = 155;

-- §2 Balle à terre (Sous réserve de la procédure de la Loi 8)

UPDATE public.rq_questions SET
  question = 'Lors d’une balle à terre effectuée régulièrement par l’arbitre, un joueur positionné à 4 mètres du lieu de la reprise attend que le ballon rebondisse. Il vient disputer et jouer le ballon à son adversaire qui n’avait pas encore touché le ballon. Quelle doit être la décision de l’arbitre si la balle à terre est effectuée à un joueur de champ hors de la surface de réparation ? Si la balle à terre est donnée au gardien de but dans sa surface de réparation ? Explications.',
  expected_answer = 'Le ballon est en jeu dès qu’il touche le sol. Dans tous les cas, les joueurs situés à au moins 4 mètres du lieu de la remise en jeu peuvent venir disputer le ballon dès qu’il est en jeu. L’arbitre doit donc laisser le jeu se dérouler.'
WHERE id = 156;

-- §3 Questions diverses

UPDATE public.rq_questions SET
  question = 'L’arbitre donne le signal du coup d’envoi. Qu’entend-on par signal ? Est-ce le coup de sifflet ou un autre signal (geste de la main, voix) sachant que désormais un but peut être marqué directement sur coup d’envoi ?',
  expected_answer = 'Bien que dans aucune loi ne soit spécifié la nature du signal donné par l’arbitre, il est prescrit aux arbitres que les coups d’envoi et coups de pied de réparation doivent donner lieu à un signal sonore (sifflet).
Par contre, l’arbitre utilisera le signal du geste et/ou de la voix lors d’une rentrée de touche, par exemple.'
WHERE id = 157;

UPDATE public.rq_questions SET
  question = 'Après 17 secondes de jeu du coup d’envoi de la 2nde période, l’arbitre se rend compte que le gardien d’une équipe se présente au bord du terrain pour reprendre sa place dans les buts. Décisions et explications ?',
  expected_answer = 'Attendu qu’il s’agit du gardien de but, conformément à la Loi 3 paragraphe 1 :
• Arrêt du jeu.
• Coup d’envoi à recommencer.'
WHERE id = 158;

UPDATE public.rq_questions SET
  question = 'L’équipe B marque un but. L’équipe A exécute le coup d’envoi consécutif par son joueur n°10A qui, voyant le gardien de but avancé, frappe directement dans le but de l’équipe B. L’arbitre accorde le but. C’est alors que le capitaine de l’équipe B fait remarquer à l’arbitre qu’un de ses coéquipiers était resté à 20 ou 30 mètres dans le camp A au moment du coup d’envoi. Il lui dépose une réserve technique. Quelle sera la décision de l’arbitre et explications ?',
  expected_answer = 'L’arbitre, reconnaissant le fait immédiatement, applique les dispositions prévues par la Loi 8 stipulant que lors d’un coup d’envoi, tous les joueurs (à l’exception du botteur) doivent se trouver dans leur propre moitié de terrain et qu’en cas d’infraction à cette procédure, celui-ci doit être recommencé.
En conséquence, l’arbitre décidera :
• But refusé.
• Coup d’envoi à recommencer.'
WHERE id = 159;

SELECT COUNT(*) AS questions_loi_8_updated
FROM public.rq_questions q JOIN public.rq_categories c ON c.id = q.category_id
WHERE c.law_number = 'Loi 8';

COMMIT;
