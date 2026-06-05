// Source unique de vérité pour la version et le changelog de RefQuiz.
// Pour publier une nouvelle version : incrémente VERSION et ajoute une
// entrée EN HAUT du tableau CHANGELOG (format aaaa-mm-jj).
// Versionnage sémantique : MAJEUR.MINEUR.CORRECTIF

export const VERSION = '1.2.0'

export const CHANGELOG = [
  {
    version: '1.2.0',
    date: '2026-06-06',
    title: 'Questions liées (parent / suite)',
    changes: [
      'Certaines questions se comprennent uniquement après une autre (ex. « Même situation, mais... »). Elles ne sont désormais plus tirées seules.',
      'Quand une question parent est tirée, sa suite est automatiquement posée juste après, sauf si la parent tombe en dernière position du quiz.',
      'Un petit bandeau « Suite de la question précédente » rappelle le contexte sur la question-suite.',
    ],
  },
  {
    version: '1.1.2',
    date: '2026-06-05',
    title: 'Correction encore plus juste',
    changes: [
      'Le correcteur intelligent passe à un modèle plus capable pour une évaluation plus fine et plus fiable des réponses libres.',
      'Moins de petites approximations dans les feedbacks, meilleure prise en compte des nuances et du vocabulaire arbitral.',
    ],
  },
  {
    version: '1.1.1',
    date: '2026-06-04',
    title: 'Correction plus juste et plus bienveillante',
    changes: [
      'L\'évaluation des réponses libres ne s\'appuie plus que sur la réponse attendue : plus de chiffres ou de règles inventés.',
      'Note plus indulgente : si l\'idée centrale est juste, la note est bonne même si la formulation diffère.',
      'Feedback plus encourageant pour ceux qui apprennent.',
    ],
  },
  {
    version: '1.1.0',
    date: '2026-05-22',
    title: 'Bouton « Passer »',
    changes: [
      'Nouveau bouton « Passer » sur les questions à réponse libre, pour avancer quand on ne connaît pas la réponse.',
      'La question est alors comptée comme fausse et la réponse attendue s\'affiche immédiatement pour apprendre.',
    ],
  },
  {
    version: '1.0.3',
    date: '2026-05-22',
    title: 'Correctif statistiques admin',
    changes: [
      'Correctif : les statistiques des utilisateurs s\'affichent désormais correctement (les quiz terminés n\'apparaissaient pas).',
    ],
  },
  {
    version: '1.0.2',
    date: '2026-05-22',
    title: 'Suivi des arbitres (admin)',
    changes: [
      'L\'administrateur peut consulter la progression de chaque utilisateur : nombre de quiz terminés, score moyen et date du dernier quiz.',
      'Détail dépliable par utilisateur : taux de réussite par loi (points faibles en premier) et historique des quiz.',
    ],
  },
  {
    version: '1.0.1',
    date: '2026-05-22',
    title: 'Correcteur plus robuste',
    changes: [
      'Évaluation des réponses libres plus fiable en cas de forte affluence : jusqu\'à 4 tentatives automatiques.',
      'Si le correcteur reste indisponible, la question est annulée et remplacée par une autre, pour garder le nombre de questions prévu.',
      'Messages d\'attente plus clairs pendant l\'évaluation.',
    ],
  },
  {
    version: '1.0.0',
    date: '2026-05-22',
    title: 'Première version complète',
    changes: [
      'Banque de questions complète : les 17 Lois du Jeu (sources CFA/DA Juillet 2025 et LGEF Pré-JAF).',
      'Évaluation des réponses libres par IA (note, correction et points manquants).',
      'Modes Quiz, Révisions, Stats et Ressources.',
      'Filtres par loi et par niveau de difficulté.',
      'Correctif : rétablissement du chargement des questions après la refonte de la base.',
      'Correctif : fiabilisation de la note des réponses libres (plus de score « NaN »).',
    ],
  },
]
