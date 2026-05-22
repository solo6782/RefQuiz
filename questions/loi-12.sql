-- ============================================================
-- RefQuiz — Questions Loi 12 (Fautes et comportement antisportif)
-- Source : LGEF — CRA Section Filière Fédérale — Questionnaire
--          Pré-JAF n°2 maison (Corrigé)
-- Format : questions ouvertes (évaluées par IA), réponses = corrigé officiel.
-- category_id résolu par sous-requête (robuste quel que soit l'ID).
-- ============================================================

-- Colonne source (versioning annuel des questions) — créée si absente
ALTER TABLE public.rq_questions ADD COLUMN IF NOT EXISTS source TEXT;

INSERT INTO public.rq_questions (category_id, type, question, expected_answer, explanation, difficulty, source)
VALUES
((SELECT id FROM public.rq_categories WHERE law_number='Loi 12'), 'open',
 'Coup franc en faveur de l''équipe A à l''intérieur de la surface de réparation adverse. Le joueur lève le ballon du pied à 1,50 m et, d''un coup de tête, lobe le mur au moment où un défenseur B frappe un adversaire A situé à l''extérieur du terrain et qui recevait des soins. Le ballon termine au fond des filets. Décisions ?',
 'But refusé. Exclusion du défenseur B pour acte de brutalité. Coup franc direct pour A exécuté sur le point de la limite du terrain le plus proche de l''endroit où se trouvait la victime. Penalty pour A si ce point se trouve sur une partie de la ligne de but délimitant la surface de réparation de B. Rapport.',
 NULL, 2, 'LGEF Pré-JAF n°2 — Q1'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 12'), 'open',
 'Quelle attitude doit adopter l''arbitre lorsqu''un gardien de but est chargé par un adversaire ?',
 'Le gardien est un joueur comme un autre : il peut être chargé loyalement. En revanche, un adversaire ne peut pas lui disputer le ballon lorsqu''il l''a en mains, c''est-à-dire quand : le ballon entre en contact avec ses mains ou ses bras (sauf rebond ou ballon repoussé) ; il fait rebondir le ballon au sol ou le lance en l''air ; il tient le ballon entre les mains ou entre la main et une surface (sol, son corps) ; il tient le ballon sur la main ouverte.',
 NULL, 2, 'LGEF Pré-JAF n°2 — Q2'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 12'), 'open',
 'Un défenseur récupère le ballon du pied, jongle et, de la tête, le passe à son gardien de but. Décisions et explications ?',
 'Arrêt du jeu. Avertissement au défenseur pour comportement antisportif. Coup franc indirect contre le défenseur sous réserve de la procédure de la Loi 13.',
 'Un joueur qui initie délibérément une stratégie pour que le ballon soit passé à son gardien de la tête, poitrine, genou, etc. dans le but de contourner la Loi est pénalisé, que le gardien touche le ballon des mains ou non.',
 2, 'LGEF Pré-JAF n°2 — Q3'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 12'), 'open',
 'À 25 m du but adverse, le n°10A élimine ses adversaires et se dirige vers le gardien B. Celui-ci sort de sa surface et ceinture l''attaquant sans l''arrêter. L''arbitre laisse l''avantage. L''attaquant arrive à 5 m du but et va marquer. Revenu en catastrophe, le n°4B dégage le ballon en ligne de but par un tacle totalement incontrôlé et très dangereux, sans toucher l''attaquant. Décisions et explications ?',
 'Arrêt du jeu. Exclusion du n°4B pour faute grossière (un tel tacle constitue une mise en danger de l''intégrité physique de l''adversaire). Penalty pour l''équipe A. Rapport.',
 NULL, 3, 'LGEF Pré-JAF n°2 — Q4'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 12'), 'open',
 'L''attaquant n°9, à 50 cm de la ligne de but adverse, n''a plus qu''à pousser le ballon de la tête dans le but (but immanquable). À hauteur de son visage, un défenseur effectue un ciseau dangereux sans le toucher mais qui l''empêche de marquer. Décisions et explications ?',
 'Arrêt du jeu. Exclusion du défenseur pour avoir empêché un but en commettant une faute passible d''un coup franc. Coup franc indirect pour l''équipe attaquante, sur la ligne de la surface de but parallèle à la ligne de but, à l''endroit le plus proche de la faute. Rapport.',
 'La reprise technique n''étant pas un penalty, la sanction disciplinaire ne peut pas être ramenée à un avertissement.',
 3, 'LGEF Pré-JAF n°2 — Q5'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 12'), 'open',
 'Le n°9A tire en direction du but de B. Le n°5B, revenu en catastrophe sur la ligne de but, s''accroche à la barre transversale et dévie le ballon hors du but. Décisions ?',
 'Arrêt du jeu. Exclusion du n°5B pour avoir empêché un but en commettant une faute passible d''un coup franc. S''il a dévié le ballon de la main ou du bras : penalty pour A. S''il l''a dévié d''une autre partie du corps : coup franc indirect sur la ligne des 5,50 m parallèle à la ligne de but au point le plus proche de la faute. Rapport.',
 NULL, 3, 'LGEF Pré-JAF n°2 — Q6'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 12'), 'open',
 'Ballon en jeu, un joueur présent sur le terrain crache sur un adversaire situé en dehors du terrain car il a été emporté par son élan. Décisions ?',
 'Sous réserve de l''avantage, arrêt du jeu. Exclusion du fautif pour crachat. Coup franc direct pour l''équipe adverse exécuté sur le point de la ligne de but le plus proche de l''endroit où se trouvait la victime. Penalty si ce point se trouve sur une partie de la ligne de but délimitant la surface de réparation du fautif. Rapport.',
 NULL, 2, 'LGEF Pré-JAF n°2 — Q7'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 12'), 'open',
 'Un joueur de l''équipe A, sur le terrain, frappe un partenaire sur le terrain, ballon en jeu. Décisions ?',
 'Arrêt du jeu. Exclusion du joueur de A pour acte de brutalité. Coup franc direct pour B à l''endroit où se trouvait le partenaire si celui-ci est hors ou dans la surface de réparation adverse. Penalty pour B si le partenaire se trouvait dans sa propre surface de réparation. Rapport.',
 NULL, 2, 'LGEF Pré-JAF n°2 — Q8'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 12'), 'open',
 'À la 50e minute, le n°8B reçoit un second avertissement mais l''arbitre ne l''exclut pas. Il s''en aperçoit quand l''équipe marque directement sur un coup franc direct contre A. Décisions ?',
 'Dans tous les cas, exclusion du n°8B pour avoir reçu un second avertissement. Rapport. Si le n°8B est le buteur : but refusé, coup franc direct à refaire. Si le n°8B n''est pas le buteur : but refusé, balle à terre donnée au gardien de but de l''équipe A.',
 NULL, 3, 'LGEF Pré-JAF n°2 — Q9'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 12'), 'open',
 'Un remplaçant, sur son banc de touche, insulte un remplaçant ou un officiel d''équipe assis sur le banc, ballon en jeu. Décisions ?',
 'Sous réserve de l''avantage, arrêt du jeu. Exclusion du remplaçant pour avoir tenu des propos injurieux. Balle à terre, sous réserve de la procédure de la Loi 8. Rapport.',
 NULL, 2, 'LGEF Pré-JAF n°2 — Q10'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 12'), 'open',
 'Ballon en jeu. Le n°5A crache sur un partenaire. Au même moment, dans sa surface de réparation, le n°10B frappe le n°7A situé lui aussi sur le terrain ; ce dernier se met à saigner. Décisions ?',
 'Arrêt du jeu. Exclusion du n°5A pour avoir craché sur un partenaire. Exclusion du n°10B pour acte de brutalité. Le joueur blessé doit quitter le terrain pour faire stopper le saignement. Si le n°7A est dans la surface de B : penalty pour A. S''il est hors de la surface de B : coup franc direct pour A à l''endroit où se trouvait le n°7A, sous réserve de la procédure de la Loi 13. Rapport.',
 NULL, 3, 'LGEF Pré-JAF n°2 — Q11'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 12'), 'open',
 'À l''aide du ballon qu''il tient en mains, un gardien repousse violemment, hors de sa surface, un attaquant qui s''est déplacé latéralement pour lui faire intentionnellement obstruction et l''empêcher de dégager. Décisions ?',
 'Arrêt du jeu. Avertissement à l''attaquant pour comportement antisportif. Exclusion du gardien pour acte de brutalité. Nomination d''un nouveau gardien. Obstacle sans contact : coup franc indirect pour l''équipe défendante à l''endroit de la faute. Obstacle avec contact : coup franc direct pour l''équipe défendante à l''endroit de la faute. Rapport.',
 NULL, 3, 'LGEF Pré-JAF n°2 — Q12'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 12'), 'open',
 'Un attaquant est victime à 30 m du but d''une faute d''un 1er défenseur, passible d''exclusion (hors faute grossière/brutalité), car il l''empêche d''avoir une possibilité de marquer ; il en réchappe et l''arbitre laisse l''avantage. Dans la surface, un 2e défenseur commet sur lui une faute identique passible d''exclusion. Décisions si : a) il réchappe et marque ; b) il perd le ballon mais un partenaire marque ; c) il perd le ballon et la défense se dégage ?',
 'Cas a) et b) : but accordé, avertissement aux deux défenseurs pour comportement antisportif, coup d''envoi. Cas c) : arrêt du jeu, avertissement au 1er défenseur pour comportement antisportif ; avertissement au 2e pour comportement antisportif, OU exclusion pour avoir annihilé une occasion nette de but si la faute consiste à tenir, tirer ou pousser, ou si le joueur fautif n''a pas essayé (ni n''était en mesure) de jouer le ballon.',
 NULL, 3, 'LGEF Pré-JAF n°2 — Q13'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 12'), 'open',
 'Un gardien, ballon en jeu, jette le ballon qu''il tient en mains sur un attaquant adverse situé en dehors du terrain, derrière la ligne de but. Décisions ?',
 'Dans tous les cas : exclusion du gardien pour acte de brutalité, nomination d''un nouveau gardien, rapport. Si le joueur est situé dans le but : but accordé, coup d''envoi. Si le joueur est derrière la ligne de but hors des buts : arrêt du jeu, coup franc direct pour l''équipe adverse sur le point de la ligne de but le plus proche de la victime ; penalty si ce point se trouve sur une partie de la ligne de but délimitant la surface de réparation du gardien fautif.',
 NULL, 3, 'LGEF Pré-JAF n°2 — Q14'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 12'), 'open',
 'Ballon en jeu, un joueur de B sur le terrain jette une pierre sur : a) l''arbitre sans l''atteindre ; b) un partenaire ; c) un adversaire ; d) un officiel d''équipe dans sa surface technique ; e) un remplaçant A entré sur le terrain le long de la touche à plus de 25 m du ballon. Décisions ?',
 'Dans tous les cas : arrêt du jeu, exclusion du fautif pour acte de brutalité, rapport. a) Coup franc direct pour A ou penalty selon l''emplacement de la victime. b) Partenaire sur le terrain : CFD pour A ou penalty selon l''emplacement ; partenaire hors du terrain : CFI pour A sur le point de la ligne du terrain le plus proche. c) CFD pour A ou penalty selon l''emplacement. d) Officiel de A : CFD pour A sur la ligne de touche au point le plus proche ; officiel de B : CFI pour A sur la ligne de touche au point le plus proche. e) CFD pour B à l''endroit où se situait le remplaçant A (il a interféré avec un adversaire) ; l''arbitre le fait quitter le terrain après l''avoir averti pour entrée sans autorisation.',
 NULL, 3, 'LGEF Pré-JAF n°2 — Q15'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 12'), 'open',
 'À la 75e minute, l''arbitre avertit un joueur et fait reprendre par un coup franc direct pour l''adverse. Plus tard, un but est marqué par le joueur averti. Le capitaine adverse signale que ce joueur avait déjà été averti en 1re période (donc 2e avertissement, exclusion) et conteste le but. Décisions et explications ?',
 'L''arbitre vérifie sa carte d''arbitrage et, au besoin, consulte ses assistants. A. Si les faits sont réels : but refusé ; exclusion immédiate du joueur averti deux fois ; les officiels étant responsables de l''erreur, l''équipe ayant une personne supplémentaire ne peut être pénalisée par une sanction technique ; le but est refusé et le jeu repris par une balle à terre donnée au gardien de but ; rapport. B. Si les faits sont faux : but accordé, coup d''envoi.',
 NULL, 3, 'LGEF Pré-JAF n°2 — Q16'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 12'), 'open',
 'Donnez les motifs d''avertissement.',
 'Un joueur doit être averti s''il : retarde la reprise du jeu ; manifeste sa désapprobation en paroles ou en actes ; pénètre/revient délibérément sur le terrain, ou le quitte délibérément sans autorisation ; ne respecte pas la distance réglementaire (balle à terre, corner, coup franc, rentrée de touche) ; enfreint de manière répétée les Lois du Jeu ; se rend coupable de comportement antisportif ; pénètre dans la zone de visionnage ; fait un usage excessif du signal d''analyse vidéo (écran).',
 NULL, 2, 'LGEF Pré-JAF n°2 — Q17'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 12'), 'open',
 'Donnez les motifs d''exclusion.',
 'Un joueur, remplaçant ou joueur remplacé doit être exclu s''il : empêche un but ou annihile une occasion de but manifeste par une main délibérée (sauf gardien dans sa surface) ; empêche un but ou annihile une occasion manifeste par une main non délibérée hors de sa surface ; empêche un but ou annihile une occasion manifeste à un adversaire se dirigeant vers le but en commettant une faute passible d''un coup franc ; commet une faute grossière ; crache sur/vers ou mord quelqu''un ; commet un acte de brutalité ; tient des propos blessants, injurieux et/ou grossiers ou agit ainsi ; reçoit un second avertissement ; pénètre dans la salle de visionnage.',
 NULL, 2, 'LGEF Pré-JAF n°2 — Q18'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 12'), 'open',
 'Donnez les motifs de coup franc direct.',
 'Un coup franc direct est accordé si un joueur, de manière imprudente, inconsidérée ou violente : charge un adversaire ; saute sur un adversaire ; donne ou essaie de donner un coup de pied ; bouscule un adversaire ; frappe ou essaie de frapper (y compris coup de boule) ; tacle ou dispute le ballon ; fait ou essaie de faire trébucher ; commet une main (sauf gardien dans sa surface) ; tient ou retient un adversaire ; fait obstacle avec contact ; mord ou crache sur/vers quelqu''un de la liste ou un arbitre ; lance/botte un objet sur le ballon, un adversaire ou un arbitre, ou touche le ballon avec un objet tenu en main.',
 NULL, 2, 'LGEF Pré-JAF n°2 — Q19'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 12'), 'open',
 'Donnez les motifs de coup franc indirect.',
 'Un coup franc indirect est accordé lorsqu''un joueur : joue de manière dangereuse ; fait obstacle sans contact ; manifeste sa désapprobation par des propos/actes blessants, injurieux ou grossiers (infractions orales) ; empêche le gardien de lâcher le ballon, ou joue/essaie de jouer le ballon pendant que le gardien le lâche ; initie délibérément une stratégie pour passer le ballon à son gardien afin de contourner la Loi ; commet d''autres infractions entraînant un arrêt du jeu pour avertir/exclure. Pour le gardien dans sa surface : touche le ballon de la main après l''avoir lâché sans qu''un autre joueur ne l''ait touché ; touche de la main une passe bottée délibérément par un coéquipier ; touche de la main directement une rentrée de touche d''un coéquipier.',
 NULL, 2, 'LGEF Pré-JAF n°2 — Q20')
;
