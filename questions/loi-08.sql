-- ============================================================
-- RefQuiz — Questions Loi 8 (Le coup d'envoi et la reprise du jeu)
-- Source : CFA/DA — Section "Lois du Jeu" — Questions/Réponses — Juillet 2025
-- Format : questions ouvertes (évaluées par IA), réponses = corrigé officiel.
-- ============================================================

ALTER TABLE public.rq_questions ADD COLUMN IF NOT EXISTS source TEXT;

INSERT INTO public.rq_questions (category_id, type, question, expected_answer, explanation, difficulty, source)
VALUES
-- §1 Tirage au sort
((SELECT id FROM public.rq_categories WHERE law_number='Loi 8'), 'open',
 'En raison de conditions climatiques difficiles (terrain gelé), un capitaine demande à l''arbitre de procéder au tirage au sort avant l''heure officielle du coup d''envoi, afin d''adapter l''équipement de son gardien. Est-ce possible ?',
 'La Loi 8 ne précise pas le lieu du tirage au sort. La procédure pourrait, sous certaines conditions mentionnées dans le règlement de la compétition, se dérouler en un autre endroit que le rond central immédiatement avant le coup d''envoi, et donc avoir lieu avant ou après l''échauffement.',
 NULL, 2, 'CFA/DA Juillet 2025'),

-- §2 Balle à terre
((SELECT id FROM public.rq_categories WHERE law_number='Loi 8'), 'open',
 'Lors d''une balle à terre régulière, un joueur positionné à 4 m attend le rebond puis vient disputer le ballon à son adversaire qui ne l''avait pas encore touché. Quelle décision si la balle à terre est donnée à un joueur de champ hors de la surface ? Et si elle est donnée au gardien dans sa surface ? Explications.',
 'Le ballon est en jeu dès qu''il touche le sol. Dans tous les cas, les joueurs situés à au moins 4 mètres du lieu de la remise en jeu peuvent venir disputer le ballon dès qu''il est en jeu. L''arbitre doit donc laisser le jeu se dérouler.',
 NULL, 2, 'CFA/DA Juillet 2025'),

-- §3 Questions diverses
((SELECT id FROM public.rq_categories WHERE law_number='Loi 8'), 'open',
 'L''arbitre donne le signal du coup d''envoi. Qu''entend-on par "signal" : le coup de sifflet ou un autre signal (geste, voix), sachant qu''un but peut désormais être marqué directement sur coup d''envoi ?',
 'Aucune loi ne spécifie la nature du signal, mais il est prescrit aux arbitres que les coups d''envoi et les coups de pied de réparation doivent donner lieu à un signal sonore (sifflet). L''arbitre utilisera en revanche le geste et/ou la voix pour une rentrée de touche, par exemple.',
 NULL, 1, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 8'), 'open',
 'Après 17 secondes de jeu au coup d''envoi de la 2e période, l''arbitre constate que le gardien d''une équipe se présente seulement au bord du terrain pour reprendre sa place dans les buts. Décisions et explications ?',
 'S''agissant du gardien de but (Loi 3 §1) : arrêt du jeu ; coup d''envoi à recommencer.',
 NULL, 2, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 8'), 'open',
 'B marque ; A exécute le coup d''envoi consécutif par le n°10A qui, voyant le gardien avancé, frappe directement dans le but de B et l''arbitre accorde le but. Le capitaine B signale qu''un de ses coéquipiers était resté à 20-30 m dans le camp A au moment du coup d''envoi, et dépose une réserve technique. Décision et explications ?',
 'Lors d''un coup d''envoi, tous les joueurs (sauf le botteur) doivent se trouver dans leur propre moitié de terrain ; en cas d''infraction, le coup d''envoi doit être recommencé. L''arbitre reconnaissant le fait immédiatement : but refusé ; coup d''envoi à recommencer.',
 NULL, 2, 'CFA/DA Juillet 2025')
;
