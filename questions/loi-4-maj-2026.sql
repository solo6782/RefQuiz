-- ============================================================
-- RefQuiz — Loi 4 — mise à jour CFA/DA Juillet 2026 (IFAB 2026/27)
-- 1 UPDATE.
-- Les autres questions de la Loi 4 sont identiques à l’édition 2025 : aucun changement.
-- ============================================================

BEGIN;

-- id 75 ← L4/§1/Q5 — bijoux sans danger désormais autorisés s’ils sont couverts
UPDATE public.rq_questions SET
  question = 'Quelle attitude adopter en ce qui concerne le port des bijoux ?',
  expected_answer = 'Les bijoux sans danger sont autorisés, à condition d’être couverts de manière sûre (ex : boucle d’oreille recouverte d’un sparadrap).
Les objets dangereux restent strictement interdits et doivent être retirés. Recouvrir un objet dangereux de ruban adhésif ne le rend pas autorisé).',
  source = 'CFA/DA Juillet 2026'
WHERE id = 75;

COMMIT;
