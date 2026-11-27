-- ============================================================
-- RefQuiz — Loi 17 — mise à jour CFA/DA Juillet 2026 (IFAB 2026/27)
-- 1 UPDATE.
-- Les autres questions de la Loi 17 sont identiques à l’édition 2025 : aucun changement.
-- ============================================================

BEGIN;

-- id 336 ← L17/§1/Q1 — reformulation mineure (« en bottant »)
UPDATE public.rq_questions SET
  question = 'Lors de l’exécution d’un corner, le tireur, en bottant le ballon du pied droit, casse le poteau de corner. Après avoir rebondit sur son pied gauche, le ballon reste sur le terrain. Décisions ?',
  expected_answer = '• Arrêt du jeu.
• Réparation ou remplacement du poteau de corner.
• Coup franc indirect pour l’équipe adverse à l’endroit où le botteur a touché deux fois consécutivement le ballon.',
  source = 'CFA/DA Juillet 2026'
WHERE id = 336;

COMMIT;
