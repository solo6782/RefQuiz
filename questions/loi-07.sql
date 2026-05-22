-- ============================================================
-- RefQuiz — Questions Loi 7 (La durée du match)
-- Source : CFA/DA — Section "Lois du Jeu" — Questions/Réponses — Juillet 2025
-- Format : questions ouvertes (évaluées par IA), réponses = corrigé officiel.
-- ============================================================

ALTER TABLE public.rq_questions ADD COLUMN IF NOT EXISTS source TEXT;

INSERT INTO public.rq_questions (category_id, type, question, expected_answer, explanation, difficulty, source)
VALUES
((SELECT id FROM public.rq_categories WHERE law_number='Loi 7'), 'open',
 'Le temps additionnel a été affiché et porté à la connaissance des bancs et du public. Pendant ce temps additionnel surviennent des arrêts de jeu (remplacements, soins à un gardien sur le terrain, soins avec évacuation d''un blessé). L''arbitre doit-il tenir compte de ce temps perdu ? Le 4e arbitre doit-il montrer à nouveau le panneau ?',
 'Oui, l''arbitre doit tenir compte du temps perdu lors de ces arrêts (remplacements, blessures ou autres motifs). En revanche, le 4e arbitre ne doit pas montrer une seconde fois le temps de récupération, car les minutes indiquées initialement correspondent à une durée minimale.',
 NULL, 2, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 7'), 'open',
 'Quel temps additionnel l''arbitre doit-il ajouter lorsque deux changements (ou plus) sont effectués lors du même arrêt de jeu ?',
 'Le décompte du temps perdu est laissé à l''appréciation de l''arbitre, mais il ne peut en aucun cas être inférieur à 30 secondes.',
 NULL, 2, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 7'), 'open',
 'Compétition amateur : l''équipe A marque et célèbre son but auprès du poteau de corner pendant que B se replace et attend pour donner le coup d''envoi. Décisions et explications ?',
 'La célébration d''un but fait partie du football mais ne doit pas être excessive : l''arbitre active les joueurs de A pour qu''ils regagnent leur moitié de terrain. Il doit décompter le temps perdu uniquement à partir du moment où les joueurs de B sont en place, et ce jusqu''au coup d''envoi.',
 NULL, 2, 'CFA/DA Juillet 2025')
;
