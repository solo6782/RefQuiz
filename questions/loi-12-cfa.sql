-- ============================================================
-- RefQuiz — Questions Loi 12 (Fautes et incorrections) — version CFA/DA
-- Source : CFA/DA — Section "Lois du Jeu" — Questions/Réponses — Juillet 2025
-- Format : questions ouvertes (évaluées par IA), réponses = corrigé officiel.
-- NB : fichier distinct de loi-12.sql (source 'LGEF Pré-JAF n°2').
--      Les deux jeux coexistent grâce au champ 'source'.
-- ============================================================

ALTER TABLE public.rq_questions ADD COLUMN IF NOT EXISTS source TEXT;

INSERT INTO public.rq_questions (category_id, type, question, expected_answer, explanation, difficulty, source)
VALUES
-- §1 Fautes en même temps
((SELECT id FROM public.rq_categories WHERE law_number='Loi 12'), 'open',
 'Dans le cadre de fautes commises en même temps, comment l''arbitre doit-il apprécier la gravité de la faute afin de déterminer la reprise du jeu ?',
 'L''IFAB attend des arbitres qu''ils fassent preuve de pertinence dans de telles situations : il n''est pas possible de fournir une réponse définitive au regard de « cracher » ou de « frapper ». L''appréciation des faits peut varier d''une situation à l''autre (le crachat a-t-il atteint l''adversaire ? quelle a été la force ou l''impact du coup de poing ? etc.).',
 NULL, 2, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 12'), 'open',
 'Quelle est la décision à prendre lorsque deux fautes sont commises simultanément par deux joueurs de la même équipe ?',
 'L''arbitre doit sanctionner la faute la plus grave, peu importe le nombre de joueurs ou l''équipe à laquelle ils appartiennent.',
 NULL, 1, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 12'), 'open',
 'Quelle est la décision à prendre lorsque deux fautes sont commises simultanément par le même joueur ?',
 'L''arbitre doit sanctionner la faute la plus grave.',
 NULL, 1, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 12'), 'open',
 'Corner effectué par le n°7 de l''équipe A. Le ballon heurte la barre transversale, revient vers le n°7 qui marque mais, au moment où il reprend le ballon, le libéro adverse, situé sur la ligne de but, donne un coup de poing à un adversaire. Ce dernier, dans l''action, avait pénétré dans les filets. Décisions et explications ?',
 'But refusé. Exclusion du libéro pour acte de brutalité. Penalty pour l''équipe A. Rapport.',
 'Le fait de frapper est une faute plus grave que celle de toucher deux fois consécutivement le ballon.',
 3, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 12'), 'open',
 'Coup franc en faveur de l''équipe A à l''intérieur de la surface de réparation adverse. Le joueur lève le ballon du pied à une hauteur de 1,50 m et, d''un coup de tête, lobe le mur au moment même où un défenseur B frappe un adversaire A situé à l''extérieur du terrain et qui recevait des soins. Le ballon termine sa course au fond des filets. Décisions ?',
 'But refusé. Exclusion du défenseur de l''équipe B pour acte de brutalité. Coup franc direct pour l''équipe A exécuté sur le point de la limite du terrain le plus proche de l''endroit où se trouvait la victime ; penalty pour l''équipe A si ledit point se trouve sur une des parties de la ligne de but délimitant la surface de réparation de l''équipe B. Rapport.',
 NULL, 3, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 12'), 'open',
 'Le ballon est en jeu. Le joueur n°5A crache sur un partenaire. Au même moment, dans sa surface de réparation, le joueur n°10B frappe le joueur n°7A, situé lui aussi sur le terrain. Ce dernier se met à saigner. Décisions et explications ?',
 'Arrêt du jeu. Exclusion du joueur n°5A pour avoir craché sur un partenaire. Exclusion du joueur n°10B pour acte de brutalité. Le joueur blessé doit quitter le terrain pour faire stopper le saignement. Si le joueur n°7A se trouve dans la surface de réparation de l''équipe B : penalty pour l''équipe A ; s''il est hors de la surface de réparation : coup franc direct pour l''équipe A à l''endroit où il se trouvait, sous réserve de la procédure de la Loi 13. Rapport.',
 'Ici, le coup de poing est plus grave que le crachat.',
 3, 'CFA/DA Juillet 2025'),

-- §2 Fautes du gardien de but ou fautes contre lui
((SELECT id FROM public.rq_categories WHERE law_number='Loi 12'), 'open',
 'Dans sa surface de réparation, le gardien de but de l''équipe A détourne le ballon en corner à l''aide du protège-tibia qu''il tient à la main. Décisions et explications ?',
 'Arrêt du jeu. Avertissement au gardien pour comportement antisportif, ou exclusion s''il empêche un but d''être marqué. Penalty pour l''équipe B.',
 'Le fait de toucher le ballon avec un objet tenu en main est une faute de la Loi 12.',
 2, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 12'), 'open',
 'Dans sa surface de réparation, le gardien de but de l''équipe A détourne le ballon dans son but à l''aide du protège-tibia qu''il tient à la main. Décisions ?',
 'But accordé. Avertissement au gardien pour comportement antisportif. Coup d''envoi.',
 NULL, 2, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 12'), 'open',
 'À l''aide du ballon qu''il tient en mains, un gardien de but repousse violemment, en dehors de sa surface de réparation, un attaquant qui s''est déplacé latéralement pour lui faire intentionnellement obstruction et l''empêcher de dégager le ballon. Décisions ?',
 'Arrêt du jeu. Avertissement à l''attaquant pour comportement antisportif. Exclusion du gardien de but pour acte de brutalité. Nomination d''un nouveau gardien de but. Obstacle sans contact : coup franc indirect pour l''équipe défendante à l''endroit de la faute ; obstacle avec contact : coup franc direct pour l''équipe défendante à l''endroit de la faute. Rapport.',
 NULL, 3, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 12'), 'open',
 'En possession du ballon, un gardien de but le fait rebondir au sol avant de le dégager. À ce moment-là, un attaquant le lui subtilise pour marquer un but. Décisions et explications ?',
 'But refusé. Coup franc indirect pour l''équipe défendante à l''endroit où l''attaquant a touché le ballon, sous réserve de la procédure de la Loi 13.',
 'Un gardien de but est considéré comme en possession du ballon en mains quand il fait rebondir le ballon sur le sol ou le lance en l''air ; un adversaire ne peut donc pas le lui disputer.',
 2, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 12'), 'open',
 'Tenant le ballon en mains, un gardien de but le fait rouler au sol pour le dégager. À ce moment-là, un attaquant le lui subtilise pour marquer un but. Décisions et explications ?',
 'But accordé. Coup d''envoi.',
 'Le gardien n''est plus considéré comme en possession du ballon ; l''attaquant peut donc librement le jouer.',
 2, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 12'), 'open',
 'Sur un tir anodin d''un attaquant, le gardien de but adverse, dans sa propre surface de réparation, repousse volontairement le ballon avec les mains devant lui et le reprend immédiatement en mains alors qu''un attaquant tentait de le lui disputer. Décisions et explications ?',
 'Arrêt du jeu. Coup franc indirect pour l''équipe adverse à l''endroit où le gardien de but a repris le ballon, sous réserve de la procédure de la Loi 13.',
 'Un gardien est en possession du ballon quand il le tient entre ses mains ou entre sa main et une surface, ou quand le ballon entre en contact avec ses mains/bras — sauf si le ballon rebondit sur lui ou qu''il l''a repoussé. Dès lors que le gardien cherche à contourner l''esprit de la Loi, il doit être sanctionné.',
 3, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 12'), 'open',
 'Quelle attitude doit adopter l''arbitre lorsqu''un gardien de but est chargé par un adversaire ?',
 'Le gardien de but est un joueur comme un autre et peut être chargé loyalement. En revanche, un adversaire ne peut pas lui disputer le ballon lorsqu''il l''a en mains, c''est-à-dire quand : le ballon entre en contact avec une partie quelconque de ses mains ou de ses bras (sauf s''il rebondit sur lui ou qu''il l''a repoussé) ; il fait rebondir le ballon sur le sol ou le lance en l''air ; il tient le ballon entre les mains ou entre la main et une surface (sol, son corps) ; il tient le ballon sur la main ouverte.',
 NULL, 2, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 12'), 'open',
 'Ballon en jeu, dans sa surface de réparation, le gardien de but frappe un adversaire avec le ballon (sans le lâcher). Ce dernier est situé en dehors du terrain au-delà de la ligne de but. Décisions ?',
 'Arrêt du jeu. Exclusion du gardien de but pour acte de brutalité. Nomination d''un nouveau gardien de but. Si l''attaquant est en dehors de la zone délimitée par les filets : penalty pour l''équipe adverse ; s''il est dans la zone délimitée par les filets : but accordé, coup d''envoi. Rapport.',
 NULL, 3, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 12'), 'open',
 'Un défenseur effectue un tacle régulier sur le ballon qui était jusqu''alors en possession de l''équipe attaquante. Sur ce tacle, le ballon parvient directement au gardien de but de l''équipe défendante qui s''en saisit des mains à l''intérieur de sa surface de réparation. Décisions et explications ?',
 'L''arbitre doit considérer le tacle comme un geste maîtrisé. S''il s''agit d''une passe délibérée : arrêt du jeu, coup franc indirect pour l''équipe attaquante à l''endroit où le gardien prend le ballon à la main, sous réserve de la procédure de la Loi 13. S''il s''agit d''un tacle pour enlever/intercepter le ballon afin d''éviter qu''il n''arrive à un attaquant : laisser jouer.',
 NULL, 3, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 12'), 'open',
 'Un gardien fait rebondir le ballon après s''en être saisi des mains. Décisions ?',
 'Dans le cas général, dans la limite des 8 secondes, le gardien peut faire rebondir le ballon après s''en être saisi. Si son intention initiale était de dégager de la main et que, se ravisant au dernier moment, il fait rebondir le ballon pour le reprendre : laisser jouer. En revanche, si, voulant dégager de la main, il laisse échapper le ballon par maladresse, il n''est plus à distance de jeu pour lui : s''il s''avance et le reprend de la main, il y a lieu de sanctionner d''un coup franc indirect.',
 NULL, 3, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 12'), 'open',
 'Lors d''une action de jeu, un gardien de but dégage volontairement et violemment le ballon du pied sur un attaquant situé à quelques mètres de lui. Décisions ?',
 'Sous réserve de l''avantage, arrêt du jeu. Exclusion du gardien de but pour acte de brutalité. Nomination d''un nouveau gardien de but. Coup franc direct pour l''équipe attaquante à l''endroit où se trouvait l''attaquant, ou penalty s''il se trouvait dans la surface de réparation adverse. Rapport.',
 NULL, 3, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 12'), 'open',
 'Un spectateur entre sur le terrain alors que le ballon est en jeu dans les mains du gardien de but. Le gardien, mécontent, dégage volontairement et violemment le ballon du pied sur le spectateur venu se positionner juste devant lui. Décisions ?',
 'Arrêt du jeu. Exclusion du gardien de but pour acte de brutalité. L''arbitre demande à l''agent extérieur de quitter le terrain. Nomination d''un nouveau gardien de but. Balle à terre donnée au nouveau gardien de but. Rapport.',
 NULL, 3, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 12'), 'open',
 'Un gardien de but ou un joueur de champ botte régulièrement un coup de pied de but ou un coup franc depuis sa surface de réparation. Le ballon parcourt quelques mètres. Un attaquant se précipite dans la surface de réparation pour le jouer. Voyant que l''attaquant va récupérer le ballon, le botteur court et réussit à le dégager du pied. Décisions ?',
 'Arrêt du jeu. Si le tireur a stoppé une attaque prometteuse : avertissement pour comportement antisportif. S''il a privé l''attaquant d''un but ou d''une occasion de but manifeste : exclusion pour avoir annihilé une occasion de but manifeste (nomination d''un nouveau gardien le cas échéant). Coup franc indirect à l''endroit où le tireur a touché une seconde fois le ballon, sous réserve de la procédure de la Loi 13. Rapport en cas d''exclusion.',
 NULL, 3, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 12'), 'open',
 'Un gardien de but vient de s''emparer du ballon avec les mains dans sa surface de réparation. De quelle manière l''arbitre doit-il veiller au respect du délai de 8 secondes ?',
 'Dès que le gardien prend clairement possession du ballon avec ses mains (en le tenant, le faisant rebondir ou le lançant en l''air), l''arbitre commence le décompte des 8 secondes : 1) début du décompte dès que le gardien commence à conserver le ballon à la main ; 2) signal visuel et vocal de la 4e à la 8e seconde ; 3) à 8 secondes, si le gardien n''a pas relâché le ballon, l''arbitre arrête le jeu et accorde un corner à l''équipe adverse, exécuté du côté le plus proche de l''endroit où se trouvait le gardien ; 4) en cas de récidive délibérée, mise en garde et nouveau corner ; nouvelle récidive : nouveau corner et avertissement du gardien pour avoir retardé la reprise du jeu.',
 NULL, 2, 'CFA/DA Juillet 2025'),

-- §3 Passe délibérée au gardien de but – Joueur contournant la Loi
((SELECT id FROM public.rq_categories WHERE law_number='Loi 12'), 'open',
 'Un défenseur récupère le ballon du pied, jongle et, de la tête, le passe à son gardien de but. Décisions et explications ?',
 'Arrêt du jeu. Avertissement au défenseur pour comportement antisportif. Coup franc indirect contre le défenseur, sous réserve de la procédure de la Loi 13.',
 'Un joueur qui initie délibérément une stratégie pour que le ballon soit passé à son gardien de la tête, de la poitrine, du genou, etc. (y compris sur coup franc ou coup de pied de but) afin de contourner la Loi est sanctionné, que le gardien touche ou non le ballon des mains ; c''est celui qui initie la stratégie qui est pénalisé.',
 2, 'CFA/DA Juillet 2025'),

-- §4 Faute grossière – Acte de brutalité
((SELECT id FROM public.rq_categories WHERE law_number='Loi 12'), 'open',
 'À 25 mètres du but adverse, le joueur n°10A vient d''éliminer ses adversaires et se dirige vers le gardien de but B. Celui-ci sort de sa surface de réparation et ceinture l''attaquant sans parvenir à l''arrêter. L''arbitre laisse l''avantage. L''attaquant arrive à 5 m du but et va marquer. Revenu en catastrophe, le joueur n°4B dégage le ballon en ligne de but par un tacle totalement incontrôlé et très dangereux. Il ne touche pas l''attaquant. Décisions et explications ?',
 'Arrêt du jeu. Avertissement au gardien de but pour comportement antisportif. Exclusion du joueur n°4B pour faute grossière. Penalty pour l''équipe A. Rapport.',
 'Un tel tacle constitue une mise en danger de l''intégrité physique de l''adversaire.',
 3, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 12'), 'open',
 'Un défenseur, à la lutte avec un attaquant, tente de couvrir le ballon pour que son gardien s''en empare dans la surface de réparation. Le ballon reste à distance de jeu et le défenseur fait volontairement écran de son corps, sans usage des mains et des bras, pour stopper l''attaquant. Celui-ci vient heurter le défenseur dans le dos et les deux joueurs tombent. Mécontent, l''attaquant se relève et adresse un violent coup de pied au défenseur. Décisions et explications ?',
 'Arrêt du jeu. Exclusion de l''attaquant pour acte de brutalité. Coup franc direct pour l''équipe défendante à l''endroit de la faute, sous réserve de la procédure de la Loi 13. Rapport.',
 'Un joueur a le droit de protéger le ballon en se plaçant entre l''adversaire et le ballon tant que celui-ci reste à distance de jeu et qu''il ne maintient pas l''adversaire à distance avec les bras ou le corps ; si le ballon est à distance de jeu, le joueur peut être chargé loyalement.',
 3, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 12'), 'open',
 'Sur un long ballon aérien, un attaquant et un défenseur s''apprêtent à le disputer de la tête. Les deux joueurs sont en pleine extension quand le coude de l''attaquant, véritablement saillant, percute l''adversaire au visage. L''attaquant parvient toutefois à dévier le ballon. Décisions et explications ?',
 'Arrêt du jeu. Exclusion de l''attaquant pour faute grossière. Coup franc direct pour l''équipe défendante, sous réserve de la procédure de la Loi 13. Rapport.',
 'IFAB : tacler ou disputer le ballon tout en mettant en danger l''intégrité physique d''un adversaire, ou en agissant avec violence ou brutalité, doit être sanctionné comme faute grossière.',
 3, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 12'), 'open',
 'Sur un long ballon aérien, un attaquant et un défenseur s''apprêtent à le disputer de la tête. Les deux joueurs sont en pleine extension et le défenseur prend le dessus. Il dévie le ballon vers son gardien qui le récupère, et c''est à ce moment-là que l''attaquant lui assène un coup de coude. Décisions et explications ?',
 'Arrêt du jeu. Exclusion de l''attaquant pour acte de brutalité. Coup franc direct pour l''équipe défendante, sous réserve de la procédure de la Loi 13. Rapport.',
 'Il ne s''agit pas d''une faute grossière puisque l''attaquant ne dispute plus le ballon.',
 3, 'CFA/DA Juillet 2025'),

-- §5 Anéantissement d'une occasion de but… ou non
((SELECT id FROM public.rq_categories WHERE law_number='Loi 12'), 'open',
 'L''attaquant n°9, à 50 cm de la ligne de but adverse, n''a plus qu''à pousser le ballon de la tête dans le but : c''est un but immanquable ! À hauteur du visage de l''attaquant, un défenseur effectue alors un ciseau dangereux sans le toucher mais qui, de ce fait, l''empêche de marquer. Décisions et explications ?',
 'Arrêt du jeu. Exclusion du défenseur pour avoir empêché un but en commettant une faute passible d''un coup franc. Coup franc indirect pour l''équipe attaquante, sur la ligne de la surface de but parallèle à la ligne de but, à l''endroit le plus proche de la faute. Rapport.',
 'La reprise technique n''étant pas un penalty, la sanction disciplinaire ne peut pas être ramenée à un avertissement.',
 3, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 12'), 'open',
 'Un attaquant est victime, à 30 m du but adverse, d''une faute d''un 1er défenseur passible d''exclusion (hors faute grossière et acte de brutalité) car il l''empêche d''avoir une possibilité de marquer ; il en réchappe et l''arbitre laisse l''avantage. Dans la surface de réparation, un 2e défenseur commet sur lui une faute identique, donc passible d''exclusion. Décisions si : a) l''attaquant réchappe à la 2e faute et marque ; b) l''attaquant perd le contrôle mais un partenaire s''empare du ballon et marque ; c) l''attaquant perd le contrôle et la défense se dégage ?',
 'Cas a) et b) : but accordé, avertissement aux deux défenseurs fautifs pour comportement antisportif, coup d''envoi. Cas c) : arrêt du jeu ; avertissement au 1er défenseur pour comportement antisportif ; avertissement au 2e défenseur pour comportement antisportif, ou exclusion pour avoir annihilé une occasion nette de but si la faute consiste à tenir, tirer ou pousser un adversaire, ou si le joueur fautif n''a pas essayé de jouer/disputer le ballon ou n''était pas en mesure de le faire ; penalty ; rapport.',
 NULL, 3, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 12'), 'open',
 'Coup franc direct proche de la surface de réparation adverse. Après le signal de l''arbitre, le joueur n°9A frappe le ballon qui se dirige en pleine lucarne. Le défenseur n°2B s''appuie alors sur un coéquipier pour s''élever plus haut et arrive à détourner le ballon de la tête hors du but. Décisions ?',
 'Exclusion du joueur n°2B pour avoir empêché un but en commettant une faute passible d''un coup franc. Penalty pour l''équipe A. Rapport.',
 NULL, 3, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 12'), 'open',
 'Un attaquant pénètre dans la surface de réparation adverse avec une occasion nette de marquer quand il est victime d''une faute d''un défenseur (ou du gardien). L''arbitre siffle le penalty qui s''impose. Quelle sera la sanction disciplinaire si : a) la faute est un tirage de maillot ; b) le défenseur lui fait un croc-en-jambe délibéré, par derrière, sans jouer le ballon ; c) le défenseur le déséquilibre tout en tentant de tacler le ballon ; d) le défenseur tacle avec virulence en mettant en danger l''intégrité physique de l''attaquant ?',
 'a) et b) : exclusion du joueur fautif pour avoir annihilé une occasion de but manifeste d''un adversaire se dirigeant vers le but. c) Avertissement pour comportement antisportif. d) Exclusion pour faute grossière.',
 NULL, 3, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 12'), 'open',
 'Ballon en jeu, un gardien de but lance son protège-tibia et touche (ou non) le ballon. Décisions selon que : a) le gardien est en dehors de sa surface de réparation et le ballon à l''intérieur ; b) le gardien et le ballon sont dans la surface de réparation ; c) le gardien est dans sa surface de réparation et le ballon en dehors ?',
 'Dans tous les cas : sous réserve de l''avantage, arrêt du jeu ; avertissement au gardien pour comportement antisportif ou exclusion s''il anéantit une occasion de but manifeste ; nomination éventuelle d''un nouveau gardien ; rapport en cas d''exclusion. a) et b) : penalty pour l''équipe attaquante. c) Coup franc direct pour l''équipe attaquante à l''endroit où le protège-tibia est entré en contact avec le ballon. N.B. : réponses identiques si le gardien touche le ballon avec un objet tenu à la main (protège-tibia, casquette…).',
 NULL, 3, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 12'), 'open',
 'Sur le terrain, un joueur tenant un objet à la main tente de toucher le ballon sans parvenir à l''atteindre. Décisions ?',
 'Sous réserve de l''avantage, arrêt du jeu. Avertissement au joueur pour comportement antisportif. Coup franc indirect pour l''équipe adverse à l''endroit de la faute, sous réserve de la procédure de la Loi 13.',
 NULL, 2, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 12'), 'open',
 'Un défenseur repousse délibérément le ballon de la main alors qu''il allait pénétrer dans son but. Un attaquant reprend le ballon et tire au but. C''est alors qu''un autre défenseur le détourne également volontairement de la main, sans l''empêcher de pénétrer dans le but. Décisions ?',
 'But accordé. Avertissement au 1er défenseur pour comportement antisportif. Avertissement au 2e défenseur pour comportement antisportif. Coup d''envoi.',
 NULL, 3, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 12'), 'open',
 'Lors d''une action de jeu, le joueur n°9A tire en direction du but de l''équipe B. Le joueur n°5B, revenu en catastrophe sur la ligne de but, s''accroche à la barre transversale et dévie le ballon hors du but. Décisions ?',
 'Dans tous les cas : arrêt du jeu ; exclusion du joueur n°5B pour avoir empêché un but d''être marqué en commettant une faute passible d''un coup franc ; rapport. S''il a dévié le ballon de la main ou du bras : penalty pour l''équipe A. S''il l''a dévié d''une autre partie du corps : coup franc indirect sur la ligne des 5,50 m parallèle à la ligne de but, au point le plus proche de la faute.',
 NULL, 3, 'CFA/DA Juillet 2025'),

-- §6 Faute de main
((SELECT id FROM public.rq_categories WHERE law_number='Loi 12'), 'open',
 'Sur une action de jeu, un joueur marque délibérément un but de la main contre son camp. Décisions et explications ?',
 'But accordé. Avertissement au joueur pour comportement antisportif. Coup d''envoi.',
 'Le joueur se comporte d''une manière irrespectueuse envers l''esprit du jeu.',
 2, 'CFA/DA Juillet 2025'),

-- §7 Fautes par "lancer ou botter un objet" ou "cracher"
((SELECT id FROM public.rq_categories WHERE law_number='Loi 12'), 'open',
 'Alors que le ballon est en jeu, concernant les fautes de « lancer » ou de « cracher », quelles seront les reprises de jeu possibles lorsqu''un joueur, hors du terrain, commet une faute ou en est victime ?',
 'Si le joueur lance un objet ou crache sur un adversaire, un partenaire ou un arbitre situé sur le terrain : coup franc direct ou penalty. Sur une personne de l''équipe adverse hors du terrain (remplaçant, remplacé, officiel, joueur refoulé) : coup franc direct sur le point de la limite du terrain le plus proche de la victime, ou penalty si ce point est sur la ligne de but délimitant la surface de réparation du fautif. Sur une personne de son équipe hors du terrain : coup franc indirect au point le plus proche de la victime. S''il reçoit un objet d''un adversaire depuis le terrain : coup franc direct au point le plus proche (ou penalty selon l''emplacement). D''un partenaire depuis le terrain : coup franc indirect. D''un remplaçant/officiel hors du terrain : coup franc direct (ou penalty) si le fautif est adverse, coup franc indirect s''il est de son équipe. N.B. : pour une faute sur une personne de son équipe, l''arbitre n''est pas obligé d''arrêter immédiatement ; le fautif est exclu au 1er arrêt de jeu.',
 NULL, 3, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 12'), 'open',
 'Alors que le ballon est en jeu, un gardien de but, dans sa surface de réparation, touche d''un jet de pierre un remplaçant de l''équipe adverse qui s''échauffait derrière l''arbitre assistant. Décisions ?',
 'Sous réserve de l''avantage, arrêt du jeu. Exclusion du gardien pour acte de brutalité. Nomination d''un nouveau gardien. Coup franc direct pour l''équipe adverse exécuté sur le point de la ligne de touche le plus proche de l''endroit où se trouvait la victime. Rapport.',
 NULL, 3, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 12'), 'open',
 'Ballon en jeu. Un joueur refoulé pour remettre son équipement en conformité avec la Loi 4 attend un arrêt de jeu pour revenir. Il reçoit une pierre lancée par un adversaire situé dans sa surface de réparation. Décisions ?',
 'Sous réserve de l''avantage, arrêt du jeu. Exclusion du fautif pour acte de brutalité. Coup franc direct pour l''équipe adverse exécuté sur le point de la limite du terrain le plus proche de la victime ; penalty si ledit point se trouve sur une des parties de la ligne de but délimitant la surface de réparation du fautif. Rapport.',
 NULL, 3, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 12'), 'open',
 'Un gardien de but, ballon en jeu, jette le ballon qu''il tient en mains sur un attaquant adverse situé en dehors du terrain, emporté par son élan derrière la ligne de but. Décisions ?',
 'Dans tous les cas : exclusion du gardien pour acte de brutalité, nomination d''un nouveau gardien, rapport. Si le joueur est situé dans le but : but accordé, coup d''envoi. S''il est derrière la ligne de but en dehors des buts : arrêt du jeu, coup franc direct pour l''équipe adverse au point de la ligne de but le plus proche de la victime ; penalty si ledit point se trouve sur une des parties de la ligne de but délimitant la surface de réparation du gardien fautif.',
 NULL, 3, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 12'), 'open',
 'Alors que le joueur n°9A part seul au but, le remplaçant n°13B, qui s''échauffait derrière le but, prend un ballon à un ramasseur de balles et le lance dans les pieds de l''attaquant pour le gêner. Décisions ?',
 'Sous réserve de l''avantage, arrêt du jeu. Évacuation du second ballon. Exclusion du remplaçant n°13B pour avoir empêché une occasion de but manifeste. Coup franc direct pour l''équipe A exécuté à l''endroit où le second ballon a interféré (ou là où il a touché/aurait pu toucher l''adversaire ou le ballon du match) ; penalty si le ballon du match ou le joueur A se trouvait dans la surface de réparation de l''équipe B. Rapport.',
 NULL, 3, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 12'), 'open',
 'Alors que le ballon est en jeu, un joueur présent sur le terrain crache sur un adversaire situé en dehors du terrain (emporté par son élan). Décisions ?',
 'Sous réserve de l''avantage, arrêt du jeu. Exclusion du fautif pour crachat. Coup franc direct pour l''équipe adverse exécuté sur le point de la ligne de but le plus proche de la victime ; penalty si ledit point se trouve sur une des parties de la ligne de but délimitant la surface de réparation du fautif. Rapport.',
 NULL, 3, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 12'), 'open',
 'Un défenseur ou le gardien de but, dans sa surface de réparation, tient un objet à la main. Il le lance volontairement et détourne le ballon qui allait entrer dans son but. Décisions ?',
 'Arrêt du jeu. Exclusion du défenseur (ou du gardien) pour avoir empêché l''équipe adverse de marquer en touchant le ballon de la main. Nomination d''un nouveau gardien le cas échéant. Penalty pour l''équipe adverse. Rapport.',
 NULL, 3, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 12'), 'open',
 'Alors que le ballon est en jeu, un joueur de l''équipe A quitte délibérément le terrain pour aller cracher sur un officiel d''équipe assis sur le banc. Décisions ?',
 'Sous réserve de l''avantage, arrêt du jeu. Exclusion du joueur fautif pour avoir craché sur une personne. Si c''est l''officiel de l''équipe A (son équipe) : coup franc indirect pour l''équipe B exécuté sur la ligne de touche au point le plus proche de l''officiel. Si c''est l''officiel de l''équipe B (adverse) : coup franc direct pour l''équipe B sur la ligne de touche au point le plus proche de l''officiel. Rapport.',
 NULL, 3, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 12'), 'open',
 'Alors que le ballon est en jeu, un joueur quitte délibérément le terrain pour aller cracher sur un agent extérieur (spectateur). Décisions ?',
 'Sous réserve de l''avantage, arrêt du jeu. Exclusion du joueur fautif pour avoir craché sur une personne. Coup franc indirect pour l''équipe adverse depuis le point de la limite du terrain où le joueur a quitté le terrain, sous réserve de la procédure de la Loi 13. Rapport.',
 NULL, 3, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 12'), 'open',
 'Le joueur n°8 de l''équipe A exécute correctement une remise en jeu. Le ballon est en jeu lorsqu''un joueur de l''équipe B lance un objet sur le ballon et en dévie la trajectoire. Le joueur n°8A reprend le ballon et marque un but pour son équipe. Décisions et explications ?',
 'Par application de l''avantage, le but est accordé. Avertissement au joueur de l''équipe B pour comportement antisportif. Coup d''envoi.',
 'Le joueur n°8A n''a pas joué deux fois consécutivement le ballon, car un adversaire l''a touché entre-temps.',
 2, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 12'), 'open',
 'Un officiel de l''équipe A, présent sur le banc ou dans la surface technique et régulièrement inscrit sur la feuille de match, lance un objet sur ou vers : a) un adversaire B sur le terrain ; b) un adversaire B refoulé pour mise en conformité de son équipement ; c) un adversaire B soigné le long de la ligne de touche à l''extérieur ; d) un remplaçant/remplacé assis sur le banc adverse ; e) un adversaire B momentanément hors du terrain (emporté par son élan). Décisions ?',
 'Dans tous les cas : exclusion de l''officiel de l''aire de jeu (carton rouge) pour comportement violent ; rapport. a) Coup franc direct pour l''équipe B à l''endroit où l''objet a interféré (ou a touché/aurait pu toucher l''adversaire) ; penalty si le joueur B était dans la surface de réparation de l''équipe A. b) Coup franc direct pour l''équipe B au point de la limite du terrain le plus proche de la victime. c) Coup franc direct pour l''équipe B sur la ligne de touche au point le plus proche. d) Balle à terre à l''endroit où se trouvait le ballon lors de l''arrêt, sous réserve de la procédure de la Loi 8. e) Coup franc direct pour l''équipe B sur la ligne de touche au point le plus proche. N.B. : dans les cas b) et c), si la faute est commise sur une personne de son équipe, reprise par coup franc indirect sur la ligne de terrain la plus proche de la victime.',
 NULL, 3, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 12'), 'open',
 'Le ballon est en jeu. Une attaque prometteuse se développe au profit de l''équipe A. Un joueur de l''équipe B, près de la ligne de touche, demande un ballon à un ramasseur de balles qui le lui envoie. Le joueur B botte ce second ballon qui arrive près de la surface de réparation de l''équipe A, à proximité du ballon du match. Décisions et explications ?',
 'Le jeu n''est pas arrêté si le second ballon n''interfère pas avec le jeu. Si le ballon interfère : arrêt du jeu, évacuation du second ballon, avertissement au joueur fautif pour comportement antisportif, coup franc direct pour l''équipe A exécuté à l''endroit où le second ballon a interféré.',
 NULL, 2, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 12'), 'open',
 'Ballon en jeu, un joueur de l''équipe B, sur le terrain, jette une pierre sur : a) l''arbitre, sans l''atteindre ; b) un partenaire ; c) un adversaire ; d) un officiel d''équipe dans sa surface technique ; e) un remplaçant A qui avait pénétré sur le terrain, le long de la ligne de touche à plus de 25 m du ballon. Décisions ?',
 'Dans tous les cas : arrêt du jeu, exclusion du joueur fautif pour acte de brutalité, rapport. a) Coup franc direct pour l''équipe A ou penalty selon l''emplacement de la victime. b) Partenaire sur le terrain : coup franc direct pour l''équipe A ou penalty selon l''emplacement ; partenaire hors du terrain : coup franc indirect pour l''équipe A au point de la ligne du terrain le plus proche de la victime. c) Coup franc direct pour l''équipe A ou penalty selon l''emplacement. d) Officiel de l''équipe A : coup franc direct pour l''équipe A sur la ligne de touche au point le plus proche ; officiel de l''équipe B : coup franc indirect pour l''équipe A sur la ligne de touche au point le plus proche. e) Coup franc direct pour l''équipe B à l''endroit où se situait le remplaçant A (il a interféré avec un adversaire) ; l''arbitre lui fait quitter le terrain après l''avoir averti pour entrée sans autorisation.',
 NULL, 3, 'CFA/DA Juillet 2025'),

-- §8 Fautes par "frapper"
((SELECT id FROM public.rq_categories WHERE law_number='Loi 12'), 'open',
 'Un joueur de l''équipe A, sur le terrain, frappe un joueur de l''équipe B également sur le terrain alors que le ballon est en jeu. Décisions ?',
 'Arrêt du jeu. Exclusion du joueur de l''équipe A pour acte de brutalité. Coup franc direct pour l''équipe B à l''endroit où se trouvait la victime si elle est hors de la surface de réparation adverse ; penalty pour l''équipe B si la victime se trouvait dans la surface de réparation adverse. Rapport.',
 NULL, 2, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 12'), 'open',
 'Un joueur de l''équipe A, sur le terrain, frappe un partenaire sur le terrain alors que le ballon est en jeu. Décisions ?',
 'Arrêt du jeu. Exclusion du joueur de l''équipe A pour acte de brutalité. Coup franc direct pour l''équipe B à l''endroit où se trouvait le partenaire s''il est hors ou dans la surface de réparation adverse ; penalty pour l''équipe B si le partenaire se trouvait dans sa propre surface de réparation. Rapport.',
 NULL, 3, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 12'), 'open',
 'Ballon en jeu. Sur le terrain, le joueur n°5A frappe le joueur n°8B situé au-delà du champ de jeu et qui attendait pour rentrer suite à une blessure. Décisions ?',
 'Arrêt du jeu. Exclusion du joueur n°5A pour acte de brutalité. Coup franc direct pour l''équipe B exécuté sur le point de la limite du terrain le plus proche de l''endroit où se trouvait le joueur n°8B ; penalty pour l''équipe B si ledit point se trouve sur une des parties de la ligne de but délimitant la surface de réparation du joueur n°5A. Rapport.',
 NULL, 3, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 12'), 'open',
 'Ballon au pied, le joueur n°7A déborde le long de la ligne de touche. Il centre puis, dans son élan, se retrouve à l''extérieur du terrain. À ce moment-là, le joueur n°2B quitte le terrain pour aller le frapper. Décisions ?',
 'Arrêt du jeu. Exclusion du joueur n°2B pour acte de brutalité. Coup franc direct pour l''équipe A exécuté sur le point de la ligne de touche le plus proche de l''endroit où se trouvait la victime. Rapport.',
 NULL, 2, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 12'), 'open',
 'Ballon en jeu. Le joueur n°11A, emporté par son élan en dehors du terrain, frappe un adversaire se trouvant sur le terrain. Décisions ?',
 'Arrêt du jeu. Exclusion du joueur n°11A pour acte de brutalité. Coup franc direct pour l''équipe B à l''endroit où se trouvait la victime ; penalty pour l''équipe B si la victime se trouvait dans la surface de réparation de l''équipe A. Rapport.',
 NULL, 2, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 12'), 'open',
 'Le joueur n°9A sort du terrain pour aller frapper un adversaire qui avait été emporté dans son élan lors d''une action de jeu. Décisions ?',
 'Arrêt du jeu. Exclusion du joueur n°9A pour acte de brutalité. Coup franc direct pour l''équipe B exécuté sur le point de la limite du terrain le plus proche de la victime ; penalty si ledit point se trouve sur une des parties de la ligne de but délimitant la surface de réparation du fautif. Rapport.',
 NULL, 2, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 12'), 'open',
 'Lors d''une action de jeu, un attaquant n°10A, au duel avec un défenseur n°5B, parvient à centrer et, emportés par leur élan, les deux joueurs se retrouvent derrière la ligne de but. Le défenseur se retourne et frappe l''attaquant. Décisions ?',
 'Sous réserve de l''avantage, arrêt du jeu. Exclusion du défenseur n°5B pour acte de brutalité. Coup franc direct pour l''équipe A exécuté sur le point de la ligne de but le plus proche de la victime ; penalty si ledit point se trouve sur une des parties de la ligne de but délimitant la surface de réparation du fautif. Rapport.',
 NULL, 3, 'CFA/DA Juillet 2025'),

-- §9 Erreur administrative de l'arbitre
((SELECT id FROM public.rq_categories WHERE law_number='Loi 12'), 'open',
 'Un joueur qui a déjà reçu un avertissement en reçoit un second quelques minutes après. L''arbitre ne se rend pas compte que ce joueur était déjà averti et ne l''exclut pas. Quelques minutes après, ce joueur marque un but et l''arbitre s''aperçoit de son erreur. Décisions et explications si ce joueur marque : a) dans le but adverse ; b) dans son propre but ?',
 'Dans les deux cas : exclusion du joueur, consécutive à deux avertissements ; rapport. a) Les officiels étant responsables de l''erreur, l''équipe ayant une personne supplémentaire ne peut être pénalisée par une sanction technique : le but est refusé et le jeu repris par une balle à terre donnée au gardien de but. b) But accordé, coup d''envoi.',
 NULL, 3, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 12'), 'open',
 'À la 75e minute, l''arbitre donne un avertissement à un joueur et fait reprendre immédiatement par un coup franc direct pour l''équipe adverse. Quelques minutes plus tard, un but est marqué par le joueur précédemment averti. Le capitaine de l''équipe qui encaisse fait remarquer que ce joueur avait déjà été averti en 1re période (donc 2e avertissement, exclusion) et conteste le but. Décisions et explications ?',
 'L''arbitre vérifie sa carte d''arbitrage et, au besoin, consulte ses assistants. a) Si les faits sont réels : but refusé ; exclusion immédiate du joueur averti deux fois ; les officiels étant responsables de l''erreur, l''équipe ayant une personne supplémentaire ne peut être pénalisée par une sanction technique ; le but est refusé et le jeu repris par une balle à terre donnée au gardien de but ; rapport. b) Si les faits sont faux : but accordé, coup d''envoi.',
 NULL, 3, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 12'), 'open',
 'Le joueur n°7A reçoit un second avertissement mais, par erreur, l''arbitre ne l''exclut pas. Le jeu reprend et, sur l''action suivante, le joueur n°7A marque un but. Les adversaires protestent. Après consultation de ses assistants, l''arbitre reconnaît son erreur. Décision si le buteur n''est pas le joueur n°7A ?',
 'Que le but soit marqué par la personne supplémentaire ou par un partenaire, la reprise est identique : exclusion du joueur n°7A pour second avertissement. But en faveur de l''équipe B : but accordé, coup d''envoi. But en faveur de l''équipe A : but refusé, balle à terre donnée au gardien de but. Rapport.',
 NULL, 3, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 12'), 'open',
 'En 2e période, le joueur n°8A reçoit un second avertissement mais n''est pas exclu. Peu après, l''entraîneur de A effectue un remplacement : le n°8A sort, le n°12A entre. Le jeu reprend et, sur la 1re action, le n°12A marque. Le coup d''envoi est donné. Ce n''est qu''ensuite que l''arbitre se rend compte de son erreur et arrête le jeu. Décisions et explications ?',
 'Le jeu ayant repris, l''arbitre est dans l''obligation d''accorder le but. Il présente le carton rouge au joueur n°8A sur le banc, qui doit quitter l''aire de jeu. L''équipe A continue obligatoirement à 10 ; le remplaçant n°12A doit quitter le terrain et pourra remplacer ultérieurement un partenaire. Balle à terre donnée à l''équipe en possession du ballon à l''endroit où il se trouvait lors de l''arrêt. Rapport.',
 NULL, 3, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 12'), 'open',
 'À la 50e minute, le joueur n°8B reçoit un second avertissement mais l''arbitre ne l''exclut pas. Il se rend compte de son erreur quand l''équipe marque un but directement sur un coup franc direct contre l''équipe A. Décisions ?',
 'Dans tous les cas : exclusion du joueur n°8B pour second avertissement ; rapport. Si le n°8B est le buteur : but refusé, coup franc direct à refaire. Si le n°8B n''est pas le buteur : but refusé, balle à terre donnée au gardien de but de l''équipe A.',
 NULL, 3, 'CFA/DA Juillet 2025'),

-- §10 Fait d'insulter
((SELECT id FROM public.rq_categories WHERE law_number='Loi 12'), 'open',
 'Un remplaçant, sur son banc de touche, insulte un adversaire sur le terrain alors que le ballon est en jeu. Décisions ?',
 'Sous réserve de l''avantage, arrêt du jeu. Exclusion du remplaçant pour propos injurieux. Coup franc indirect pour l''équipe adverse exécuté sur le point de la ligne de touche le plus proche de l''endroit où se trouvait le remplaçant. Rapport.',
 NULL, 2, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 12'), 'open',
 'Ballon en jeu. Un joueur, sur le terrain, insulte un adversaire, un partenaire ou l''arbitre, présent sur le terrain. Décisions ?',
 'Sous réserve de l''avantage, arrêt du jeu. Exclusion du joueur pour propos injurieux. Coup franc indirect pour l''équipe adverse à l''endroit où se trouvait le joueur fautif, sous réserve de la procédure de la Loi 13. Rapport.',
 NULL, 2, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 12'), 'open',
 'Ballon en jeu. Un joueur blessé, hors du terrain, insulte un adversaire (ou un partenaire, un arbitre) présent sur le terrain, ou l''entraîneur adverse sur son banc. Décisions ?',
 'Sous réserve de l''avantage, arrêt du jeu. Exclusion du joueur pour propos injurieux. Coup franc indirect pour l''équipe adverse exécuté sur le point de la ligne du terrain le plus proche de l''endroit où se trouvait le fautif. Rapport.',
 NULL, 2, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 12'), 'open',
 'Ballon en jeu. Un joueur quitte le terrain et vient insulter le 4e arbitre. Décisions ?',
 'Sous réserve de l''avantage, arrêt du jeu. Exclusion du joueur pour propos injurieux. Coup franc indirect pour l''équipe adverse exécuté sur le point de la ligne du terrain le plus proche de l''endroit où se trouvait le fautif. Rapport.',
 NULL, 2, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 12'), 'open',
 'Un remplaçant, sur son banc de touche, insulte un remplaçant ou un officiel d''équipe assis sur le banc de touche alors que le ballon est en jeu. Décisions ?',
 'Sous réserve de l''avantage, arrêt du jeu. Exclusion du remplaçant pour propos injurieux. Balle à terre, sous réserve de la procédure de la Loi 8. Rapport.',
 NULL, 2, 'CFA/DA Juillet 2025'),

-- §11 Questions diverses
((SELECT id FROM public.rq_categories WHERE law_number='Loi 12'), 'open',
 'Un joueur blessé sort du terrain pour se faire soigner. Doit-il être sanctionné d''un avertissement s''il n''a pas demandé l''autorisation de l''arbitre pour quitter le terrain ?',
 'Un joueur doit informer l''arbitre avant de quitter le terrain, mais cette disposition ne s''applique pas à la sortie d''un joueur blessé. Néanmoins, s''il désire reprendre part au jeu, il ne pourra le faire qu''après accord de l''arbitre.',
 NULL, 1, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 12'), 'open',
 'Un défenseur commet une faute passible d''avertissement. L''arbitre accorde le coup franc mais, avant d''avoir pu notifier l''avertissement, l''attaquant victime joue le coup franc rapidement (conformément à la Loi 13) pour un partenaire qui marque. Décisions et explications ?',
 'But accordé. L''arbitre délivrera la sanction disciplinaire avant le coup d''envoi, sauf si la faute consistait à perturber ou stopper une attaque prometteuse (dans ce cas, le joueur n''est pas averti). Coup d''envoi.',
 'IFAB : si l''équipe adverse joue rapidement le coup franc et se procure une occasion de but manifeste avant que l''arbitre ait pu commencer la signification de la sanction, celle-ci est infligée au prochain arrêt de jeu ; si l''infraction a perturbé/stoppé une attaque prometteuse, le joueur n''est pas averti.',
 3, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 12'), 'open',
 'À la 57e minute, l''attaquant n°11A entre dans la surface de réparation adverse. Le défenseur n°5B le tacle au niveau de l''intersection de la surface de but et de la ligne de but (dans le terrain). L''arbitre fait signe de jouer ou dit « Jouez ! ». Le ballon va directement en touche. L''arbitre va voir l''attaquant et constate des blessures très graves nécessitant une évacuation à l''hôpital. Décisions et explications ?',
 'En disant « Jouez » ou en faisant signe de jouer, l''arbitre a signifié qu''il n''y avait pas de faute du défenseur : le jeu sera repris par la rentrée de touche correspondante, sans sanction disciplinaire. Toutefois, si l''arbitre pense avoir commis une erreur, il peut revenir sur sa décision puisque le jeu n''a pas repris : exclusion du joueur n°5B pour faute grossière, reprise par un penalty pour l''équipe A, rapport.',
 NULL, 3, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 12'), 'open',
 'Un joueur enlève son short après avoir marqué un but. Décisions ?',
 'L''arbitre sanctionne le joueur d''un avertissement pour comportement antisportif. De plus, s''il estime qu''il s''agit d''un geste obscène, le joueur est exclu pour gestes grossiers.',
 NULL, 1, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 12'), 'open',
 'Ballon en jeu. Un remplaçant qui s''échauffait derrière le but de son équipe distrait, par son attitude provocante (verbale ou non), un attaquant adverse. De ce fait, ce dernier perd le ballon au profit d''un défenseur de l''équipe du remplaçant. Décisions ?',
 'Arrêt du jeu. Avertissement au remplaçant pour comportement antisportif. Coup franc indirect pour l''équipe adverse sur la ligne de but à l''endroit le plus proche du remplaçant, sous réserve de la procédure de la Loi 13.',
 NULL, 2, 'CFA/DA Juillet 2025');
