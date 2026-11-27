-- ============================================================
-- RefQuiz — Loi 14 — mise à jour CFA/DA Juillet 2026 (IFAB 2026/27)
-- 2 UPDATE, 1 INSERT.
-- Les autres questions de la Loi 14 sont identiques à l’édition 2025 : aucun changement.
-- ============================================================

BEGIN;

-- id 295 — nouveau cas b) (double touche accidentelle + faute du gardien)
UPDATE public.rq_questions SET
  question = 'À la 30ème minute de match, lors de l’exécution d’un penalty, quelles décisions devra prendre l’arbitre si :
a) Le tireur use d’une feinte illégale entre le signal de l’arbitre et le botté ?
b) Le tireur touche accidentellement deux fois le ballon et le gardien de but se rend coupable d’une infraction ?
c) Le tireur et le gardien de but se rendent coupables en même temps d’une infraction ?',
  expected_answer = 'a)
• Dans tous les cas : arrêt du jeu ou but refusé. Avertissement au tireur pour comportement antisportif. Coup franc indirect pour l’équipe défendante sur le point de penalty.
b)
• Dans tous les cas : arrêt du jeu ou but refusé. Penalty à retirer.
c)
• Dans tous les cas : arrêt du jeu ou but refusé. Avertissement au tireur pour comportement antisportif dans le cas de la feinte illégale. Coup franc indirect pour l’équipe défendante sur le point de penalty.',
  source = 'CFA/DA Juillet 2026'
WHERE id = 295;

-- id 309 ← L14/§7/Q1 — distinction but marqué / non marqué (avantage)
UPDATE public.rq_questions SET
  question = 'Lors d’un penalty, sans qu’aucune faute à la procédure d’exécution soit commise, le tireur botte le ballon qui parcourt 10 mètres en avant. À ce moment-là :
a) Un attaquant frappe un défenseur.
b) Un défenseur frappe un attaquant.',
  expected_answer = 'Dans les deux cas, exclusion du joueur fautif pour acte de brutalité. Rapport.
a) Quel que soit le résultat du tir : coup franc direct pour l’équipe défendante à l’endroit de la faute.
b) Si le but est marqué : but accordé, coup d’envoi
c) Si le but n’est pas marqué : arrêt du jeu, coup franc direct pour l’équipe attaquante à l’endroit de la faute ou penalty si l’attaquant était entré dans la surface de réparation au moment de la faute.',
  source = 'CFA/DA Juillet 2026'
WHERE id = 309;

-- NOUVELLE ← L14/§8/Q4 — botteur au sol qui retouche le ballon
INSERT INTO public.rq_questions (category_id, type, question, expected_answer, explanation, difficulty, source)
VALUES ((SELECT id FROM public.rq_categories WHERE law_number = 'Loi 14'), 'open',
 'Lors de l’exécution régulière d’un penalty, le ballon repoussé par la barre transversale revient en jeu vers le tireur n°9A. Il touche le ballon qui revient vers le joueur n°8A et le but est marqué. Décisions et explications ?',
 'Le botteur a glissé après avoir tiré et se retrouve au sol :
• Le deuxième contact avec le ballon n’est pas délibéré :
   o But accordé.
   o Coup d’envoi.
• Le botteur transmet délibérément le ballon au n°8A :
   o But refusé.
   o Coup franc indirect pour l’équipe B à l’endroit où a retouché le ballon, sous réserve de la procédure de Loi 13.',
 NULL, 3, 'CFA/DA Juillet 2026');

COMMIT;
