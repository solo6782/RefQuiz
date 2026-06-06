-- RefQuiz : ré-import verbatim Loi 3 depuis CFA/DA Juillet 2025
-- Source : cfa-da-qr-loi-3-juillet-2025.pdf
-- 55 questions (IDs 16-70)
-- NB : L3/§2/Q2 "Réservée" n'est pas en base (d'où 55 et non 56).
-- À exécuter dans le SQL Editor de Supabase

BEGIN;

-- §1 Identification des joueurs et des remplaçants

UPDATE public.rq_questions SET
  question = 'À la 65ème minute de jeu, le joueur n°8B commet une faute sur un adversaire que l’arbitre sanctionne d’un coup franc direct. Lors de l’arrêt de jeu, l’équipe A demande le remplacement du joueur n°7A. Le remplaçant n°14A, nouvellement entré, effectue la remise en jeu et marque le but directement pour son équipe. C’est alors que le capitaine de l’équipe B demande l’annulation du but et souhaite déposer une réserve technique car l’équipe A n’a inscrit que 13 joueurs sur la feuille de match. L’assistant confirme qu’aucun joueur n’était inscrit en n°14. Décisions et explications ?',
  expected_answer = 'Une telle erreur n’aurait pas dû se produire si un contrôle vigilant avait été effectué au moment du remplacement.
• But refusé.
• Avertissement au capitaine de l’équipe A pour comportement antisportif.
• L’arbitre doit faire quitter le terrain à ce remplaçant victime d’une erreur administrative de ses dirigeants.
• Retour possible du joueur n°7A.
• Mise en œuvre du dépôt de la réserve.
• L’arbitre se rend compte de la situation au moment où le ballon se trouve dans les filets. Ce joueur n°14 ne pourra pas participer à la rencontre quel que soit le type de feuille de match utilisé. Par conséquent, il doit être considéré comme un agent extérieur.
• Coup franc à recommencer.
• Rapport.'
WHERE id = 16;

UPDATE public.rq_questions SET
  question = 'L’équipe A débute la rencontre avec 10 joueurs titulaires et 3 remplaçants. Le capitaine est certain que son 11ème joueur va se présenter au bout de quelques minutes de jeu et préfère attendre son arrivée pour compléter son équipe. À la 15ème minute de jeu, il demande à l’arbitre de faire entrer un de ses remplaçants pour pallier l’absence du titulaire qui ne vient pas. Décisions et explications ?',
  expected_answer = '• L’arbitre permet à l’équipe A de se compléter avec un joueur remplaçant.
• L’équipe jouera donc à 11.
• Elle ne disposera plus que de 2 remplaçants.
• En cas d’arrivée du titulaire attendu, il ne pourra pas participer à la rencontre.'
WHERE id = 17;

UPDATE public.rq_questions SET
  question = 'Lors d’une rencontre du Championnat National 2, l’équipe A se présente avec 11 titulaires et 5 remplaçants. Au cours de l’échauffement, le joueur n°8A se blesse et le capitaine informe l’arbitre que son équipe commencera la rencontre à 10. Il attend un joueur qui doit arriver pour le remplacer. La rencontre débute et, au bout de 10 minutes, le capitaine demande à l’arbitre pour faire entrer un de ses remplaçants afin de pallier l’absence du titulaire qui ne vient pas. Décisions et explications ?',
  expected_answer = '• L’arbitre permet à l’équipe A de se compléter avec un joueur remplaçant.
• L’équipe jouera donc à 11.
• Elle ne disposera plus que de 4 remplaçants et elle pourra toujours effectuer 4 remplacements en cours de rencontre sans diminuer le nombre d’opportunités. L’arbitre décomptera le temps perdu en fin de première période
• En cas d’arrivée du titulaire attendu, il ne pourra pas participer à la rencontre.'
WHERE id = 18;

-- §2 Joueurs exclus avant le coup d’envoi

UPDATE public.rq_questions SET
  question = 'Un titulaire est exclu avant le début de la rencontre. Le remplaçant inscrit est présent mais le capitaine du joueur fautif refuse de le faire pénétrer sur le terrain afin de compléter son équipe. Décisions ?',
  expected_answer = 'Le capitaine est libre d’agir ainsi (la Loi 3 lui donne une possibilité, pas une obligation).
Le remplaçant pourra compléter son équipe à tout moment de la rencontre.'
WHERE id = 19;

UPDATE public.rq_questions SET
  question = 'En ce qui concerne les exclusions de joueurs titulaires avant le coup d''envoi, doit-on considérer qu''à défaut de remplaçant, l''équipe peut se compléter par des joueurs nouveaux jusqu''à la fin du match ou, une fois le coup d’envoi donné, est-il impossible en cas d''absence de remplaçant, de compléter son équipe par des joueurs nouveaux ?',
  expected_answer = 'L''équipe ne peut pas se compléter avec des joueurs nouveaux après le coup d''envoi.
Cette disposition s''applique à toutes les compétitions (Nationales, Ligue ou District).'
WHERE id = 20;

UPDATE public.rq_questions SET
  question = 'En cas d’exclusion de joueurs avant le coup d’envoi, après établissement de la feuille de match, peut-on, jusqu’au coup d’envoi, inscrire des nouveaux joueurs en cas d’absence de remplaçants inscrits ou, une fois la feuille de match établie, n’y a-t-il plus de possibilité d’inscription de nouveaux joueurs ?',
  expected_answer = 'Les dispositions actuelles permettent d’inscrire des remplaçants avant le coup d’envoi.
Ces remplaçants pourront remplacer les joueurs interdits sans possibilité d’inscription de nouveaux remplaçants.'
WHERE id = 21;

UPDATE public.rq_questions SET
  question = 'Lors d’une rencontre fédérale, une équipe inscrit 11 titulaires et 5 remplaçants.
1. Deux remplaçants sont exclus avant le match. Combien de remplacements pourront avoir lieu (1 ou 3 au maximum) ?
2. L’arbitre exclut les 5 remplaçants avant le match. L’équipe commence-t-elle la partie à 9 ou à 11 ?',
  expected_answer = '1. L’équipe pourra effectuer 3 remplacements.
2. L’équipe jouera à 11 mais elle ne pourra pas effectuer de remplacement au cours du match.'
WHERE id = 22;

UPDATE public.rq_questions SET
  question = 'Une équipe est composée de 11 titulaires et 5 remplaçants inscrits avant le coup d’envoi. Après la transmission de la feuille de match et avant le coup d’envoi, l’arbitre exclut 4 titulaires. L’équipe peut-elle débuter le match à 11 ? Combien de remplacements pourront avoir lieu durant le match ?',
  expected_answer = 'L’équipe peut débuter le match à 11.
Elle pourra encore effectuer un remplacement en cours de rencontre.
L’IFAB écrit : "un joueur exclu, après avoir été inscrit comme titulaire sur la feuille de match et avant le coup d''envoi peut être remplacé par un des joueurs inscrits comme remplaçant ; ce dernier ne pourra pas être remplacé, mais le nombre de remplacements autorisés pour l''équipe n''en sera pas réduit pour autant".'
WHERE id = 23;

-- §3 Permutation avec le gardien de but

UPDATE public.rq_questions SET
  question = 'Un défenseur permute avec son gardien de but sans en avertir l’arbitre. Celui-ci s’en aperçoit lorsque le nouveau gardien de but se saisit du ballon des mains au point de penalty. Décisions et explications ?',
  expected_answer = 'La Loi 3 précise que le jeu doit se poursuivre. Au 1er arrêt naturel du jeu, les deux joueurs doivent être avertis pour comportement antisportif.
Dans le cas où l’arbitre arrêterait le jeu par erreur, celui-ci sera repris par une balle à terre donnée au gardien de but.
Si la permutation a eu lieu à la mi-temps ou durant la période entre la fin du match et le début de la prolongation, les deux joueurs ne seront pas avertis.'
WHERE id = 24;

-- §4 Personne supplémentaire sur le terrain (hors agent extérieur)

UPDATE public.rq_questions SET
  question = 'Quelles décisions doit prendre l’arbitre lorsqu’une personne supplémentaire est présente sur le terrain sans interférer avec le jeu ?',
  expected_answer = '• Attendre le 1er arrêt de jeu.
• Avertissement au joueur, remplaçant, remplacé pour avoir pénétré sur le terrain sans autorisation. L’arbitre doit lui faire quitter le terrain.
• Mise en garde s’il s’agit d’un officiel d’équipe ou rapport s’il s’agit d’un joueur exclu ou d’un joueur sous fausse identité (avertissement au capitaine).
• Reprise consécutive à l’arrêt.
• Si, par inadvertance, l’arbitre a arrêté le jeu, celui-ci sera repris par une balle à terre sous réserve de la procédure de la Loi 8.'
WHERE id = 25;

UPDATE public.rq_questions SET
  question = 'Quelles décisions doit prendre l’arbitre quand une personne supplémentaire est présente sur le terrain et interfère avec le jeu (dispute le ballon, crie "laisse !" à un adversaire, …) ?',
  expected_answer = '• Arrêt du jeu.
• Avertissement au joueur, remplaçant, remplacé pour avoir pénétré sur le terrain sans autorisation. L’arbitre doit lui faire quitter le terrain. Si l’interférence empêche un but d’être marqué : exclusion pour avoir annihilé une occasion nette de but.
• Dans tous les cas, exclusion pour avoir interféré avec le jeu/adversaire s’il s’agit d’un officiel d’équipe ou rapport s’il s’agit d’un joueur exclu ou d’un joueur sous fausse identité (avertissement au capitaine).
• Si l’interférence a lieu dans sa surface de réparation : penalty pour l’équipe adverse.
• Si l’interférence a lieu hors de sa surface de réparation : coup franc direct pour l’équipe adverse à l’endroit de l’interférence, sous réserve de la procédure de la Loi 13.'
WHERE id = 26;

UPDATE public.rq_questions SET
  question = 'Quelles décisions doit prendre l’arbitre quand une personne supplémentaire est présente sur le terrain sans interférer avec le jeu et qu’un but est marqué ?',
  expected_answer = 'Dans tous les cas :
• Avertissement au joueur, remplaçant, remplacé pour avoir pénétré sur le terrain sans autorisation. L’arbitre doit lui faire quitter le terrain.
• Mise en garde s’il s’agit d’un officiel d’équipe ou rapport s’il s’agit d’un joueur exclu ou d’un joueur sous fausse identité (avertissement au capitaine).
• But accordé.
• Coup d’envoi.'
WHERE id = 27;

UPDATE public.rq_questions SET
  question = 'Quelles décisions doit prendre l’arbitre quand une personne supplémentaire est présente sur le terrain et interfère avec le jeu avant qu’un but soit marqué ?',
  expected_answer = '• Avertissement au joueur, remplaçant, remplacé pour avoir pénétré sur le terrain sans autorisation. L’arbitre doit lui faire quitter le terrain.
• Exclusion pour avoir interféré avec le jeu s’il s’agit d’un officiel d’équipe ou rapport s’il s’agit d’un joueur exclu ou d’un joueur sous fausse identité (avertissement au capitaine).
• But en faveur de l’équipe régulière : but accordé. Coup d’envoi.
• But en faveur de l’équipe irrégulière : but refusé. Coup franc direct pour l’équipe régulière à l’endroit où se trouvait la personne supplémentaire ou penalty.'
WHERE id = 28;

UPDATE public.rq_questions SET
  question = 'Quelles décisions doit prendre l’arbitre quand une personne supplémentaire est présente sur le terrain et commet une faute ne nécessitant pas une sanction disciplinaire ?',
  expected_answer = '• Arrêt du jeu.
• Avertissement au joueur, remplaçant, remplacé pour avoir pénétré sur le terrain sans autorisation. L’arbitre doit lui faire quitter le terrain.
• Dans tous les cas, exclusion s’il s’agit d’un officiel d’équipe ou rapport s’il s’agit d’un joueur exclu ou d’un joueur sous fausse identité.
• Si l’interférence a lieu dans sa surface de réparation : penalty pour l’équipe adverse.
• Si l’interférence a lieu hors de sa surface de réparation : coup franc direct pour l’équipe adverse à l’endroit de l’interférence, sous réserve de la procédure de la Loi 13.'
WHERE id = 29;

UPDATE public.rq_questions SET
  question = 'Quelles décisions doit prendre l’arbitre quand une personne supplémentaire est présente sur le terrain et commet une faute nécessitant un avertissement ?',
  expected_answer = '• Arrêt du jeu.
• Avertissement au joueur, remplaçant, remplacé pour avoir pénétré sur le terrain sans autorisation puis avertissement pour la faute commise. Exclusion pour avoir reçu deux avertissements au cours du même match.
• Dans tous les cas, exclusion pour avoir interféré avec un adversaire s’il s’agit d’un officiel d’équipe ou rapport s’il s’agit d’un joueur exclu ou joueur sous fausse identité (avertissement au capitaine).
• Si l’interférence a lieu dans sa surface de réparation : penalty pour l’équipe adverse.
• Si l’interférence a lieu hors de sa surface de réparation : coup franc direct pour l’équipe adverse à l’endroit de l’interférence, sous réserve de la procédure de la Loi 13.'
WHERE id = 30;

UPDATE public.rq_questions SET
  question = 'Quelles décisions doit prendre l’arbitre quand une personne supplémentaire est présente sur le terrain et commet une faute nécessitant une exclusion ?',
  expected_answer = '• Arrêt du jeu.
• Exclusion de la personne supplémentaire selon la nature de la faute commise.
• Rapport s’il s’agit d’un joueur exclu ou d’un joueur sous fausse identité (avertissement au capitaine).
• Si l’interférence a lieu dans sa surface de réparation : penalty pour l’équipe adverse.
• Si l’interférence a lieu hors de sa surface de réparation : coup franc direct pour l’équipe adverse à l’endroit où elle a interféré sous réserve de la procédure de la Loi 13.'
WHERE id = 31;

UPDATE public.rq_questions SET
  question = 'Quelles décisions doit prendre l’arbitre quand une personne supplémentaire de l’équipe A est présente sur le terrain et subit une faute d’un joueur de l’équipe B (coup de poing), alors qu’elle n’interfère pas avec le jeu ? Explications ?',
  expected_answer = '• Sous réserve de l’avantage, arrêt du jeu.
• Exclusion du joueur fautif de l’équipe B pour acte de brutalité.
• Avertissement au joueur, remplaçant, remplacé pour avoir pénétré sur le terrain sans autorisation. L’arbitre doit lui faire quitter le terrain.
• Exclusion pour avoir interféré avec un adversaire s’il s’agit d’un officiel d’équipe ou rapport si c’est un joueur exclu de l’équipe A ou un joueur sous fausse identité (avertissement au capitaine).
• L’IFAB a répondu à une question posée par la Section Lois du Jeu sur cette situation précise. Elle considère qu’une personne supplémentaire qui subit une faute interfère de fait avec un adversaire, en conséquence :
   o Si la victime se trouve dans la surface de réparation de l’équipe A : penalty pour l’équipe B.
   o Si la victime se trouve hors de la surface de réparation de l’équipe A : coup franc direct pour l’équipe B à l’endroit de la faute sous réserve de la procédure de la Loi 13.'
WHERE id = 32;

UPDATE public.rq_questions SET
  question = 'Quelles décisions doit prendre l’arbitre quand une personne supplémentaire de l’équipe A est présente sur le terrain et subit une faute d’un joueur de l’équipe B, alors qu’elle interfère avec le jeu ?',
  expected_answer = '• Arrêt du jeu.
• Sanction disciplinaire éventuelle à l’encontre du joueur fautif de l’équipe B.
• Avertissement au joueur, remplaçant, remplacé pour avoir pénétré sur le terrain sans autorisation. L’arbitre doit lui faire quitter le terrain.
• Si l’interférence empêche un but d’être marqué : exclusion pour avoir annihilé une occasion nette de but.
• Dans tous les cas, exclusion pour avoir interféré avec le jeu s’il s’agit d’un officiel d’équipe ou rapport s’il s’agit d’un joueur sous fausse identité (avertissement au capitaine) ou d’un joueur exclu de l’équipe B.
• Si l’interférence a lieu dans la surface de réparation de l’équipe A : penalty pour l’équipe B.
• Si l’interférence a lieu hors de la surface de réparation de l’équipe A : coup franc direct pour l’équipe B à l’endroit de l’interférence sous réserve de la procédure de la Loi 13.'
WHERE id = 33;

UPDATE public.rq_questions SET
  question = 'Un remplaçant de l’équipe A, entré à l’insu de l’arbitre depuis quelques instants, effectue une rentrée de touche et marque directement dans son propre but. Décisions et explications ?',
  expected_answer = '• But refusé.
• Avertissement au remplaçant pour avoir pénétré sur le terrain sans autorisation. L’arbitre doit lui faire quitter le terrain.
• Le remplaçant a interféré dans le jeu.
• Coup franc direct pour l’équipe B sur la ligne de touche.'
WHERE id = 34;

UPDATE public.rq_questions SET
  question = 'L’équipe A marque un but directement dans le but adverse sur une rentrée de touche. C’est à cet instant que l’arbitre constate que l’équipe B joue à 12. Décisions ?',
  expected_answer = '• But refusé.
• Avertissement au joueur supplémentaire pour avoir pénétré sur le terrain sans autorisation.
• Rapport dans le cas d’un joueur sous fausse identité (avertissement au capitaine) ou d’un joueur exclu de l’équipe B.
• L’arbitre doit lui faire quitter le terrain.
• Le joueur supplémentaire n’a pas interféré dans le jeu : coup de pied de but pour l’équipe B.
• Le joueur a interféré dans le jeu : coup franc direct pour l’équipe A à l’endroit où se trouvait la personne supplémentaire ou penalty.'
WHERE id = 35;

UPDATE public.rq_questions SET
  question = 'Corner. Le but est marqué directement par un joueur supplémentaire présent sur le terrain depuis quelques instants. Décisions ?',
  expected_answer = '• But refusé.
• Avertissement au joueur supplémentaire pour avoir pénétré sur le terrain sans autorisation.
• Rapport s’il s’agit d’un joueur sous fausse identité (avertissement au capitaine).
• L’arbitre doit lui faire quitter le terrain.
• Coup franc direct pour l’équipe adverse dans la surface de coin.'
WHERE id = 36;

UPDATE public.rq_questions SET
  question = 'À la suite d’une blessure de son joueur n°9, le capitaine de l’équipe A demande son remplacement. L’arbitre donne son accord alors que le ballon vient de sortir en corner en faveur de l’équipe A. Le joueur n°9A sort du terrain et le remplaçant n°12A, qui s’est présenté à l’arbitre assistant au niveau de la ligne médiane, ne pénètre pas sur le terrain. Il longe la ligne de touche et va exécuter le corner. Il marque le but directement. Décisions et explications ?',
  expected_answer = '• But refusé.
• La procédure de remplacement n’a pas été effectuée correctement.
• Le remplaçant doit pénétrer sur le terrain au niveau de la ligne médiane. Par conséquent le remplaçant ne sera pas averti.
• Corner à retirer.'
WHERE id = 37;

UPDATE public.rq_questions SET
  question = 'L’arbitre accorde un penalty à la suite d’une faute du joueur n°4 et exclut ce dernier. Alors que ce joueur n’a pas encore quitté le terrain pour regagner les vestiaires, l’arbitre donne le signal d’exécution et le penalty est marqué. Décisions et explications ?',
  expected_answer = '• But accordé.
• Bien que les arbitres n’aient pas fait suffisamment preuve de vigilance pour s’assurer de la sortie définitive du joueur, celui-ci n’a eu aucune interférence sur l’exécution du penalty.
• Les arbitres s’assureront que le joueur exclu a définitivement quitté le terrain avant la reprise du jeu.
• Coup d’envoi.'
WHERE id = 38;

UPDATE public.rq_questions SET
  question = 'Avant une remise en jeu (coup de pied de but, corner, rentrée de touche) l’arbitre s’aperçoit qu’un joueur supplémentaire est présent sur le terrain. Décisions ?',
  expected_answer = '• L’arbitre doit retarder la reprise du jeu.
• Avertissement au joueur, remplaçant, remplacé pour avoir pénétré sur le terrain sans autorisation.
• Rapport s’il s’agit d’un joueur sous fausse identité (avertissement au capitaine) ou d’un joueur exclu de l’équipe en infraction.
• L’arbitre doit lui faire quitter le terrain.
• Reprise consécutive à l’arrêt.
• Si le joueur supplémentaire a interféré avant la sortie du ballon : coup franc direct pour l’équipe adverse à l’endroit de l’interférence, sous réserve de la procédure de la Loi 13, ou penalty.'
WHERE id = 39;

UPDATE public.rq_questions SET
  question = 'Une équipe joue à 12 depuis plusieurs minutes. Un joueur, de l’équipe attaquante B, commet une faute sur un joueur de l’équipe A. Un coup franc est accordé pour l’équipe A dans sa surface de réparation. Le ballon est joué mais n’est pas encore sorti de la surface de réparation lorsque l’arbitre s’aperçoit qu’une équipe joue avec un joueur supplémentaire. Il interrompt immédiatement le jeu. Décisions et explications :
a) Le joueur supplémentaire appartient à l’équipe défendante A ?
b) Le joueur supplémentaire appartient à l’équipe attaquante B ?',
  expected_answer = '• Le ballon est en jeu dès qu’il a été botté et a clairement bougé.
• Avertissement au joueur, remplaçant, remplacé pour avoir pénétré sur le terrain sans autorisation.
• Rapport s’il s’agit d’un joueur sous fausse identité (avertissement au capitaine) ou d’un joueur exclu de l’équipe en infraction.
• L’arbitre doit lui faire quitter le terrain.
• Le joueur supplémentaire n’a pas interféré avec le jeu : l’arbitre ne doit pas arrêter le jeu et attendre 1er arrêt de jeu naturel. Balle à terre donnée au gardien de but.
• Le joueur supplémentaire a interféré avec le jeu :
   o Joueur de l’équipe A : coup franc direct pour l’équipe attaquante B à l’endroit de l’interférence ou penalty si celle-ci a lieu dans la surface de réparation de l’équipe A.
   o Joueur de l’équipe B : coup franc direct pour l’équipe défendante A à l’endroit de l’interférence.'
WHERE id = 40;

UPDATE public.rq_questions SET
  question = 'Un joueur dispute une rencontre depuis 10 minutes. À la 11ème minute, son équipe marque un but. Avant le coup d’envoi, l’arbitre constate que sa fausse identité ne lui permet plus de poursuivre le match. Décisions et explications ?',
  expected_answer = 'Considérant le paragraphe 7 de la Loi 3 - "toute personne non inscrite sur la feuille de match en tant que joueur, remplaçant, officiel d’équipe est considérée comme agent extérieur ".
L’arbitre doit donc traiter la situation de cette personne comme un "joueur".
• Il lui fera ensuite quitter le terrain. Rapport.
• Avertissement au capitaine pour comportement antisportif.
• L’équipe fautive ne pourra pas se compléter à 11 et jouera donc à 10 au nom de l’équité sportive.
• Le but est marqué par ce joueur sous fausse identité :
   o Contre son camp : but accordé. Coup d’envoi.
   o Contre l’équipe adverse : but refusé. Coup franc direct pour l’équipe adverse à l’endroit où il a touché le ballon, sous réserve de la procédure de la Loi 13, ou penalty.
• Le but est marqué par un partenaire :
   o Contre son camp : but accordé. Coup d’envoi.
   o Contre l’équipe adverse : but refusé. Coup franc direct pour l’équipe adverse à l’endroit où se trouvait le joueur sous fausse identité, sous réserve de la procédure de la Loi 13, ou penalty.'
WHERE id = 41;

-- §5 Personne supplémentaire : agent extérieur présent sur le terrain

UPDATE public.rq_questions SET
  question = 'Quelles décisions doit prendre l’arbitre quand un agent extérieur est présent sur le terrain sans interférer avec le jeu ?',
  expected_answer = '• Attendre le 1er arrêt de jeu.
• Faire quitter le terrain à cet agent extérieur.
• Reprise consécutive à l’arrêt.'
WHERE id = 42;

UPDATE public.rq_questions SET
  question = 'Quelles décisions doit prendre l’arbitre quand un agent extérieur est présent sur le terrain et interfère avec le jeu ?',
  expected_answer = '• Arrêt du jeu.
• Faire quitter le terrain à cet agent extérieur.
• Quel que soit l’endroit de l’interférence : balle à terre sous réserve de la procédure de la Loi 8.
• Rapport.'
WHERE id = 43;

UPDATE public.rq_questions SET
  question = 'Le ballon va pénétrer dans le but. Quelles décisions doit prendre l’arbitre quand un agent extérieur est présent sur le terrain à ce moment-là ?',
  expected_answer = '• Dans tous les cas, l’arbitre doit faire quitter le terrain à cet agent extérieur.
• L’agent extérieur touche ou non le ballon sans interférer avec les joueurs en défense :
   o But accordé. Coup d’envoi.
• L’agent extérieur touche ou non le ballon et interfère avec les joueurs en défense :
   o Arrêt du jeu. Balle à terre donnée au gardien de but.
• Rapport.'
WHERE id = 44;

UPDATE public.rq_questions SET
  question = 'Quelles décisions doit prendre l’arbitre quand un agent extérieur est présent sur le terrain et est impliqué sur une faute ?',
  expected_answer = '• Arrêt du jeu.
L’arbitre doit faire quitter le terrain à cet agent extérieur.
• L’agent extérieur commet la faute ou est victime : balle à terre sous réserve de la procédure de la Loi 8.
• Dans le cas où la faute est commise par un joueur : sanction disciplinaire à l’encontre du joueur fautif selon la nature de la faute.
• Rapport.'
WHERE id = 45;

UPDATE public.rq_questions SET
  question = 'Ballon en jeu, le joueur n°4 de l’équipe A juste devant sa surface de réparation envoie un très long ballon vers la ligne de touche à 30 mètres des buts de l’équipe adverse. Un attaquant de l’équipe A et un défenseur de l’équipe B sont à la lutte pour la conquête du ballon. À ce moment, un spectateur pénètre sur le terrain et coupe la course des deux joueurs sans les toucher. L’arbitre arrête le jeu alors que le ballon est toujours en jeu et qu’il n’a pas été touché ni par les deux joueurs, ni par le spectateur. Décisions ?',
  expected_answer = '• L’arbitre doit faire quitter le terrain au spectateur.
• Balle à terre donnée à un joueur de l’équipe A à l’endroit où le jeu a été arrêté.
• Rapport.'
WHERE id = 46;

-- §6 Permutation avant le match ou à la mi-temps

UPDATE public.rq_questions SET
  question = 'Un remplaçant de l’équipe A prend la place d’un joueur titulaire au cours de la 1ère période. Durant la mi-temps, le titulaire remplacé décide de reprendre sa place dans l’équipe. La 2ème période commence sans que les joueurs adverses, ni les arbitres, ne s’aperçoivent de la supercherie. Celle-ci est découverte lorsqu’un but vient d’être marqué en faveur de l’équipe A. Décisions ?',
  expected_answer = '• But refusé.
• Avertissement au remplacé de l’équipe A pour comportement antisportif. L’arbitre doit lui faire quitter le terrain.
• Avertissement au capitaine A pour comportement antisportif (supercherie en cours de mi-temps et responsabilité quant au comportement de son équipe).
• Autorisation au joueur A ayant remplacé le titulaire en 1ère période de reprendre sa place avec avertissement pour comportement antisportif.
• Coup franc direct pour l’équipe B à l’endroit où se trouvait la personne supplémentaire.'
WHERE id = 47;

UPDATE public.rq_questions SET
  question = 'Un remplaçant A prend la place d’un joueur titulaire au cours de la 1ère période. Durant le repos, le titulaire remplacé décide de reprendre sa place dans l’équipe. La 2ème période commence sans que les joueurs adverses, ni les arbitres, ne s’aperçoivent de la supercherie. Celle-ci est découverte lorsque le fautif vient de marquer un but contre son camp.',
  expected_answer = '• But accordé.
• Avertissement au remplacé de l’équipe A pour comportement antisportif. L’arbitre doit lui faire quitter le terrain.
• Avertissement au capitaine A pour comportement antisportif (supercherie en cours de mi-temps et responsabilité quant au comportement de son équipe).
• Autorisation au joueur A ayant remplacé le titulaire en 1ère période de reprendre sa place avec avertissement pour comportement antisportif.
• Coup d’envoi.'
WHERE id = 48;

UPDATE public.rq_questions SET
  question = 'Au cours de la 1ère période, le joueur n°9B est régulièrement remplacé par le remplaçant n°12B. Vingt minutes après le début de la seconde période, ce joueur n°9B procède à l''exécution d''un corner et marque le but directement. Le capitaine de l''équipe A fait remarquer à l''arbitre que le joueur n°9B qui vient de marquer le but sur corner a été remplacé au cours de la 1ère période. Personne ne s''est aperçu de la supercherie. Décisions ?',
  expected_answer = '• But refusé.
• Avertissement au remplacé n°9B pour comportement antisportif. L’arbitre doit lui faire quitter le terrain.
• Avertissement au capitaine pour comportement antisportif (supercherie en cours de mi-temps et responsabilité quant au comportement de son équipe).
• Autorisation au joueur n°12B de reprendre sa place avec avertissement pour comportement antisportif.
• Coup franc direct pour l’équipe A dans la surface de coin.'
WHERE id = 49;

UPDATE public.rq_questions SET
  question = 'Un remplaçant est permuté avec un joueur, avant le coup d’envoi du match, sans que l’arbitre soit informé. Décisions et explications dans les cas suivants :
a) Le jeu était arrêté car le ballon était sorti du terrain.
b) L’arbitre vient de siffler un coup franc direct ou un penalty pour l’équipe du remplaçant.
c) L’arbitre vient de siffler un coup franc direct ou un penalty contre l’équipe du remplaçant.
d) Le remplaçant vient de marquer un but pour son équipe.
e) Le remplaçant vient de marquer un but contre son camp.
f) L’arbitre arrête le jeu pour ce motif.',
  expected_answer = 'Le joueur inscrit comme remplaçant est autorisé à continuer le match. Aucune sanction disciplinaire ne sera prise à son encontre. Le joueur inscrit comme titulaire devient remplaçant et le nombre de remplacements de son équipe n’est pas réduit. La feuille de match sera réactualisée.
Dans les cas a) à e) : reprise consécutive à l’arrêt.
f) L’arbitre ne doit pas arrêter le jeu pour un tel motif. S’il l’a fait, la reprise est balle à terre sous réserve de la procédure de la Loi 8.
Rapport.'
WHERE id = 50;

UPDATE public.rq_questions SET
  question = 'Avant le début du match, l’entraîneur de l’équipe B vient voir l’arbitre pour lui signifier que son capitaine n°4, qui avait précédemment signé la feuille de match, s’est blessé à l’échauffement. L’arbitre en prend note. Sur la feuille de match, le n°12 prend alors le n°4. Le n°4 devient le n°12.
a. La feuille de match doit-elle être à nouveau validée par le nouveau capitaine ?
b. La rencontre débute et au bout de 2 minutes de jeu, l’arbitre assistant se rend compte que le joueur n°12 n’a pas changé de maillot alors qu’il aurait dû porter le maillot n°4. Doit-on considérer qu''il s''agit d''une erreur de l''arbitre et au 1er arrêt de jeu faire changer le maillot, sans sanction disciplinaire, ou considérer qu''il s''agit d''une faute de l''équipe et avertir le joueur concerné ?',
  expected_answer = 'a) Les deux capitaines de chaque équipe doivent être informés et la feuille de match à nouveau validée.
b) L’arbitre aurait dû être plus vigilant avant le coup d’envoi et aurait dû vérifier que le changement de maillot a bien été effectué.
Au 1er arrêt de jeu, il sera procédé au changement de maillot, les joueurs concernés ne recevront pas d’avertissement.'
WHERE id = 51;

-- §7 Joueur pénétrant sur le terrain sans autorisation

UPDATE public.rq_questions SET
  question = 'Ballon en jeu, un retardataire pénètre sur le terrain sans autorisation pour compléter son équipe. L’arbitre s’en aperçoit immédiatement et siffle avant qu’il n’interfère dans le jeu. Décisions et explications ?',
  expected_answer = '• L’arbitre vérifie l’identité de ce joueur.
• Cette personne est considérée comme "joueur" si elle a été identifiée. Elle sera inscrite sur la feuille de match informatisée à la mi-temps ou à la fin de la rencontre.
• Avertissement au joueur pour être entré sans autorisation.
• Coup franc indirect pour l’équipe adverse à l’endroit où se trouvait le ballon, sous réserve de la procédure de la Loi 13.
• L’arbitre ne devait pas arrêter le jeu. Il ne devait le faire qu’au moment où ce joueur entrave le jeu.
• Si cette personne n’est pas identifiée : l’arbitre lui fera quitter le terrain. Balle à terre, sous réserve de la procédure de la Loi 8.
• Rapport.'
WHERE id = 52;

UPDATE public.rq_questions SET
  question = 'Le joueur n°6A ne veut pas tenir la place et, après palabres, quitte le terrain à l''insu de l''arbitre. Le capitaine B fait constater à l''arbitre que l''équipe A n''est plus qu''à 10 joueurs, le n°6 étant parti. 15 minutes après, l''équipe A marque un but contre l’équipe adverse et le capitaine B et l''arbitre se rendent compte que le buteur est le joueur n°6A qui n’a pas été remplacé et qui est entré à nouveau à l''insu de tous. Décisions et explications ?',
  expected_answer = '• But refusé.
• Au moment où le capitaine B fait constater à l’arbitre que le joueur n°6A a quitté le terrain, l’arbitre doit informer le capitaine de l’équipe A que le joueur n°6A est sanctionné d’un avertissement pour avoir quitté le terrain sans autorisation.
• Second avertissement au joueur n°6A pour être revenu sans autorisation. Ce joueur est donc exclu pour avoir reçu deux avertissements au cours du même match.
• Coup franc direct pour l’équipe B à l’endroit où se trouvait le joueur n°6A (personne supplémentaire) quand il a marqué, sous réserve de la procédure de la Loi 13.
• Rapport.'
WHERE id = 53;

UPDATE public.rq_questions SET
  question = 'Le joueur n°8A a reçu l’autorisation de quitter le terrain pour se faire soigner. Tandis qu’il reçoit les soins hors du terrain, il tend la jambe à l’intérieur de celui-ci et provoque la chute d’un adversaire qui, ballon au pied, débordait sur le côté du terrain. Décisions et explications ?',
  expected_answer = '• Arrêt du jeu.
• Avertissement au joueur n°8A pour être entré sur le terrain sans autorisation.
• Si l’arbitre estime que le joueur a perturbé ou stoppé une attaque prometteuse : avertissement au joueur n°8A pour comportement antisportif.
• L’arbitre prend soin de clairement indiquer qu’il sanctionne, sur le plan disciplinaire, successivement les deux fautes en montrant du bras les deux endroits où elles ont été commises et lèvera le carton jaune deux fois. Ensuite, l’arbitre présentera le carton indiquant l’exclusion.
• Coup franc direct pour l’équipe B à l’endroit de la faute ou penalty si celle-ci a lieu dans la surface de réparation de l’équipe A.
• Rapport en cas d’exclusion.'
WHERE id = 54;

UPDATE public.rq_questions SET
  question = 'Dans le cas où un joueur entre sur le terrain pour détourner le ballon des mains dans ses propres buts, comment faut-il agir quand il s’agit :
1. D’un joueur momentanément hors du terrain pour se faire soigner.
2. D’un joueur refoulé pour remettre son équipement en conformité.',
  expected_answer = 'Dans les deux cas :
• But accordé.
• Avertissement pour être entré sans autorisation puis second avertissement pour comportement antisportif pour la faute commise. Exclusion du joueur pour avoir reçu deux avertissements.
• Coup d’envoi.
• Rapport.'
WHERE id = 55;

UPDATE public.rq_questions SET
  question = 'Un joueur est sorti momentanément du terrain pour se faire soigner derrière sa propre ligne de but. Il attend l’autorisation de l’arbitre pour reprendre part au jeu près du poteau de son but. Un adversaire déclenche une frappe violente des 25 mètres. Ce joueur, voyant que son gardien est battu et que le ballon va entrer dans le but, rentre sur le terrain et dévie le ballon du pied sur la barre transversale. Celui-ci revient en jeu, touche le gardien de but et pénètre dans le but. Décisions et explications ?',
  expected_answer = '• But accordé.
• Avertissement au joueur fautif pour être entré sans autorisation.
• L’arbitre ayant laissé l’avantage et le but ayant été marqué, le joueur ne peut pas être exclu pour avoir annihilé une occasion nette de but.
• Coup d’envoi.'
WHERE id = 56;

UPDATE public.rq_questions SET
  question = 'Le joueur n°7A est sorti sur blessure pour se faire soigner. Durant une pause prévue pour se désaltérer et sans que les arbitres soient avertis, l’équipe A fait entrer son remplaçant n°12A à la place du joueur n°7A, toujours en train de se faire soigner derrière le but. L’arbitre fait reprendre le jeu et, alors que le ballon est en jeu, le remplaçant n°12A s’apprête à le disputer à un adversaire dans le rond central. L’arbitre s’aperçoit alors de sa présence. Décisions ?',
  expected_answer = '• Arrêt du jeu.
• Avertissement au remplaçant n°12A pour avoir pénétré sur le terrain sans autorisation. L’arbitre lui demande de quitter le terrain.
• Coup franc direct pour l’équipe B à l’endroit où se trouvait le remplaçant n°12A lors de l’arrêt de jeu.'
WHERE id = 57;

UPDATE public.rq_questions SET
  question = 'Un joueur retardataire pénètre sur le terrain sans mettre son équipe en surnombre. L’arbitre l’identifie. Décisions si :
a) Ce joueur frappe un adversaire.
b) Ce joueur marque un but (contre son camp ou dans le but adverse).',
  expected_answer = 'a) Arrêt du jeu.
Exclusion du joueur pour acte de brutalité. Rapport.
• Coup franc direct pour l’équipe adverse à l’endroit de la faute ou penalty.
b) But marqué contre l’équipe adverse :
• But refusé.
• Avertissement pour être entré sans autorisation.
• Coup franc direct pour l’équipe adverse à l’endroit où se trouvait le joueur retardataire, sous réserve de la procédure de la Loi 13, ou penalty.
But marqué contre son camp sur une action de jeu :
• But accordé.
• Avertissement pour être entré sans autorisation.
• Coup d’envoi.
But marqué directement contre son camp sur une remise en jeu :
• But refusé.
• Avertissement pour être entré sans autorisation.
• Coup franc direct pour l’équipe adverse à l’endroit de l’exécution de la remise en jeu ou penalty.'
WHERE id = 58;

UPDATE public.rq_questions SET
  question = 'Une équipe a inscrit 10 joueurs sur la feuille de match, le 11ème joueur prévu n’étant pas arrivé avant le coup d’envoi. L’arbitre ne s’aperçoit de sa présence qu’au moment où il vient de marquer un but pour son équipe. Cela fait un moment qu’il participe au jeu. La vérification d’identité étant positive. Décisions ?',
  expected_answer = '• But refusé.
• Le joueur peut compléter son équipe.
• Avertissement à ce joueur pour avoir pénétré sur le terrain sans autorisation.
• Coup franc direct pour l’équipe adverse à l’endroit où se trouvait le joueur retardataire, sous réserve de la procédure de la Loi 13.'
WHERE id = 59;

UPDATE public.rq_questions SET
  question = 'Une équipe a inscrit 10 joueurs sur la feuille de match, le 11ème joueur n’étant pas arrivé avant le coup d’envoi. L’arbitre ne s’aperçoit de sa présence qu’au moment où il vient de commettre une faute. Cela fait un moment qu’il participe au jeu. La vérification d’identité est positive. Décisions ?',
  expected_answer = '• Arrêt du jeu.
• Le joueur peut compléter son équipe.
• Avertissement pour être entré sans autorisation. Si la faute nécessite également une sanction disciplinaire, second avertissement ou exclusion directe.
• Si l’interférence empêche un but d’être marqué : exclusion pour avoir annihilé une occasion nette de but.
• Coup franc direct pour l’équipe adverse à l’endroit où se trouvait le joueur retardataire sous réserve de la procédure de la Loi 13, ou penalty.
• Rapport en cas d’exclusion.'
WHERE id = 60;

UPDATE public.rq_questions SET
  question = 'L’équipe A bénéficie d’un penalty à la suite d’une faute du libéro n°5B à l’égard du joueur n°7A. Avant l’exécution du tir, le capitaine de l’équipe B fait remarquer à l’arbitre que le joueur n°7A, sorti se faire soigner, était rentré sur l’aire de jeu à son insu et jouait depuis quelques minutes. Décisions et explications ?',
  expected_answer = '• Retarder la reprise du jeu.
• Avertissement au joueur n°7A pour être revenu sur le terrain sans autorisation.
• L’infraction est constituée au moment où l’arbitre s’en aperçoit. À partir de ce moment-là, l’arbitre ne peut pas reprendre le jeu par l’exécution de la remise en jeu consécutive à la faute commise sur le joueur n°7A. Il est dans l’obligation de sanctionner la présence non autorisée de ce joueur.
• Coup franc direct pour l’équipe B à l’endroit où se trouvait le joueur n°7A, sous réserve de la procédure de la Loi 13.'
WHERE id = 61;

UPDATE public.rq_questions SET
  question = 'Le ballon sort en ligne de touche. Un joueur n°10 de l’équipe A, sorti se faire soigner, ramasse le ballon et exécute rapidement la rentrée de touche sans que l’arbitre n’ait eu le temps d’intervenir. L’arbitre s’en rend compte une fois le ballon en jeu et il siffle. Décisions et explications ?',
  expected_answer = '• Avertissement au joueur n°10A pour comportement antisportif.
Rentrée de touche irrégulière :
• Rentrée de touche à refaire par l’équipe B.
Rentrée de touche régulière :
• Coup franc direct pour l’équipe B sur la ligne de touche au point le plus proche de l’endroit où le joueur n°10A effectué la rentrée de touche.
Si l’arbitre se rend compte de la situation, il doit retarder la reprise du jeu afin qu’un autre joueur de l’équipe A effectue la rentrée de touche. Dans cette question, n’ayant pu intervenir immédiatement, l’arbitre a eu raison d’arrêter le jeu dès le constat. En effectuant régulièrement la rentrée de touche, le joueur de l’équipe A interféré avec jeu.'
WHERE id = 62;

-- §8 Remplacements

UPDATE public.rq_questions SET
  question = 'Ballon en jeu. Au moment où le gardien de but de l’équipe A le capte, le capitaine de l’équipe B demande à l’arbitre pour procéder à un remplacement.
Au lieu de dire au capitaine de l’équipe B d’attendre un arrêt de jeu pour procéder au remplacement, l’arbitre fait signe au gardien de l’équipe A, qui tient le ballon en mains, d’arrêter de jouer. Ce qu’il fait en gardant le ballon en mains.
Le fait que l’arbitre n’ait pas arrêté le jeu par un coup de sifflet, mais simplement par un geste indiquant au gardien d’arrêter de jouer, est-ce à considérer comme un arrêt de jeu ?',
  expected_answer = 'Pour que le jeu soit arrêté, lorsque le ballon est en jeu, il faut qu’il y ait un coup de sifflet de l’arbitre. N’ayant pas attendu que le ballon soit sorti naturellement du jeu, le fait d’autoriser le remplacement, après avoir demandé au gardien de but d’attendre, doit être considéré comme un arrêt de jeu.
En tout état de cause, la reprise du jeu ne peut être qu’une balle à terre donnée au gardien de but.'
WHERE id = 63;

UPDATE public.rq_questions SET
  question = 'Au cours d’un arrêt de jeu, l’équipe A demande à remplacer son joueur n°10A par le remplaçant n°12A. Avant de franchir les limites du terrain, ce joueur n°10A frappe un adversaire. Le remplacement doit-il s’effectuer ?',
  expected_answer = 'Non, car le joueur n°10A est exclu et ne peut être remplacé.'
WHERE id = 64;

UPDATE public.rq_questions SET
  question = 'Un joueur, mécontent contre son équipe, quitte le terrain sans autorisation. Que doit faire l’arbitre si son entraîneur demande ensuite son remplacement ?',
  expected_answer = 'L’arbitre autorisera le remplacement et indiquera au capitaine de cette équipe que le joueur sorti est sanctionné d’un avertissement pour avoir quitté le terrain sans autorisation.
N.B. : sous réserve qu’il ne s’agisse pas d’un second avertissement auquel cas il ne pourrait pas être remplacé.'
WHERE id = 65;

UPDATE public.rq_questions SET
  question = 'À la 43ème minute, l’équipe A demande un remplacement. Le joueur n°8A quitte le terrain. L’arbitre fait signe au remplaçant n°13A de rentrer. À cet instant, à la suite de propos déplacés du joueur n°3B, qui se situe sur le terrain à 50cm de la ligne de touche, le remplaçant n°13A, qui a les pieds à l’extérieur du terrain :
1. Donne un coup de poing au joueur n°3B.
2. Crache au visage du joueur n°3B.
Décisions et explications ?',
  expected_answer = '1. Le remplaçant n°13A a pénétré sur le terrain puisque son bras a franchi la ligne de touche. Le remplacement est donc effectif.
• L’équipe A jouera à 10.
2. Le remplaçant n’a pas pénétré sur le terrain, le remplacement n’est pas effectif. L’équipe A pourra faire entrer un autre remplaçant à la place du joueur n°8A si elle en dispose encore.
• L’équipe A jouera à 11.
Dans les deux cas :
• Avertissement au joueur n°3B pour comportement antisportif.
• Exclusion du remplaçant n°13A pour acte de brutalité (ou crachat sur un adversaire).
• Reprise consécutive à l’arrêt.
• Rapport.'
WHERE id = 66;

-- §9 Questions diverses

UPDATE public.rq_questions SET
  question = 'Un joueur blessé sur le terrain fait-il partie du jeu ?',
  expected_answer = 'Un joueur blessé présent sur le terrain fait partie du jeu tant que l’arbitre n’a pas arrêté le jeu. À ce titre, s’il est en position d’avant-dernier adversaire, il couvre une potentielle situation de hors-jeu.'
WHERE id = 67;

UPDATE public.rq_questions SET
  question = 'Une équipe joue à 8, sans possibilité de remplacement. Un joueur de cette équipe est blessé et doit sortir pour se faire soigner. Combien de temps l’arbitre doit-il attendre avant de reprendre le jeu ?',
  expected_answer = 'Le match est interrompu jusqu’au moment où le joueur recevant des soins revienne sur le terrain de jeu.
La durée d’interruption est à l’appréciation de l’arbitre. Celui-ci doit prendre en compte les circonstances de la blessure, la gravité de celle-ci, le score à ce moment du match et la durée restante de la rencontre.'
WHERE id = 68;

UPDATE public.rq_questions SET
  question = 'Une équipe joue à 8. Un de ses joueurs se blesse et sort du terrain pendant l’action de jeu alors qu’un de ses partenaires file au but. Le but est marqué. Décisions et explications ?',
  expected_answer = '• But accordé.
• Le coup d’envoi ne peut être donné que si le joueur blessé peut revenir ou alors s’il est remplacé par un remplaçant toujours disponible.
• Coup d’envoi.
• À défaut, le match est arrêté.'
WHERE id = 69;

UPDATE public.rq_questions SET
  question = 'L’équipe A joue à 8. Un joueur de cette équipe quitte volontairement le terrain alors que l’équipe B est à l’attaque Décisions ?',
  expected_answer = '• L’arbitre doit laisser le jeu se dérouler.
• Au 1er arrêt de jeu, il avertit le joueur fautif pour comportement antisportif (tricherie).
• L’arbitre place le capitaine face à ses responsabilités et le match est arrêté si son partenaire ne revient pas.
• Rapport en cas d’arrêt de la rencontre.'
WHERE id = 70;

SELECT COUNT(*) AS questions_loi_3_updated
FROM public.rq_questions q JOIN public.rq_categories c ON c.id = q.category_id
WHERE c.law_number = 'Loi 3';

COMMIT;
