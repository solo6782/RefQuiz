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
