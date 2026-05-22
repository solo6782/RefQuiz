-- ============================================================
-- RefQuiz — Questions Loi 11 (Hors-jeu)
-- Source : CFA/DA — Section "Lois du Jeu" — Questions/Réponses — Juillet 2025
-- Format : questions ouvertes (évaluées par IA), réponses = corrigé officiel.
-- Note : la 2e "L11/§3/Q4" du PDF (joueur n°9A) est en réalité une Q5
--        (doublon de numérotation dans le document officiel) ; elle est conservée.
--        La "L11/§2/Q3 — Réservée" n'est pas insérée.
-- ============================================================

ALTER TABLE public.rq_questions ADD COLUMN IF NOT EXISTS source TEXT;

INSERT INTO public.rq_questions (category_id, type, question, expected_answer, explanation, difficulty, source)
VALUES
-- §1 Position de hors-jeu
((SELECT id FROM public.rq_categories WHERE law_number='Loi 11'), 'open',
 'Quelles sont les parties du corps que l''arbitre assistant doit prendre en compte avant de signaler un joueur en position de hors-jeu ?',
 'N''importe quelle partie de la tête, du tronc ou des jambes de l''attaquant doit être prise en compte. En revanche, les mains et les bras de tous les joueurs, y compris les gardiens de but, ne sont pas pris en compte.',
 'Afin de pouvoir déterminer une position de hors-jeu, la limite supérieure du bras est le bas de l''aisselle.',
 1, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 11'), 'open',
 'Un attaquant, en position de hors-jeu, fait un appel de balle et revient jouer le ballon dans son camp. Décisions ?',
 'Arrêt du jeu. Coup franc indirect pour l''équipe adverse à l''endroit où l''attaquant a touché le ballon dans son propre camp.',
 NULL, 2, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 11'), 'open',
 'Un joueur déborde sur le côté gauche du terrain et centre vers le point de réparation. Il est emporté par son élan et sort du terrain. Au point de réparation, le ballon est repris par un partenaire alors que le gardien de but et un défenseur se trouvent sur la ligne de but. Le ballon est repoussé par le gardien de but vers le joueur qui avait centré et qui revient à ce moment-là sur le terrain. Ce joueur reprend le ballon et marque. Décisions et explications ?',
 'But accordé. Coup d''envoi.',
 'Le joueur qui a centré est considéré comme faisant toujours partie du jeu et il ne peut être hors-jeu du fait de la présence du gardien de but et du défenseur sur la ligne de but.',
 3, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 11'), 'open',
 'Corner pour l''équipe A. Le joueur n°9A se croit en position de hors-jeu et se réfugie dans les filets. Le ballon est repris de la tête par un de ses partenaires qui bat le gardien de but adverse. Décisions et explications en fonction du comportement du joueur n°9A ?',
 'Si le joueur n°9A demeure immobile dans le but au moment où le ballon franchit la ligne de but : but accordé, coup d''envoi. Si le joueur n°9A distrait un adversaire : but refusé, avertissement au joueur n°9A pour comportement antisportif, et coup franc indirect ou direct pour la défense selon la faute, à un point quelconque de la surface de but.',
 'L''IFAB précise (Loi 11 / §4 / Alinéa 4) : un joueur de l''équipe qui attaque demeurant immobile n''est pas sanctionné, sauf s''il commet une infraction de hors-jeu ou une infraction selon la Loi 12.',
 3, 'CFA/DA Juillet 2025'),

-- §2 Position de hors-jeu et ballon touché par un défenseur
((SELECT id FROM public.rq_categories WHERE law_number='Loi 11'), 'open',
 'Le joueur n°8A botte le ballon en direction de son partenaire n°10, en position de hors-jeu sur la gauche de la surface de réparation. Un défenseur fait une tête maîtrisée vers le joueur n°7A situé sur la droite de la surface de réparation. Ce joueur n°7A était lui aussi en position de hors-jeu au moment où le ballon a été botté. Le ballon lui parvient. Décisions et explications ?',
 'L''arbitre doit laisser jouer.',
 'Il s''agit d''un geste technique abouti de la part du défenseur, qui remet ainsi l''attaquant en jeu.',
 3, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 11'), 'open',
 'Le joueur n°6B botte le ballon en direction de son partenaire n°8B, en position de hors-jeu sur la gauche de la surface de réparation. Le ballon rebondit sur un défenseur situé sur la trajectoire et parvient au joueur n°8B. Décisions et explications ?',
 'Arrêt du jeu. Coup franc indirect pour l''équipe A à l''endroit où se trouvait le joueur n°8B au moment de l''infraction.',
 'Le défenseur n''a, à aucun moment, cherché à toucher le ballon : le contact entre ce défenseur et le ballon est totalement fortuit.',
 3, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 11'), 'open',
 'Un défenseur effectue un tacle régulier sur le ballon qui était jusqu''alors en possession d''un attaquant. Le ballon parvient directement à un partenaire de l''attaquant en position de hors-jeu au moment du tacle. Décisions et explications ?',
 'Le partenaire en position de hors-jeu ne doit pas être sanctionné car le ballon lui parvient d''un adversaire qui l''a joué délibérément. L''arbitre laissera le jeu se dérouler.',
 NULL, 2, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 11'), 'open',
 'Le ballon est adressé par l''attaquant n°9A vers son partenaire n°8A en position de hors-jeu. Le ballon est contrôlé par un défenseur. C''est alors que le joueur n°8A vient lui disputer le ballon. Décisions et explications ?',
 'En contrôlant le ballon, le défenseur effectue un geste technique abouti et en prend possession. À partir de ce moment-là : si le joueur n°8A n''a pas interféré sur lui au moment du contrôle, l''arbitre laissera jouer ; si le joueur n°8A a interféré au moment du contrôle (tout proche du défenseur), l''arbitre accordera un coup franc indirect pour l''équipe B sanctionnant le hors-jeu.',
 'Dans les deux cas, il appartient à l''arbitre assistant de maîtriser le "attendre et voir" avant de signaler.',
 3, 'CFA/DA Juillet 2025'),

-- §3 Hors-jeu avec faute commise au préalable
((SELECT id FROM public.rq_categories WHERE law_number='Loi 11'), 'open',
 'Le joueur n°10A est en position de hors-jeu. Un partenaire lui envoie le ballon. La situation est telle que le joueur n°10A va être sanctionné si le ballon lui parvient. Toutefois, pendant la trajectoire du ballon, le joueur n°4B stoppe le ballon des mains ou frappe un adversaire avant que le joueur n°10A soit réellement en situation d''être sanctionné. Décisions et explications ?',
 'Arrêt du jeu. Dans le cas du ballon joué avec les mains : avertissement au joueur n°4B pour comportement antisportif (pas d''exclusion, car le joueur n°10A étant en position de hors-jeu sanctionnable, il n''y a pas d''annihilation d''une occasion nette de but). Dans le cas du joueur frappé : exclusion du joueur n°4B pour acte de brutalité. Coup franc direct pour l''équipe A ou penalty. Rapport en cas d''exclusion.',
 'Aucune infraction à la Loi 11 n''a été commise car la faute du joueur n°4B a eu lieu avant que le joueur n°10A ne joue ou ne touche le ballon ; ce dernier ne peut donc pas être sanctionné d''un hors-jeu.',
 3, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 11'), 'open',
 'Le joueur n°10A est en position de hors-jeu. Un partenaire lui envoie le ballon. Au moment où il touche le ballon, le joueur n°4B le retient par le maillot avant que l''arbitre ne puisse arrêter le jeu pour sanctionner le hors-jeu. Décisions et explications ?',
 'Arrêt du jeu. Coup franc indirect pour l''équipe B à l''endroit où l''attaquant a touché le ballon.',
 'Le joueur n°10A intervient dans le jeu en touchant le ballon ; l''arbitre doit donc sanctionner ce joueur en position de hors-jeu car cette infraction a eu lieu avant celle du joueur n°4B.',
 3, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 11'), 'open',
 'Le joueur n°10A est en position de hors-jeu. Un partenaire lui envoie le ballon. La situation est telle que le joueur n°10A va être sanctionné si le ballon lui parvient. Toutefois, pendant la trajectoire du ballon, le joueur n°4B manie délibérément le ballon qui parvient malgré tout au joueur n°10A. Décisions et explications ?',
 'Laisser jouer.',
 'Aucune infraction à la Loi 11 n''a été commise car un joueur en position de hors-jeu qui reçoit un ballon joué délibérément par un adversaire — y compris de la main ou du bras — n''est pas considéré comme tirant un quelconque avantage de sa position.',
 2, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 11'), 'open',
 'Le gardien de but de l''équipe A dégage le ballon. Ce dernier est dévié de la tête par le joueur n°8A vers son coéquipier n°7A, en position de hors-jeu, qui se dirige seul vers le but adverse. Le défenseur n°5B, en croisant la course de l''attaquant, le fait trébucher par imprudence. Ce dernier tombe au sol. Décisions et explications ?',
 'Dans tous les cas : arrêt du jeu. a) Si le joueur n°7A interfère avec un adversaire ou intervient dans le jeu : coup franc indirect à l''endroit du hors-jeu, sous réserve de la procédure de la Loi 13. b) Dans le cas contraire : aucune sanction disciplinaire au défenseur n°5B (le joueur n°7A étant en position de hors-jeu sanctionnable, il n''y a pas d''annihilation d''une occasion nette de but) ; coup franc direct pour l''équipe A à l''endroit du joueur n°7A ou penalty.',
 NULL, 3, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 11'), 'open',
 'Le joueur n°9A est en position de hors-jeu. Un partenaire lui envoie le ballon. La situation est telle que le joueur n°9A va être sanctionné s''il joue le ballon ou intervient dans le jeu. Il tente tout de même de dévier le ballon en levant une jambe en avant. Ce faisant, il touche un adversaire à la poitrine alors que ce dernier repousse le ballon de la tête. Décisions et explications ?',
 'Arrêt du jeu. Sanction disciplinaire en fonction de la nature de la faute. Coup franc direct pour l''équipe B à l''endroit de la faute, sous réserve de la procédure de la Loi 13. Rapport en cas d''exclusion.',
 'En intervenant dans le jeu, le n°9A a pris une part active à celui-ci, mais il commet une faute relevant de la Loi 12 qui, selon la Loi 11, prévaut.',
 3, 'CFA/DA Juillet 2025'),

-- §4 Hors-jeu signalé et avantage
((SELECT id FROM public.rq_categories WHERE law_number='Loi 11'), 'open',
 'L''arbitre assistant signale un hors-jeu. L''arbitre désire laisser l''avantage. Quelles seront l''attitude et la décision à prendre par l''arbitre ?',
 'L''avantage s''applique également pour le hors-jeu. Lorsque l''arbitre assistant lève son drapeau, l''arbitre signifie l''avantage ; l''arbitre assistant doit alors le baisser et reprendre la position préconisée à la hauteur de l''avant-dernier adversaire. Si l''avantage ne se réalise pas immédiatement ou en quelques secondes, l''arbitre peut revenir sur sa décision et sanctionner le hors-jeu préalable, malgré le fait que l''assistant n''indique plus, à ce moment précis, ce hors-jeu.',
 NULL, 2, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 11'), 'open',
 'Sur un long ballon en profondeur, un attaquant nettement en position de hors-jeu se lance puis se ravise car il se trouve à 30 mètres du gardien de but : il se rend compte de son incapacité à pouvoir jouer le ballon. L''arbitre assistant a levé le drapeau mais l''arbitre le fait baisser. Le ballon, arrivé devant le gardien, fait un faux rebond et finit au fond des filets. Décisions et explications ?',
 'But accordé. Coup d''envoi.',
 'L''arbitre assistant n''aurait pas dû lever le drapeau mais attendre que l''attaquant soit en situation de récupérer le ballon. L''arbitre a eu raison de ne pas sanctionner le hors-jeu car le faux rebond n''est en rien consécutif à une quelconque influence de la position de hors-jeu.',
 3, 'CFA/DA Juillet 2025'),

((SELECT id FROM public.rq_categories WHERE law_number='Loi 11'), 'open',
 'Un ballon est envoyé en profondeur sur un attaquant signalé en position de hors-jeu. L''arbitre, voyant que le gardien a largement le temps et le moyen de se saisir du ballon, crie "Jouez avantage !" et fait baisser le drapeau. Quelles décisions prendre dans chaque cas : a) le gardien, sans contrôle, renvoie le ballon sur l''attaquant qui marque ; b) le ballon rebondit accidentellement sur le gardien et est repris par l''attaquant qui marque ; c) le gardien se loupe complètement dans son renvoi (mauvais geste technique) et le ballon rentre dans le but ; d) le ballon rebondit sur le poteau et est repris par l''attaquant qui marque.',
 'a) But accordé, coup d''envoi. b) But refusé : coup franc indirect consécutif au hors-jeu, au moment où l''attaquant touche le ballon. c) But accordé, coup d''envoi. d) But refusé : l''attaquant a tiré avantage de sa position ; coup franc indirect consécutif au hors-jeu, au moment où l''attaquant touche le ballon.',
 NULL, 3, 'CFA/DA Juillet 2025'),

-- §5 Question diverse
((SELECT id FROM public.rq_categories WHERE law_number='Loi 11'), 'open',
 'Lors d''une action de jeu, le joueur n°8A botte le ballon pour son partenaire n°11A en position de hors-jeu. Le ballon éclate pendant la trajectoire. Décisions et explications ?',
 'Arrêt du jeu. Changement de ballon. Balle à terre, sous réserve de la procédure de la Loi 8.',
 'Un joueur en position de hors-jeu ne peut être sanctionné qu''à partir du moment où il intervient dans le jeu ou interfère avec un adversaire.',
 2, 'CFA/DA Juillet 2025');
