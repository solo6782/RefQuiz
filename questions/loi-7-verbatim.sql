-- RefQuiz : ré-import verbatim Loi 7 depuis CFA/DA Juillet 2025
-- Source : cfa-da-qr-loi-7-juillet-2025.pdf
-- 3 questions (IDs 152-154)
-- À exécuter dans le SQL Editor de Supabase

BEGIN;

-- §1 Temps additionnel

UPDATE public.rq_questions SET
  question = 'Dans le cas où le temps additionnel (2, 3 minutes ou plus) a été affiché et porté à la connaissance des bancs de touche et du public, il peut se produire des arrêts de jeu à l’occasion des situations suivantes :
• Une ou l’autre des équipes, voire les deux équipes, procèdent à des remplacements réglementaires,
• Des soins sont prodigués à un gardien de but sur le terrain,
• Des soins avec évacuation d’un joueur blessé.
Dans l’une ou l’autre de ces situations, l’arbitre doit-il tenir compte du temps perdu durant la période du temps additionnel ? Dans ce cas, Le 4ème arbitre doit-il montrer à nouveau le panneau indiquant le nouveau temps additionnel ?',
  expected_answer = 'L’arbitre doit effectivement tenir compte du temps perdu lors des arrêts de jeu pour cause de remplacement, blessures ou autres motifs.
Le 4ème arbitre ne doit pas montrer une seconde fois le temps de récupération pour compenser le temps perdu parce que les minutes indiquées initialement correspondent à une durée minimale.'
WHERE id = 152;

UPDATE public.rq_questions SET
  question = 'Quel temps additionnel l’arbitre doit-il ajouter lorsque deux changements (ou plus) sont effectués lors du même arrêt de jeu ?',
  expected_answer = 'Le décompte du temps perdu est laissé à l’appréciation de l’arbitre mais il ne peut en aucun cas être inférieur à 30 secondes.'
WHERE id = 153;

UPDATE public.rq_questions SET
  question = 'Lors d’une compétition « amateur », un but est marqué par l’équipe A. Celle-ci célèbre son but auprès du poteau de corner. Pendant ce temps, l’équipe B se replace et attend pour donner le coup d’envoi. Décisions et explications ?',
  expected_answer = 'La célébration d’un but fait partie du football mais elle ne doit pas être excessive.
Il appartient à l’arbitre d’activer les joueurs de l’équipe A afin qu’ils regagnent leur moitié de terrain.
Par conséquent, l’arbitre doit décompter le temps perdu uniquement à partir du moment où les joueurs de l’équipe B sont en place et ce, jusqu’au coup d’envoi.'
WHERE id = 154;

SELECT COUNT(*) AS questions_loi_7_updated
FROM public.rq_questions q JOIN public.rq_categories c ON c.id = q.category_id
WHERE c.law_number = 'Loi 7';

COMMIT;
