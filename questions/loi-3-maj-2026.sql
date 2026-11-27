-- ============================================================
-- RefQuiz — Loi 3 — mise à jour CFA/DA Juillet 2026 (IFAB 2026/27)
-- 10 UPDATE, 1 INSERT.
-- Les autres questions de la Loi 3 sont identiques à l’édition 2025 : aucun changement.
-- ============================================================

BEGIN;

-- id 25 ← L3/§4/Q1 — personne supplémentaire sans interférence : plus d’avertissement ni de mise en garde
UPDATE public.rq_questions SET
  question = 'Quelles décisions doit prendre l’arbitre lorsqu’une personne supplémentaire est présente sur le terrain sans interférer avec le jeu ?',
  expected_answer = '• Attendre le 1er arrêt de jeu.
• L’arbitre doit lui faire quitter le terrain.
• Reprise consécutive à l’arrêt.
• Si, par inadvertance, l’arbitre a arrêté le jeu, celui-ci sera repris par une balle à terre sous réserve de la procédure de la Loi 8.',
  source = 'CFA/DA Juillet 2026'
WHERE id = 25;

-- id 27 ← L3/§4/Q3 — sans interférence + but : plus d’avertissement ni de mise en garde
UPDATE public.rq_questions SET
  question = 'Quelles décisions doit prendre l’arbitre quand une personne supplémentaire est présente sur le terrain sans interférer avec le jeu et qu’un but est marqué ?',
  expected_answer = '• But accordé.
• L’arbitre doit lui faire quitter le terrain.
• Coup d’envoi.',
  source = 'CFA/DA Juillet 2026'
WHERE id = 27;

-- id 35 ← L3/§4/Q11 — avertissement du joueur supplémentaire seulement s’il a interféré
UPDATE public.rq_questions SET
  question = 'L’équipe A marque un but directement dans le but adverse sur une rentrée de touche. C’est à cet instant que l’arbitre constate que l’équipe B joue à 12. Décisions ?',
  expected_answer = '• But refusé.
• L’arbitre doit lui faire quitter le terrain.
• Le joueur supplémentaire n’a pas interféré dans le jeu : coup de pied de but pour l’équipe B.
• Le joueur a interféré dans le jeu : avertissement au joueur supplémentaire pour avoir pénétré sur le terrain sans autorisation.
• Coup franc direct pour l’équipe A à l’endroit où se trouvait la personne supplémentaire ou penalty.
• Rapport dans le cas d’un joueur sous fausse identité (avertissement au capitaine) ou d’un joueur exclu de l’équipe B.',
  source = 'CFA/DA Juillet 2026'
WHERE id = 35;

-- id 39 ← L3/§4/Q15 — avertissement seulement en cas d’interférence
UPDATE public.rq_questions SET
  question = 'Avant une remise en jeu (coup de pied de but, corner, rentrée de touche) l’arbitre s’aperçoit qu’un joueur supplémentaire est présent sur le terrain. Décisions ?',
  expected_answer = '• L’arbitre doit retarder la reprise du jeu.
• L’arbitre doit lui faire quitter le terrain.
• Reprise consécutive à l’arrêt.
Si le joueur supplémentaire a interféré avant la sortie du ballon :
• Avertissement au joueur, remplaçant, remplacé pour avoir pénétré sur le terrain sans autorisation.
• Rapport s’il s’agit d’un joueur sous fausse identité (avertissement au capitaine) ou d’un joueur exclu de l’équipe en infraction.
• Coup franc direct pour l’équipe adverse à l’endroit de l’interférence, sous réserve de la procédure de la Loi 13, ou penalty.',
  source = 'CFA/DA Juillet 2026'
WHERE id = 39;

-- id 40 ← L3/§4/Q16 — énoncé simplifié ; avertissement seulement en cas d’interférence
UPDATE public.rq_questions SET
  question = 'Une équipe joue à 12 depuis plusieurs minutes. Un joueur, de l’équipe attaquante B, commet une faute sur un joueur de l’équipe A. Un coup franc est accordé pour l’équipe A dans sa surface de réparation. Le ballon est joué et l’arbitre s’aperçoit qu’une équipe joue avec un joueur supplémentaire. Il interrompt immédiatement le jeu.
Décisions et explications :
a) Le joueur supplémentaire appartient à l’équipe défendante A ?
b) Le joueur supplémentaire appartient à l’équipe attaquante B ?',
  expected_answer = '• Le ballon est en jeu dès qu’il a été botté et a clairement bougé.
• L’arbitre doit lui faire quitter le terrain.
Le joueur supplémentaire n’a pas interféré avec le jeu : l’arbitre ne doit pas arrêter le jeu et attendre 1er arrêt de jeu naturel. Balle à terre donnée au gardien de but.
Le joueur supplémentaire a interféré avec le jeu :
• Avertissement au joueur, remplaçant, remplacé pour avoir pénétré sur le terrain sans autorisation.
• Rapport s’il s’agit d’un joueur sous fausse identité (avertissement au capitaine) ou d’un joueur exclu de l’équipe en infraction.
   o Joueur de l’équipe A : coup franc direct pour l’équipe attaquante B à l’endroit de l’interférence ou penalty si celle-ci a lieu dans la surface de réparation de l’équipe A.
   o Joueur de l’équipe B : coup franc direct pour l’équipe défendante A à l’endroit de l’interférence.',
  source = 'CFA/DA Juillet 2026'
WHERE id = 40;

-- id 52 ← L3/§7/Q1 — retardataire : plus d’avertissement ni de CFI
UPDATE public.rq_questions SET
  question = 'Ballon en jeu, un retardataire pénètre sur le terrain sans autorisation pour compléter son équipe. L’arbitre s’en aperçoit immédiatement et siffle avant qu’il n’interfère dans le jeu. Décisions et explications ?',
  expected_answer = '• L’arbitre ne doit pas arrêter le jeu. Il ne doit le faire qu’au moment où ce joueur interfère avec le jeu.
• L’arbitre vérifie l’identité de ce joueur.
Cette personne est considérée comme "joueur" si elle a été identifiée. Elle sera inscrite sur la feuille de match informatisée à la mi-temps ou à la fin de la rencontre.
Si cette personne n’est pas identifiée :
• L’arbitre lui fait quitter le terrain.
• Balle à terre, sous réserve de la procédure de la Loi 8.
• Rapport.',
  source = 'CFA/DA Juillet 2026'
WHERE id = 52;

-- id 55 ← L3/§7/Q4 — plus de second avertissement ni d’exclusion
UPDATE public.rq_questions SET
  question = 'Dans le cas où un joueur entre sur le terrain pour détourner le ballon des mains dans ses propres buts, comment faut-il agir quand il s’agit :
1. D’un joueur momentanément hors du terrain pour se faire soigner.
2. D’un joueur refoulé pour remettre son équipement en conformité.',
  expected_answer = 'Dans les deux cas :
• But accordé.
• Avertissement pour être entré sans autorisation.
• Coup d’envoi.
• Rapport.',
  source = 'CFA/DA Juillet 2026'
WHERE id = 55;

-- id 66 ← L3/§8/Q4 — bloc « Dans les deux cas » retiré (traité dans la nouvelle question L3/§8/Q5)
UPDATE public.rq_questions SET
  question = 'À la 43ème minute, l’équipe A demande un remplacement. Le joueur n°8A quitte le terrain. L’arbitre fait signe au remplaçant n°13A de rentrer. À cet instant, à la suite de propos déplacés du joueur n°3B, qui se situe sur le terrain à 50cm de la ligne de touche, le remplaçant n°13A, qui a les pieds à l’extérieur du terrain :
1. Donne un coup de poing au joueur n°3B.
2. Crache au visage du joueur n°3B.
Décisions et explications ?',
  expected_answer = '1. Le remplaçant n°13A a pénétré sur le terrain puisque son bras a franchi la ligne de touche. Le remplacement est donc effectif.
• L’équipe A jouera à 10.
2. Le remplaçant n’a pas pénétré sur le terrain, le remplacement n’est pas effectif. L’équipe A pourra faire entrer un autre remplaçant à la place du joueur n°8A si elle en dispose encore.
• L’équipe A jouera à 11.',
  source = 'CFA/DA Juillet 2026'
WHERE id = 66;

-- id 68 ← L3/§9/Q2 — équipe à 8 : minute de soins hors du terrain
UPDATE public.rq_questions SET
  question = 'Une équipe joue à 8, sans possibilité de remplacement. Un joueur de cette équipe est blessé et doit sortir pour se faire soigner. Combien de temps l’arbitre doit-il attendre avant de reprendre le jeu ?',
  expected_answer = 'Dans le cas présent le match peut continuer au moins une minute puis l’arbitre prendra en compte les circonstances de la blessure, la gravité de celle-ci, le score à ce moment du match et la durée restante de la rencontre pour l’arrêter définitivement.
Aucun match ne peut avoir lieu ou continuer si l’une ou l’autre équipe dispose de moins de 8 joueurs (FFF), sauf si un joueur doit rester en dehors du terrain pendant une minute en vertu du protocole relatif à l’évaluation des blessures et des soins.',
  source = 'CFA/DA Juillet 2026'
WHERE id = 68;

-- id 69 ← L3/§9/Q3 — équipe à 8 : match arrêté seulement si le joueur ne peut revenir après la minute
UPDATE public.rq_questions SET
  question = 'Une équipe joue à 8. Un de ses joueurs se blesse et sort du terrain pendant l’action de jeu alors qu’un de ses partenaires file au but. Le but est marqué. Décisions et explications ?',
  expected_answer = '• But accordé.
• Le match sera arrêté définitivement uniquement si le joueur ne peut pas revenir après la minute en vertu du protocole relatif à l’évaluation des blessures et des soins.
• Coup d’envoi.',
  source = 'CFA/DA Juillet 2026'
WHERE id = 69;

-- NOUVELLE ← L3/§8/Q5 — remplacement hors délai de 10 secondes
INSERT INTO public.rq_questions (category_id, type, question, expected_answer, explanation, difficulty, source)
VALUES ((SELECT id FROM public.rq_categories WHERE law_number = 'Loi 3'), 'open',
 'À la 43ème minute, l’équipe A demande un remplacement. Le joueur n°8A quitte le terrain en dépassant le délai de 10 secondes. L’arbitre retarde l’entrée du remplaçant n°13A. À cet instant, à la suite de propos déplacés du joueur n°3B, qui se situe sur le terrain à 50cm de la ligne de touche, le remplaçant n°13A, qui a les pieds à l’extérieur du terrain :
1. Donne un coup de poing au joueur n°3B.
2. Crache au visage du joueur n°3B.
Décisions et explications ?',
 'Dans les deux cas le remplacement ne peut être annulé et le remplacement ne peut être changé.
• Avertissement au joueur n°3B pour comportement antisportif.
• Exclusion du remplaçant n°13A pour acte de brutalité (ou crachat sur un adversaire).
• L’équipe A jouera avec un joueur de moins.
• Reprise consécutive à l’arrêt.
• Rapport.',
 NULL, 3, 'CFA/DA Juillet 2026');

COMMIT;
