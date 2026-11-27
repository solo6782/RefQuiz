-- ============================================================
-- RefQuiz — Loi 5 — mise à jour CFA/DA Juillet 2026 (IFAB 2026/27)
-- 1 UPDATE, 1 INSERT, 1 désactivation.
-- Les autres questions de la Loi 5 sont identiques à l’édition 2025 : aucun changement.
-- ============================================================

BEGIN;

-- id 131 ← L5/§2/Q2 — le joueur fautif doit rester 1 minute hors du terrain
UPDATE public.rq_questions SET
  question = 'Lors d’un duel entre un gardien et un attaquant, l’arbitre siffle une faute contre l’attaquant. Les deux joueurs nécessitent des soins. Décisions et explications ?',
  expected_answer = '• Le gardien de but pourra être soigné sur le terrain.
• L’attaquant doit obligatoirement sortir du terrain, y compris lorsque les soins qui lui sont prodigués peuvent être terminés avant ou en même temps que le gardien de but et doit rester 1mn à l’extérieur du terrain.
• Coup franc direct pour l’équipe du gardien de but à l’endroit de la faute, sous réserve de la procédure de la Loi 13.
Explications :
La faute sanctionnée (avec avertissement ou sans avertissement) entraîne une obligation de sortie pour soins, contrairement à une simple collision.
Cette mesure vise à renforcer le respect des règles et à éviter tout avantage indu pour le joueur fautif.',
  source = 'CFA/DA Juillet 2026'
WHERE id = 131;

-- NOUVELLE ← L5/§2/Q11 — décompte de la minute hors du terrain
INSERT INTO public.rq_questions (category_id, type, question, expected_answer, explanation, difficulty, source)
VALUES ((SELECT id FROM public.rq_categories WHERE law_number = 'Loi 5'), 'open',
 'À partir de quel moment l’arbitre décompte la minute pendant laquelle le joueur blessé doit rester hors du terrain ?',
 'La minute débute à partir du moment où le jeu reprend avec l’autorisation de l’arbitre.',
 NULL, 1, 'CFA/DA Juillet 2026');

-- id 142 — question retirée de l’édition 2026 (§3/Q4 « Réservée »)
UPDATE public.rq_questions SET is_active = FALSE WHERE id = 142;

COMMIT;
