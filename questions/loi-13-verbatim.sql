-- RefQuiz : ré-import verbatim Loi 13 depuis CFA/DA Juillet 2025
-- Source : cfa-da-qr-loi-13-juillet-2025.pdf
-- 17 questions (IDs 272-288)

BEGIN;

UPDATE public.rq_questions SET
  question = 'Comment l’arbitre doit-il agir en ce qui concerne le signal d’exécution d’un coup franc ?',
  expected_answer = 'Les directives pratiques pour les arbitres, paragraphe "utilisation du sifflet", disent :
• Il n’est pas nécessaire de siffler la reprise du jeu pour la plupart des coups francs.
• Par contre, le coup de sifflet est nécessaire pour signifier la reprise du jeu :
   o Lors d’un coup franc avec placement d’un mur à distance réglementaire.
   o Après interruption du jeu pour sanctionner disciplinairement un joueur.'
WHERE id = 272;

UPDATE public.rq_questions SET
  question = 'Un joueur veut jouer rapidement un coup franc à 30m du but. Un adversaire, qui n’est pas à distance réglementaire :
a) Intercepte le ballon.
b) Empêche délibérément l’exécution du coup franc.',
  expected_answer = 'a) L’arbitre doit laisser le jeu se poursuivre.
b) L’arbitre ne doit pas permettre l’exécution du coup franc. Il avertira le fautif pour avoir retardé la reprise du jeu.'
WHERE id = 273;

UPDATE public.rq_questions SET
  question = 'Alors que l’arbitre est en train de placer le mur, aux abords de la surface de réparation, le tireur du coup franc exécute la remise en jeu avant le signal de l’arbitre. Décisions ?',
  expected_answer = '• Arrêt du jeu.
• Quel que soit le résultat du tir, le coup franc est à recommencer.'
WHERE id = 274;

UPDATE public.rq_questions SET
  question = 'Alors que l’arbitre est en train de placer le mur, le tireur du coup franc botte le ballon avant le signal. Quelle doit être la décision de l’arbitre si le ballon se dégonfle après avoir été mis en jeu ?',
  expected_answer = '• Arrêt du jeu.
• Changement de ballon.
• Coup franc à recommencer.'
WHERE id = 275;

UPDATE public.rq_questions SET
  question = 'Un but a été marqué directement sur un coup franc indirect accordé à l’équipe attaquante dans la surface de réparation adverse, alors que l’arbitre n’a pas levé le bras avant son exécution. Décisions et explications ?',
  expected_answer = '• But refusé.
• Les Lois du Jeu sont formelles, l’arbitre a l’obligation de lever le bras lors des coups francs indirects, y compris lors de l’exécution dans la surface de réparation pour l’équipe attaquante.
• Coup franc indirect à refaire.'
WHERE id = 276;

UPDATE public.rq_questions SET
  question = 'Lors de l’exécution d’un coup franc indirect, l’arbitre oublie de lever le bras. Pendant la trajectoire du ballon, un défenseur, dans sa surface de réparation, frappe un attaquant également situé dans la surface de réparation. Le but est marqué directement. Décisions et explications ?
1. Faut-il refuser le but et accorder un penalty ?
2. Faut-il refuser le but et refaire tirer le coup franc indirect ?',
  expected_answer = '• Dans les deux cas : but refusé.
• Exclusion du défenseur pour acte de brutalité.
• Le but ne peut pas être accordé parce qu’il s’agissait d’un coup franc indirect. La faute commise durant la trajectoire du ballon doit être sanctionnée parce que le ballon était en jeu.
• Penalty pour l’équipe attaquante.'
WHERE id = 277;

UPDATE public.rq_questions SET
  question = 'L’arbitre siffle un attaquant de l’équipe A en position de hors-jeu dans le camp de l’équipe B, très loin du but de l’équipe A. Comment l’arbitre devra t’il exécuter la signalisation ?',
  expected_answer = '• L’arbitre signale un coup franc indirect en levant le bras à la verticale. Il baisse son bras immédiatement une fois le ballon remis en jeu. En effet, lorsqu’il y a une très faible probabilité qu’un but puisse être marqué directement, l’arbitre n’a pas besoin d’attendre que le ballon soit joué par un autre joueur ou sorte du terrain pour baisser son bras.'
WHERE id = 278;

UPDATE public.rq_questions SET
  question = 'Lors d’un coup franc direct, l’arbitre a donné le signal mais avant le botté du ballon :
a) Un défenseur s’approche à moins de 9,15m du ballon ou commet une faute sur un adversaire. Décisions ?
1) Si le but est marqué,
2) Si le ballon va en sortie de but,
3) Si le ballon est détourné en corner,
4) Si le ballon revient en jeu.
b) Un attaquant gesticule devant un mur formé de moins de trois joueurs ou commet une faute sur un adversaire. Décisions ?',
  expected_answer = 'a)
• Dans le 1er cas : But accordé. Coup d’envoi.
• Dans les autres cas : Avertissement au fautif pour non-respect de la distance ou comportement antisportif. Coup franc à rejouer.
b)
• Avertissement au fautif pour comportement antisportif.
• Dans le 1er cas : But refusé. Coup franc à recommencer.
• Dans les autres cas : Coup franc indirect pour l’équipe adverse à l’endroit de la faute, sous réserve de la procédure de la Loi 13.'
WHERE id = 279;

UPDATE public.rq_questions SET
  question = 'Quels critères l’arbitre doit-il retenir, pour valider ou non l’exécution d’un coup franc, lorsque le joueur chargé de le botter déplace le ballon en maintenant son pied en contact avec celui-ci ?',
  expected_answer = 'Le ballon est en jeu dès qu’il a été botté et a clairement bougé. Les adversaires peuvent s’approcher aussitôt.
D’autre part, le contact avec le ballon ne doit cesser à aucun moment. Si le contact cesse et qu’ensuite le joueur remet le pied sur le ballon :
• L’arbitre devra considérer que le joueur joue deux fois consécutivement le ballon.
• Le botteur sera sanctionné d’un coup franc indirect.
Par ailleurs, le mouvement du ballon ne doit être composé que d’une seule phase. Dans le cas où il est composé de plusieurs phases, comme par exemple :
• Ballon déplacé puis après un arrêt déplacé à nouveau,
• Ballon déplacé vers l’avant et sans arrêt ramené en arrière,
• Ballon déplacé avec un changement de direction,
   o L’arbitre considérera que le botteur joue deux fois consécutivement le ballon.
   o Le botteur sera sanctionné d’un coup franc indirect.'
WHERE id = 280;

UPDATE public.rq_questions SET
  question = 'Comment définit-on un coup franc joué rapidement ? Si l’arbitre commence à placer le mur et que le botteur "joue rapidement", le coup franc est-il toujours défini comme "joué rapidement" ?',
  expected_answer = 'Un coup franc est joué rapidement quand, aussitôt après l’arrêt du jeu par l’arbitre, et dans la continuité de l’action, un joueur de l’équipe bénéficiaire de la remise en jeu botte le ballon (arrêté à l’endroit de la faute ou à l’endroit précisé par la Loi). Le signal de reprise du jeu est considéré comme tacite même s’il n’est pas visible.
Par contre dès qu’un joueur de l’équipe bénéficiaire demande le respect de la distance réglementaire, le coup franc ne peut plus entrer dans la catégorie des coups francs joués rapidement. L’IFAB précise que le coup de sifflet est nécessaire pour signifier la reprise du jeu lors de l’exécution d’un coup franc avec mur placé à distance réglementaire.'
WHERE id = 281;

UPDATE public.rq_questions SET
  question = 'Coup franc direct. Une équipe attaquante met au point une tactique : un premier joueur passe au-dessus du ballon ce qui provoque l’avancée du mur. Un partenaire le suit et botte le ballon. Décisions et explications ?',
  expected_answer = '• L’IFAB précise : "Faire semblant de tirer un coup franc pour tromper l’adversaire est permis, cela fait partie du jeu".
• Si un adversaire ne se trouve pas à distance réglementaire lors de l’exécution du coup franc, celui-ci devra être retiré sauf si l’avantage peut être appliqué. Le fautif est alors averti pour non-respect de la distance sur coup franc.
• Si le but est marqué : but accordé. Coup d’envoi.
• Si le but n’est pas marqué : coup franc à recommencer.'
WHERE id = 282;

UPDATE public.rq_questions SET
  question = 'Coup franc aux abords de la surface de réparation au profit de l’équipe attaquante avec formation d’un mur. En application des Lois du Jeu et selon la procédure managériale, l’arbitre demande au botteur d’attendre son coup de sifflet. Malgré tout, avant le signal, le botteur exécute le coup franc. Décisions et explications ?',
  expected_answer = '• L’IFAB précise : "Si l’arbitre souhaite que les joueurs attendent le coup de sifflet pour reprendre le jeu (par exemple, pour s’assurer que les défenseurs se trouvent à 9,15m du lieu d’exécution du coup franc), il doit clairement indiquer aux joueurs l’équipe en attaque qu’ils doivent attendre le coup de sifflet".
• Ici, le botteur ne respecte pas la demande de l’arbitre.
• Par conséquent, il se rend coupable d’un comportement antisportif sanctionnable d’un avertissement.
• Coup franc à recommencer dans tous les cas.'
WHERE id = 283;

UPDATE public.rq_questions SET
  question = 'Un coup franc est accordé à l’équipe A dans sa surface de réparation. Le gardien de but lève le ballon vers un partenaire situé sur le terrain (dans ou hors de la surface de réparation) qui le lui renvoie de la tête. Précisions ? Décisions ?',
  expected_answer = '• Arrêt du jeu.
• Avertissement au gardien de but pour comportement antisportif.
• Que le gardien rejoue le ballon des mains ou non, coup franc indirect pour l’équipe B à l’endroit où le gardien a initié la stratégie, sous réserve de la procédure de la Loi 13.'
WHERE id = 284;

UPDATE public.rq_questions SET
  question = 'Un coup franc indirect est tiré par un défenseur n°5B depuis sa surface de réparation. Le ballon est renvoyé involontairement par l’arbitre vers le but. Ce même défenseur, pour l’empêcher de pénétrer dans son but, touche le ballon de la main mais n’y parvient pas. Décisions ?',
  expected_answer = 'Dans tous les cas :
• But refusé.
• Si l’arbitre était dans la surface de réparation : balle à terre donnée au gardien de but.
• Si l’arbitre était hors de la surface de réparation : balle à terre donnée à un joueur de l’équipe B à l’endroit où le jeu a été arrêté.'
WHERE id = 285;

UPDATE public.rq_questions SET
  question = 'Dans le rond central, un coup franc est joué par le joueur n°5A. Voyant que le joueur n°10B va intercepter le ballon, le joueur n°5A joue une seconde fois consécutivement le ballon qui est contré par le joueur n°10B qui s’en va marquer un but pour son équipe. Décisions ?',
  expected_answer = '• Par application de l’avantage : but accordé. Coup d’envoi.'
WHERE id = 286;

UPDATE public.rq_questions SET
  question = 'Lorsqu’un mur est formé par une équipe, que savez-vous de la position des attaquants par rapport au mur ?',
  expected_answer = '• Lorsqu’un mur de moins de trois joueurs est formé, un ou des attaquants peuvent se positionner dans le mur ou aux alentours à moins d’un mètre.
• Lorsqu’un mur de trois joueurs ou plus est formé, un ou des attaquants doivent être à au moins un mètre du mur.
• Il appartient aux arbitres de faire respecter cette distance d’un mètre avant l’exécution du coup franc.'
WHERE id = 287;

UPDATE public.rq_questions SET
  question = 'L’arbitre siffle un coup franc pour l’équipe A à 20 mètres des buts de l’équipe B. L’équipe B forme un mur de cinq joueurs. L’arbitre met à distance réglementaire les attaquants de l’équipe A. Au moment où un attaquant A botte le coup franc, un partenaire s’approche à moins d’un mètre du mur. Décisions ?',
  expected_answer = '• Arrêt du jeu.
• Coup franc indirect pour l’équipe B à l’endroit de l’infraction.'
WHERE id = 288;

-- Vérification : doit retourner 17
SELECT COUNT(*) AS questions_loi_13_updated
FROM public.rq_questions q
JOIN public.rq_categories c ON c.id = q.category_id
WHERE c.law_number = 'Loi 13';

COMMIT;
