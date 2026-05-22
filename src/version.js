// Source unique de vérité pour la version et le changelog de RefQuiz.
// Pour publier une nouvelle version : incrémente VERSION et ajoute une
// entrée EN HAUT du tableau CHANGELOG (format aaaa-mm-jj).
// Versionnage sémantique : MAJEUR.MINEUR.CORRECTIF

export const VERSION = '1.0.1'

export const CHANGELOG = [
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
