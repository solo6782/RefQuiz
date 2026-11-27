-- ============================================================
-- RefQuiz — Loi 10 — mise à jour CFA/DA Juillet 2026 (IFAB 2026/27)
-- 1 UPDATE.
-- Les autres questions de la Loi 10 sont identiques à l’édition 2025 : aucun changement.
-- ============================================================

BEGIN;

-- id 172 ← L10/TAB/§4/Q1 — « cinq premiers » devient « six premiers joueurs »
UPDATE public.rq_questions SET
  question = 'Épreuve des tirs au but. Le gardien de but de l’équipe A se blesse en plongeant à l’occasion du 6ème tir. Il est remplacé par un remplaçant inscrit. Le gardien remplaçant peut-il effectuer le 7ème tir au but de son équipe ?',
  expected_answer = 'Oui, sous réserve que le gardien titulaire n’ait pas déjà exécuté un tir parmi les six premiers joueurs de son équipe.',
  source = 'CFA/DA Juillet 2026'
WHERE id = 172;

COMMIT;
