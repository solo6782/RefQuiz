-- ============================================================
-- RefQuiz — Loi 3 — 5 questions inédites
-- Source : LGEF, Commission Régionale de l’Arbitrage
--          Questionnaire Loi 3, Préparation Probatoire n°2, saison 2026/2027
-- Ces 5 scénarios ne figurent pas dans le recueil CFA/DA Juillet 2025.
-- IDs laissés en auto (SERIAL) ; catégorie résolue par law_number.
-- Apostrophes typographiques (') : aucun échappement requis.
-- ============================================================

INSERT INTO public.rq_questions (category_id, type, question, expected_answer, explanation, difficulty, source)
VALUES

-- Q6 — remplaçant présent sur le terrain sans interférer, ballon en touche
((SELECT id FROM public.rq_categories WHERE law_number = 'Loi 3'), 'open',
 'À la 36ème minute, l’arbitre s’aperçoit qu’un remplaçant est présent sur le terrain sans interférer avec le jeu alors que le ballon sort en ligne de touche après avoir été touché par un joueur de l’équipe B. Décisions ?',
 '• Attendre le 1er arrêt de jeu.
• Avertissement au remplaçant pour avoir pénétré sur le terrain sans autorisation.
• L’arbitre doit lui faire quitter le terrain.
• Rentrée de touche pour l’équipe A.
• Si, par inadvertance, l’arbitre a arrêté le jeu avant que le ballon ne sorte, celui-ci sera repris par une balle à terre sous réserve de la procédure de la Loi 8.',
 NULL, 3, 'LGEF – Préparation Probatoire n°2 (2026/2027)'),

-- Q7 — remplaçant s’échauffe, crie « laisse », un pied sur la ligne de but
((SELECT id FROM public.rq_categories WHERE law_number = 'Loi 3'), 'open',
 'À la 68ème minute, un remplaçant s’échauffe derrière le but de son gardien de but. Il crie « laisse » à un adversaire tout en ayant un pied sur la ligne de but. L’attaquant se trouvait près du piquet de coin. Décisions ?',
 'Dans tous les cas :
• Arrêt du jeu.
• Avertissement au remplaçant pour avoir pénétré sur le terrain sans autorisation.
• L’arbitre doit lui faire quitter le terrain.
a) Si l’interférence a lieu dans sa surface de réparation :
• Penalty pour l’équipe adverse.
b) Si l’interférence a lieu hors de sa surface de réparation :
• Coup franc direct pour l’équipe adverse, à l’endroit de l’interférence, sous réserve de la procédure de la Loi 13.',
 NULL, 3, 'LGEF – Préparation Probatoire n°2 (2026/2027)'),

-- Q8 — n°13 remplace n°6, but marqué botté par le n°6, équipe A à 12
((SELECT id FROM public.rq_categories WHERE law_number = 'Loi 3'), 'open',
 'À la 55ème minute, le n°13 de l’équipe A remplace le n°6. À la 61ème minute, un but est marqué ; l’arbitre s’aperçoit que c’est le n°6 qui a botté le ballon en dehors de la surface de réparation. L’équipe A joue à 12. Décisions ?',
 'Dans tous les cas :
• Avertissement au n°6A pour avoir pénétré sur le terrain sans autorisation.
• L’arbitre doit lui faire quitter le terrain.
a) But en faveur de l’équipe régulière :
• But accordé.
• Coup d’envoi.
b) But en faveur de l’équipe irrégulière :
• But refusé.
• Coup franc direct pour l’équipe régulière, à l’endroit de l’interférence, sous réserve de la procédure de la Loi 13.',
 NULL, 3, 'LGEF – Préparation Probatoire n°2 (2026/2027)'),

-- Q9 — soigneur lance une bouteille et fait trébucher un adversaire
((SELECT id FROM public.rq_categories WHERE law_number = 'Loi 3'), 'open',
 'À la 88ème minute, l’équipe A mène 2 à 1 contre l’équipe B. Le n°8 de l’équipe B part en contre-attaque après un dégagement du gardien. Le soigneur de l’équipe A, qui faisait le tour du terrain pour revenir dans sa zone technique, lance une bouteille sur le terrain et fait trébucher ce joueur. Décisions ?',
 '• Arrêt du jeu.
• Exclusion du soigneur de l’équipe A pour avoir interféré avec un adversaire.
• Rapport.
a) Si l’interférence a lieu dans sa surface de réparation :
• Penalty pour l’équipe B.
b) Si l’interférence a lieu hors de sa surface de réparation :
• Coup franc direct pour l’équipe B, à l’endroit de l’interférence, sous réserve de la procédure de la Loi 13.',
 NULL, 3, 'LGEF – Préparation Probatoire n°2 (2026/2027)'),

-- Q10 — soigneur coupe sur le terrain, coup de poing du n°5B
((SELECT id FROM public.rq_categories WHERE law_number = 'Loi 3'), 'open',
 'À la 88ème minute, suite à des soins sur un joueur sur le terrain, le soigneur de l’équipe A coupe sur le terrain pour revenir dans sa zone technique alors que le jeu se situe dans l’autre surface de réparation. Le n°5 de l’équipe B, mécontent de perdre, lui donne un coup de poing. Décisions ?',
 'Dans tous les cas :
• Arrêt du jeu, sous réserve de l’avantage.
• Exclusion du n°5B pour acte de brutalité.
• Exclusion du soigneur pour avoir interféré avec un adversaire.
• Rapports.
a) Si la victime se trouve dans la surface de réparation de l’équipe A :
• Penalty pour l’équipe B.
b) Si la victime se trouve hors de la surface de réparation de l’équipe A :
• Coup franc direct pour l’équipe B, à l’endroit de la faute, sous réserve de la procédure de la Loi 13.',
 NULL, 3, 'LGEF – Préparation Probatoire n°2 (2026/2027)');
