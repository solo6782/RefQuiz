-- ============================================================
-- RefQuiz — Loi 12 — mise à jour CFA/DA Juillet 2026 (IFAB 2026/27)
-- 5 UPDATE.
-- Les autres questions de la Loi 12 sont identiques à l’édition 2025 : aucun changement.
-- ============================================================

BEGIN;

-- id 210 ← L12/§2/Q2 — but accordé : plus d’avertissement au gardien
UPDATE public.rq_questions SET
  question = 'Dans sa surface de réparation, le gardien de but de l’équipe A détourne le ballon dans son but à l’aide du protège-tibia qu’il tient à la main. Décisions ?',
  expected_answer = '• But accordé.
• Coup d’envoi.',
  source = 'CFA/DA Juillet 2026'
WHERE id = 210;

-- id 229 ← L12/§5/Q2 — IFAB 2026/27 : avantage + but marqué → plus d’avertissement (question signalée depuis septembre)
UPDATE public.rq_questions SET
  question = 'Un attaquant est victime, à 30 m du but adverse, d’une faute d’un 1er défenseur, passible d’exclusion (hors faute grossière et acte de brutalité) car il l’empêche d’avoir une possibilité de marquer. Cependant, il en réchappe et l’arbitre laisse l’avantage.
Dans la surface de réparation, un 2ème défenseur commet sur lui une faute identique à celle du 1er défenseur donc passible d’exclusion. Quelles décisions devra prendre l’arbitre si :
a) L’attaquant réchappe à la 2ème faute et marque, l’arbitre ayant laissé l’avantage ?
b) L’attaquant perd le contrôle du ballon mais un de ses partenaires s’en empare et marque le but ?
c) L’attaquant perd le contrôle du ballon et la défense se dégage ?',
  expected_answer = 'Cas a) et b) :
• But accordé.
• Coup d’envoi.
Cas c) :
• Arrêt du jeu.
• Avertissement au 1er défenseur pour comportement antisportif.
• Avertissement au 2ème défenseur pour comportement antisportif ou exclusion pour avoir annihilé une occasion nette de but si :
   o La faute commise consiste à tenir, tirer ou pousser un adversaire ou
   o Le joueur fautif n’a pas essayé de jouer ou disputer le ballon ; ou n’était aucunement en mesure de le faire.
• Penalty.
• Rapport.',
  source = 'CFA/DA Juillet 2026'
WHERE id = 229;

-- id 234 ← L12/§5/Q7 — but accordé : plus d’avertissement aux défenseurs
UPDATE public.rq_questions SET
  question = 'Un défenseur repousse délibérément le ballon de la main alors que celui-ci allait pénétrer dans son but. Un attaquant reprend le ballon et tire au but. C’est alors qu’un autre défenseur le détourne également volontairement de la main sans l’empêcher de pénétrer dans le but. Décisions ?',
  expected_answer = '• But accordé.
• Coup d’envoi.',
  source = 'CFA/DA Juillet 2026'
WHERE id = 234;

-- id 236 ← L12/§6/Q1 — ajout : « pas une situation d’avantage donc l’avertissement est maintenu »
UPDATE public.rq_questions SET
  question = 'Sur une action de jeu, un joueur marque délibérément un but de la main contre son camp. Décisions et explications ?',
  expected_answer = '• But accordé.
• Le joueur recevra un avertissement pour comportement antisportif car il se comporte d’une manière irrespectueuse envers l’esprit du jeu. Cette situation n’est pas une situation d’avantage donc l’avertissement est maintenu.
• Coup d’envoi.',
  source = 'CFA/DA Juillet 2026'
WHERE id = 236;

-- id 246 ← L12/§7/Q10 — IFAB 2026/27 : avantage + but marqué → plus d’avertissement
UPDATE public.rq_questions SET
  question = 'Le joueur n°8 de l’équipe A exécute correctement une remise en jeu. Le ballon est en jeu lorsqu’un joueur de l’équipe B lance un objet sur le ballon et en dévie la trajectoire. Le joueur n°8A reprend le ballon et marque un but pour son équipe. Décisions et explications ?',
  expected_answer = '• Par application de l’avantage, le but est accordé.
• Le joueur n°8 de l’équipe A n’a donc pas joué deux fois consécutivement le ballon.
• Coup d’envoi.',
  source = 'CFA/DA Juillet 2026'
WHERE id = 246;

COMMIT;
