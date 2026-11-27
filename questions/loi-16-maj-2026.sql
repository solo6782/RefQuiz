-- ============================================================
-- RefQuiz — Loi 16 — mise à jour CFA/DA Juillet 2026 (IFAB 2026/27)
-- 1 UPDATE.
-- Les autres questions de la Loi 16 sont identiques à l’édition 2025 : aucun changement.
-- ============================================================

BEGIN;

-- id 335 ← L16/§2/Q5 — nouveau cas : l’équipe B récupère le ballon et marque → but accordé
UPDATE public.rq_questions SET
  question = 'Coup de pied de but pour l’équipe A. Le gardien de but lève le ballon vers un partenaire situé sur le terrain qui le lui renvoie de la tête. Décisions ?',
  expected_answer = 'Le gardien récupère le ballon :
• Arrêt du jeu.
• Avertissement au gardien de but pour comportement antisportif.
• Coup franc indirect pour l’équipe B à l’endroit où le gardien a initié la stratégie, sous réserve de la procédure de la Loi 13.
Un joueur de l’équipe B récupère le ballon et marque le but :
• But accordé.
• Coup d’envoi.',
  source = 'CFA/DA Juillet 2026'
WHERE id = 335;

COMMIT;
