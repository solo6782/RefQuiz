-- ============================================================
-- RefQuiz — Loi 7 — mise à jour CFA/DA Juillet 2026 (IFAB 2026/27)
-- 1 INSERT.
-- Les autres questions de la Loi 7 sont identiques à l’édition 2025 : aucun changement.
-- ============================================================

BEGIN;

-- NOUVELLE ← L7/§1/Q4 — pauses de récupération / de rafraîchissement et temps additionnel
INSERT INTO public.rq_questions (category_id, type, question, expected_answer, explanation, difficulty, source)
VALUES ((SELECT id FROM public.rq_categories WHERE law_number = 'Loi 7'), 'open',
 'Une compétition a mis en place des pauses « de récupération » ou « de rafraîchissement » en cours de période. Ces arrêts doivent-ils être intégrés au décompte du temps additionnel, et quelle est leur durée maximale ?',
 'Ces arrêts font partie des causes explicitement listées de temps additionnel, dès lors qu’ils sont autorisés par le règlement de la compétition :
• « Pauses de récupération » (1 minute maximum).
• « Pauses de rafraîchissement » (90 secondes à 3 minutes).
Ce type de pause ne s’opère que lorsque des conditions climatiques le nécessitent. C’est l’arbitre qui fait appliquer ces protocoles selon les principes édictés par l’IFAB.
Elles ne se font pas à l’initiative des équipes, elles ne sont pas imposées ou demandées par celles-ci.',
 NULL, 2, 'CFA/DA Juillet 2026');

COMMIT;
