-- RefQuiz — Mise à jour CFA/DA Juillet 2026 — toutes les lois en un seul passage
-- Concaténation des fichiers loi-N-maj-2026.sql (Lois 1, 2, 6, 8, 11 : aucun changement)
-- À exécuter UNE SEULE FOIS. Ne pas lancer en plus les fichiers par loi.

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

-- ============================================================
-- RefQuiz — Loi 7 — mise à jour CFA/DA Juillet 2026 (IFAB 2026/27)
-- 1 INSERT.
-- Les autres questions de la Loi 7 sont identiques à l’édition 2025 : aucun changement.
-- ============================================================

BEGIN;

-- NOUVELLE ← L7/§1/Q4 — pauses de récupération / de rafraîchissement et temps additionnel
INSERT INTO public.rq_questions (category_id, type, question, expected_answer, explanation, difficulty, source)
VALUES ((SELECT id FROM public.rq_categories WHERE law_number = 'Loi 7'), 'open',
 'Une compétition a mis en place des pauses « de récupération » ou « de rafraîchissement » en cours de période. Ces arrêts doivent-ils être intégrés au décompte du temps additionnel, et quelle est leur durée maximale ?',
 'Ces arrêts font partie des causes explicitement listées de temps additionnel, dès lors qu’ils sont autorisés par le règlement de la compétition :
• « Pauses de récupération » (1 minute maximum).
• « Pauses de rafraîchissement » (90 secondes à 3 minutes).
Ce type de pause ne s’opère que lorsque des conditions climatiques le nécessitent. C’est l’arbitre qui fait appliquer ces protocoles selon les principes édictés par l’IFAB.
Elles ne se font pas à l’initiative des équipes, elles ne sont pas imposées ou demandées par celles-ci.',
 NULL, 2, 'CFA/DA Juillet 2026');

COMMIT;

-- ============================================================
-- RefQuiz — Loi 9 — mise à jour CFA/DA Juillet 2026 (IFAB 2026/27)
-- 2 UPDATE.
-- Les autres questions de la Loi 9 sont identiques à l’édition 2025 : aucun changement.
-- ============================================================

BEGIN;

-- id 160 ← L9/§1/Q1 — balle à terre à l’endroit où le ballon a touché l’arbitre assistant
UPDATE public.rq_questions SET
  question = 'Lors d’une attaque de l’équipe B, le joueur n°8B veut donner le ballon à son partenaire n°7B. Le ballon heurte l’arbitre assistant. Décisions ?',
  expected_answer = 'Le contact avec l’arbitre assistant a eu lieu hors du terrain :
• Rentrée de touche pour l’équipe A.
Le contact avec l’arbitre assistant a eu lieu sur le terrain ou sur la ligne de touche :
• Le ballon sort du terrain :
   o Rentrée de touche pour l’équipe A.
• Le ballon reste sur le terrain et entraine une attaque prometteuse pour l’équipe B :
   o Arrêt du jeu.
   o Balle à terre donnée à un joueur de l’équipe B à l’endroit où le ballon a touché l’arbitre assistant.
• Le ballon reste sur le terrain et n’entraine pas une attaque prometteuse pour l’équipe B :
   o Laisser jouer.
• Le ballon reste sur le terrain et est récupéré par l’équipe A :
   o Arrêt du jeu.
   o Balle à terre donnée à un joueur de l’équipe A à l’endroit où le ballon a touché l’arbitre assistant.',
  source = 'CFA/DA Juillet 2026'
WHERE id = 160;

-- id 161 ← L9/§1/Q2 — balle à terre à l’endroit où le ballon a touché l’arbitre
UPDATE public.rq_questions SET
  question = 'Depuis sa surface de réparation, le gardien de but de l’équipe A relance le ballon à la main. Celui-ci vient toucher le dos de l’arbitre en dehors de cette surface de réparation avant de retomber dans les pieds d’un adversaire. Décisions et explications ?',
  expected_answer = '• Arrêt du jeu.
• La Loi 9 indique que le ballon se trouve hors du jeu lorsqu’il touche l’arbitre et qu’il est récupéré par l’équipe adverse. Le ballon est donc devenu hors du jeu au moment du contact avec l’arbitre.
• Balle à terre donnée à un joueur de l’équipe A à l’endroit où le ballon a touché l’arbitre.',
  source = 'CFA/DA Juillet 2026'
WHERE id = 161;

COMMIT;

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

-- ============================================================
-- RefQuiz — Loi 13 — mise à jour CFA/DA Juillet 2026 (IFAB 2026/27)
-- 8 UPDATE.
-- Les autres questions de la Loi 13 sont identiques à l’édition 2025 : aucun changement.
-- ============================================================

BEGIN;

-- id 274 ← L13/§1/Q3 — « sauf si l’équipe adverse récupère le ballon » : l’arbitre laisse jouer au lieu de faire recommencer
UPDATE public.rq_questions SET
  question = 'Alors que l’arbitre est en train de placer le mur, aux abords de la surface de réparation, le tireur du coup franc exécute la remise en jeu avant le signal de l’arbitre. Décisions ?',
  expected_answer = '• Arrêt du jeu.
• Quel que soit le résultat du tir, le coup franc est à recommencer, sauf si l’équipe adverse récupère le ballon, l’arbitre doit alors laisser le jeu se poursuivre.',
  source = 'CFA/DA Juillet 2026'
WHERE id = 274;

-- id 279 — joueurs identifiés (n°4A / n°11B) ; « sauf si l’équipe adverse récupère le ballon » : l’arbitre laisse jouer au lieu de faire recommencer
UPDATE public.rq_questions SET
  question = 'Lors d’un coup franc direct, l’arbitre a donné le signal mais avant le botté du ballon :
a) Un défenseur n°4 de l’équipe A s’approche à moins de 9,15m du ballon ou commet une faute sur un adversaire. Décisions ?
1) Si le but est marqué,
2) Si le ballon va en sortie de but,
3) Si le ballon est détourné en corner,
4) Si le ballon revient en jeu.
b) Un attaquant n°11 de l’équipe B gesticule devant un mur formé de moins de trois joueurs ou commet une faute sur un adversaire. Décisions ?
1) Si le but est marqué,
2) Si le ballon va en sortie de but,
3) Si le ballon est détourné en corner,
4) Si le ballon revient en jeu.',
  expected_answer = 'a)
• Dans le 1er cas : But accordé. Coup d’envoi.
• Dans les autres cas : Avertissement au joueur n°4A pour non-respect de la distance ou comportement antisportif. Coup franc à rejouer, sauf si l’équipe B récupère le ballon, l’arbitre doit alors laisser le jeu se poursuivre.
b)
• Avertissement au joueur n°11B pour comportement antisportif.
• Dans le 1er cas : But refusé. Coup franc à recommencer.
• Dans les autres cas : Coup franc indirect pour l’équipe A à l’endroit de la faute, sous réserve de la procédure de la Loi 13, sauf si l’équipe A récupère le ballon, l’arbitre doit alors laisser le jeu se poursuivre.',
  source = 'CFA/DA Juillet 2026'
WHERE id = 279;

-- id 280 ← L13/§3/Q2 — CFI « à l’endroit du deuxième contact »
UPDATE public.rq_questions SET
  question = 'Quels critères l’arbitre doit-il retenir, pour valider ou non l’exécution d’un coup franc, lorsque le joueur chargé de le botter déplace le ballon en maintenant son pied en contact avec celui-ci ?',
  expected_answer = 'Le ballon est en jeu dès qu’il a été botté et a clairement bougé. Les adversaires peuvent s’approcher aussitôt.
D’autre part, le contact avec le ballon ne doit cesser à aucun moment. Si le contact cesse et qu’ensuite le joueur remet le pied sur le ballon :
• L’arbitre devra considérer que le joueur joue deux fois consécutivement le ballon.
• Le botteur sera sanctionné d’un coup franc indirect à l’endroit du deuxième contact.
Par ailleurs, le mouvement du ballon ne doit être composé que d’une seule phase. Dans le cas où il est composé de plusieurs phases, comme par exemple :
• Ballon déplacé puis après un arrêt déplacé à nouveau,
• Ballon déplacé vers l’avant et sans arrêt ramené en arrière,
• Ballon déplacé avec un changement de direction,
   o L’arbitre considérera que le botteur joue deux fois consécutivement le ballon.
   o Le botteur sera sanctionné d’un coup franc indirect à l’endroit du deuxième contact.',
  source = 'CFA/DA Juillet 2026'
WHERE id = 280;

-- id 282 ← L13/§3/Q4 — réponse réécrite ; « sauf si l’équipe adverse récupère le ballon » : l’arbitre laisse jouer au lieu de faire recommencer
UPDATE public.rq_questions SET
  question = 'Coup franc direct. Une équipe attaquante met au point une tactique : un premier joueur passe au-dessus du ballon ce qui provoque l’avancée du mur. Un partenaire le suit et botte le ballon. Décisions et explications ?',
  expected_answer = '• L’IFAB précise : "Faire semblant de tirer un coup franc pour tromper l’adversaire est permis, cela fait partie du jeu".
• Si le but est marqué : but accordé. Coup d’envoi.
• Si le but n’est pas marqué : avertissement au défenseur pour non-respect de la distance réglementaire, coup franc à recommencer, sauf si l’équipe attaquante récupère le ballon, l’arbitre doit alors laisser le jeu se poursuivre.',
  source = 'CFA/DA Juillet 2026'
WHERE id = 282;

-- id 283 ← L13/§3/Q5 — réponse réécrite ; « sauf si l’équipe adverse récupère le ballon » : l’arbitre laisse jouer au lieu de faire recommencer
UPDATE public.rq_questions SET
  question = 'Coup franc aux abords de la surface de réparation au profit de l’équipe attaquante avec formation d’un mur. En application des Lois du Jeu et selon la procédure managériale, l’arbitre demande au botteur d’attendre son coup de sifflet. Malgré tout, avant le signal, le botteur exécute le coup franc. Décisions ?',
  expected_answer = '• Avertissement au tireur pour comportement antisportif, coup franc à recommencer, sauf si l’équipe défendante récupère le ballon, l’arbitre doit alors laisser le jeu se poursuivre.',
  source = 'CFA/DA Juillet 2026'
WHERE id = 283;

-- id 284 ← L13/§3/Q6 — « dans tous les cas » ; « sauf si l’équipe adverse récupère le ballon » : l’arbitre laisse jouer au lieu de faire recommencer
UPDATE public.rq_questions SET
  question = 'Un coup franc est accordé à l’équipe A dans sa surface de réparation. Le gardien de but lève le ballon vers un partenaire situé sur le terrain qui le lui renvoie de la tête. Décisions et explications ?',
  expected_answer = '• Arrêt du jeu.
• Dans tous les cas, avertissement au gardien de but pour comportement antisportif.
• Que le gardien rejoue le ballon des mains ou non, coup franc indirect pour l’équipe B à l’endroit où le gardien a initié la stratégie, sous réserve de la procédure de la Loi 13, sauf si l’équipe adverse récupère le ballon, l’arbitre doit alors laisser le jeu se poursuivre.',
  source = 'CFA/DA Juillet 2026'
WHERE id = 284;

-- id 285 ← L13/§4/Q1 — énoncé modifié ; balle à terre à l’endroit du contact avec l’arbitre
UPDATE public.rq_questions SET
  question = 'Un coup franc indirect est tiré par un défenseur n°5B depuis sa surface de réparation vers un partenaire qui allait récupérer le ballon. Ce dernier est renvoyé involontairement par l’arbitre vers le but. Le N°5B, pour empêcher le ballon de pénétrer dans son but, le touche de la main. Le ballon entre dans le but. Décisions ?',
  expected_answer = 'Dans tous les cas :
• But refusé.
• Si l’arbitre était dans la surface de réparation : balle à terre donnée au gardien de but.
• Si l’arbitre était hors de la surface de réparation : balle à terre donnée à l’équipe B à l’endroit du contact avec l’arbitre.',
  source = 'CFA/DA Juillet 2026'
WHERE id = 285;

-- id 288 ← L13/§4/Q4 — « sauf si l’équipe adverse récupère le ballon » : l’arbitre laisse jouer au lieu de faire recommencer
UPDATE public.rq_questions SET
  question = 'L’arbitre siffle un coup franc pour l’équipe A à 20 mètres des buts de l’équipe B. L’équipe B forme un mur de cinq joueurs. L’arbitre met à distance réglementaire les attaquants de l’équipe A. Au moment où un attaquant A botte le coup franc, un partenaire s’approche à moins d’un mètre du mur. Décisions ?',
  expected_answer = '• Arrêt du jeu.
• Coup franc indirect pour l’équipe B à l’endroit de l’infraction, sauf si cette équipe récupère le ballon, l’arbitre doit alors laisser le jeu se poursuivre.',
  source = 'CFA/DA Juillet 2026'
WHERE id = 288;

COMMIT;

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

