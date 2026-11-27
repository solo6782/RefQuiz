-- ============================================================
-- RefQuiz — Loi 15 — mise à jour CFA/DA Juillet 2026 (IFAB 2026/27)
-- 4 UPDATE.
-- Les autres questions de la Loi 15 sont identiques à l’édition 2025 : aucun changement.
-- ============================================================

BEGIN;

-- id 318 ← L15/§2/Q1 — équipes précisées (A)
UPDATE public.rq_questions SET
  question = 'Lors d’une rentrée de touche exécutée par un joueur de l’équipe A, le ballon rebondit à l’extérieur du terrain avant d’y pénétrer. Décisions ?',
  expected_answer = '• Que la rentrée de touche soit régulière ou irrégulière : à refaire par l’équipe A au même endroit.',
  source = 'CFA/DA Juillet 2026'
WHERE id = 318;

-- id 324 ← L15/§2/Q7 — « sous réserve de l’avantage »
UPDATE public.rq_questions SET
  question = 'Une rentrée de touche est exécutée par un joueur de l’équipe A alors qu’un adversaire B n’est pas à distance.
Décisions ?',
  expected_answer = '• Le joueur B gêne abusivement l’exécutant (Loi 15 – IFAB) :
   o Rentrée de touche régulière : arrêt du jeu. Avertissement au joueur B pour comportement antisportif. Coup franc indirect pour l’équipe A à l’endroit du joueur B.
   o Rentrée de touche irrégulière : arrêt du jeu. Avertissement au joueur B pour comportement antisportif.
Rentrée de touche à refaire par l’équipe A.
• Le joueur B ne gêne pas abusivement l’exécutant :
   o Rentrée de touche régulière : laisser jouer.
   o Rentrée de touche irrégulière : arrêt du jeu, sous réserve de l’avantage. Touche à refaire par l’équipe B.',
  source = 'CFA/DA Juillet 2026'
WHERE id = 324;

-- id 325 ← L15/§2/Q8 — touche à refaire par l’équipe B, ou avantage si B récupère
UPDATE public.rq_questions SET
  question = 'Rentrée de touche pour l’équipe A. Le joueur n°10A chargé de remettre le ballon en jeu s’accroupit afin de donner le ballon dans les pieds de son coéquipier. Explications et décisions ?',
  expected_answer = 'Cette façon d’exécuter la rentrée de touche n’est pas permise par la Loi 15.
• Le ballon est récupéré par l’équipe A : rentrée de touche à refaire par l’équipe B au même endroit.
• Le ballon est récupéré par l’équipe B : sous réserve de l’avantage, laisser jouer.',
  source = 'CFA/DA Juillet 2026'
WHERE id = 325;

-- id 326 ← L15/§2/Q9 — joueur identifié (n°11A)
UPDATE public.rq_questions SET
  question = 'Le ballon sort en ligne de touche juste à côté du drapeau de coin. Le joueur n°11 de l’équipe A qui effectue la remise en jeu, dans la précipitation, lance le ballon de façon correcte dans le terrain mais le ballon pénètre sur le terrain par la ligne de but et non par la ligne de touche. Décisions ?',
  expected_answer = '• Rentrée de touche à refaire par l’équipe A.',
  source = 'CFA/DA Juillet 2026'
WHERE id = 326;

COMMIT;
