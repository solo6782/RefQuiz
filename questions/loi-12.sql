-- ============================================================
-- RefQuiz — Questions Loi 12 (Fautes et comportement antisportif)
-- Source : LGEF — CRA Section Filière Fédérale — Questionnaire
--          Pré-JAF n°2 maison (Corrigé)
-- Format : questions ouvertes (évaluées par IA), réponses = corrigé officiel.
-- NB : déduplication — seules les 4 questions « motifs » (absentes du
--      corrigé CFA/DA) sont conservées. Les 16 mises en situation
--      faisaient doublon avec loi-12-cfa.sql et ont été retirées.
-- ============================================================

ALTER TABLE public.rq_questions ADD COLUMN IF NOT EXISTS source TEXT;

INSERT INTO public.rq_questions (category_id, type, question, expected_answer, explanation, difficulty, source)
VALUES
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
