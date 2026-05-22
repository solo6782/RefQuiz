-- ============================================================
-- RefQuiz — Questions Loi 13 (Coups francs)
-- Source : CFA/DA — Section "Lois du Jeu" — Questions/Réponses — Juillet 2025
-- Format : questions ouvertes (évaluées par IA), réponses = corrigé officiel.
-- ============================================================

ALTER TABLE public.rq_questions ADD COLUMN IF NOT EXISTS source TEXT;

INSERT INTO public.rq_questions (category_id, type, question, expected_answer, explanation, difficulty, source)
VALUES
-- §1 Exécution avant le signal de l'arbitre
((SELECT id FROM public.rq_categories WHERE law_number='Loi 13'), 'open',
 'Comment l''arbitre doit-il agir en ce qui concerne le signal d''exécution d''un coup franc ?',
 'Il n''est pas nécessaire de siffler la reprise du jeu pour la plupart des coups francs. En revanche, le coup de sifflet est nécessaire pour signifier la reprise du jeu : lors d''un coup franc avec placement d''un mur à distance réglementaire, et après interruption du jeu pour sanctionner disciplinairement un joueur.',
 NULL, 1, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 13'), 'open',
 'Un joueur veut jouer rapidement un coup franc à 30 m du but. Un adversaire, qui n''est pas à distance réglementaire : a) intercepte le ballon ; b) empêche délibérément l''exécution du coup franc. Décisions ?',
 'a) L''arbitre doit laisser le jeu se poursuivre. b) L''arbitre ne doit pas permettre l''exécution du coup franc ; il avertira le fautif pour avoir retardé la reprise du jeu.',
 NULL, 2, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 13'), 'open',
 'Alors que l''arbitre est en train de placer le mur, aux abords de la surface de réparation, le tireur du coup franc exécute la remise en jeu avant le signal de l''arbitre. Décisions ?',
 'Arrêt du jeu. Quel que soit le résultat du tir, le coup franc est à recommencer.',
 NULL, 2, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 13'), 'open',
 'Alors que l''arbitre est en train de placer le mur, le tireur du coup franc botte le ballon avant le signal. Quelle doit être la décision de l''arbitre si le ballon se dégonfle après avoir été mis en jeu ?',
 'Arrêt du jeu. Changement de ballon. Coup franc à recommencer.',
 NULL, 2, 'CFA/DA Juillet 2025'),

-- §2 Coup franc indirect – Oubli par l'arbitre de lever le bras
((SELECT id FROM public.rq_categories WHERE law_number='Loi 13'), 'open',
 'Un but a été marqué directement sur un coup franc indirect accordé à l''équipe attaquante dans la surface de réparation adverse, alors que l''arbitre n''a pas levé le bras avant son exécution. Décisions et explications ?',
 'But refusé. Coup franc indirect à refaire.',
 'Les Lois du Jeu sont formelles : l''arbitre a l''obligation de lever le bras lors des coups francs indirects, y compris lors de l''exécution dans la surface de réparation pour l''équipe attaquante.',
 2, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 13'), 'open',
 'Lors de l''exécution d''un coup franc indirect, l''arbitre oublie de lever le bras. Pendant la trajectoire du ballon, un défenseur, dans sa surface de réparation, frappe un attaquant également situé dans la surface de réparation. Le but est marqué directement. Faut-il refuser le but et accorder un penalty, ou refaire tirer le coup franc indirect ?',
 'Dans les deux cas : but refusé. Exclusion du défenseur pour acte de brutalité. Penalty pour l''équipe attaquante.',
 'Le but ne peut pas être accordé puisqu''il s''agissait d''un coup franc indirect. La faute commise durant la trajectoire du ballon doit être sanctionnée car le ballon était en jeu.',
 3, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 13'), 'open',
 'L''arbitre siffle un attaquant de l''équipe A en position de hors-jeu dans le camp de l''équipe B, très loin du but de l''équipe A. Comment l''arbitre devra-t-il exécuter la signalisation ?',
 'L''arbitre signale un coup franc indirect en levant le bras à la verticale, puis baisse son bras immédiatement une fois le ballon remis en jeu. Lorsqu''il y a une très faible probabilité qu''un but soit marqué directement, il n''a pas besoin d''attendre que le ballon soit joué par un autre joueur ou sorte du terrain pour baisser son bras.',
 NULL, 1, 'CFA/DA Juillet 2025'),

-- §3 Irrégularité commise lors de l'exécution d'un coup franc
((SELECT id FROM public.rq_categories WHERE law_number='Loi 13'), 'open',
 'Lors d''un coup franc direct, l''arbitre a donné le signal mais, avant le botté du ballon : a) un défenseur s''approche à moins de 9,15 m du ballon ou commet une faute sur un adversaire ; b) un attaquant gesticule devant un mur formé de moins de trois joueurs ou commet une faute sur un adversaire. Décisions selon que le but est marqué, le ballon sort en but, est détourné en corner, ou revient en jeu ?',
 'a) Si le but est marqué : but accordé, coup d''envoi. Dans les autres cas : avertissement au fautif pour non-respect de la distance ou comportement antisportif, coup franc à rejouer. b) Avertissement au fautif pour comportement antisportif ; si le but est marqué : but refusé, coup franc à recommencer ; dans les autres cas : coup franc indirect pour l''équipe adverse à l''endroit de la faute, sous réserve de la procédure de la Loi 13.',
 NULL, 3, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 13'), 'open',
 'Quels critères l''arbitre doit-il retenir pour valider ou non l''exécution d''un coup franc lorsque le joueur chargé de le botter déplace le ballon en maintenant son pied en contact avec celui-ci ?',
 'Le ballon est en jeu dès qu''il a été botté et a clairement bougé ; les adversaires peuvent alors s''approcher aussitôt. Le contact avec le ballon ne doit cesser à aucun moment : si le contact cesse puis que le joueur remet le pied sur le ballon, il joue deux fois consécutivement et est sanctionné d''un coup franc indirect. De plus, le mouvement du ballon ne doit comporter qu''une seule phase ; s''il en comporte plusieurs (ballon déplacé puis, après un arrêt, déplacé à nouveau ; déplacé vers l''avant puis ramené en arrière sans arrêt ; déplacé avec changement de direction), le botteur joue deux fois consécutivement et est sanctionné d''un coup franc indirect.',
 NULL, 3, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 13'), 'open',
 'Comment définit-on un coup franc joué rapidement ? Si l''arbitre commence à placer le mur et que le botteur « joue rapidement », le coup franc est-il toujours considéré comme « joué rapidement » ?',
 'Un coup franc est joué rapidement quand, aussitôt après l''arrêt du jeu et dans la continuité de l''action, un joueur de l''équipe bénéficiaire botte le ballon arrêté à l''endroit de la faute (ou à l''endroit précisé par la Loi) ; le signal de reprise est alors tacite, même non visible. En revanche, dès qu''un joueur de l''équipe bénéficiaire demande le respect de la distance réglementaire, le coup franc ne peut plus être joué rapidement : l''IFAB précise que le coup de sifflet est nécessaire pour la reprise lors d''un coup franc avec mur placé à distance réglementaire.',
 NULL, 2, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 13'), 'open',
 'Coup franc direct. Une équipe attaquante met au point une tactique : un premier joueur passe au-dessus du ballon, ce qui provoque l''avancée du mur ; un partenaire le suit et botte le ballon. Décisions et explications ?',
 'Faire semblant de tirer un coup franc pour tromper l''adversaire est permis (cela fait partie du jeu). Si un adversaire ne se trouve pas à distance réglementaire lors de l''exécution, le coup franc devra être retiré (sauf application de l''avantage) et le fautif averti pour non-respect de la distance. Si le but est marqué : but accordé, coup d''envoi ; sinon : coup franc à recommencer.',
 NULL, 3, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 13'), 'open',
 'Coup franc aux abords de la surface de réparation au profit de l''équipe attaquante, avec formation d''un mur. Selon la procédure managériale, l''arbitre demande au botteur d''attendre son coup de sifflet. Malgré tout, avant le signal, le botteur exécute le coup franc. Décisions et explications ?',
 'Le botteur ne respecte pas la demande de l''arbitre : il se rend coupable d''un comportement antisportif sanctionnable d''un avertissement. Coup franc à recommencer dans tous les cas.',
 'IFAB : si l''arbitre souhaite que les joueurs attendent le coup de sifflet (par exemple pour s''assurer que les défenseurs sont à 9,15 m), il doit clairement indiquer aux joueurs de l''équipe en attaque qu''ils doivent attendre le coup de sifflet.',
 2, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 13'), 'open',
 'Un coup franc est accordé à l''équipe A dans sa surface de réparation. Le gardien de but lève le ballon vers un partenaire situé sur le terrain (dans ou hors de la surface) qui le lui renvoie de la tête. Décisions ?',
 'Arrêt du jeu. Avertissement au gardien de but pour comportement antisportif. Que le gardien rejoue le ballon des mains ou non, coup franc indirect pour l''équipe B à l''endroit où le gardien a initié la stratégie, sous réserve de la procédure de la Loi 13.',
 NULL, 3, 'CFA/DA Juillet 2025'),

-- §4 Questions diverses
((SELECT id FROM public.rq_categories WHERE law_number='Loi 13'), 'open',
 'Un coup franc indirect est tiré par un défenseur n°5B depuis sa surface de réparation. Le ballon est renvoyé involontairement par l''arbitre vers le but. Ce même défenseur, pour l''empêcher de pénétrer dans son but, touche le ballon de la main mais n''y parvient pas. Décisions ?',
 'Dans tous les cas : but refusé. Si l''arbitre était dans la surface de réparation : balle à terre donnée au gardien de but. S''il était hors de la surface de réparation : balle à terre donnée à un joueur de l''équipe B à l''endroit où le jeu a été arrêté.',
 NULL, 3, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 13'), 'open',
 'Dans le rond central, un coup franc est joué par le joueur n°5A. Voyant que le joueur n°10B va intercepter le ballon, le joueur n°5A joue une seconde fois consécutivement le ballon, qui est contré par le n°10B qui s''en va marquer un but pour son équipe. Décisions ?',
 'Par application de l''avantage : but accordé. Coup d''envoi.',
 NULL, 2, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 13'), 'open',
 'Lorsqu''un mur est formé par une équipe, que savez-vous de la position des attaquants par rapport au mur ?',
 'Lorsqu''un mur de moins de trois joueurs est formé, un ou des attaquants peuvent se positionner dans le mur ou à ses alentours, à moins d''un mètre. Lorsqu''un mur de trois joueurs ou plus est formé, le ou les attaquants doivent être à au moins un mètre du mur. Il appartient aux arbitres de faire respecter cette distance d''un mètre avant l''exécution du coup franc.',
 NULL, 1, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 13'), 'open',
 'L''arbitre siffle un coup franc pour l''équipe A à 20 mètres des buts de l''équipe B. L''équipe B forme un mur de cinq joueurs. L''arbitre met à distance réglementaire les attaquants de l''équipe A. Au moment où un attaquant A botte le coup franc, un partenaire s''approche à moins d''un mètre du mur. Décisions ?',
 'Arrêt du jeu. Coup franc indirect pour l''équipe B à l''endroit de l''infraction.',
 NULL, 2, 'CFA/DA Juillet 2025');
