import { supabase } from './supabase'

// Mélange uniforme (Fisher-Yates). Remplace sort(() => Math.random() - 0.5)
// qui produit une distribution biaisée.
export function shuffle(arr) {
  const a = [...arr]
  for (let i = a.length - 1; i > 0; i--) {
    const j = Math.floor(Math.random() * (i + 1))
    ;[a[i], a[j]] = [a[j], a[i]]
  }
  return a
}

// Compteurs de l'utilisateur : { [question_id]: times_asked }
export async function fetchAskedCounts() {
  const { data, error } = await supabase
    .from('rq_question_stats')
    .select('question_id, times_asked')

  if (error || !data) return {}

  const counts = {}
  for (const row of data) {
    counts[row.question_id] = row.times_asked
  }
  return counts
}

// Nombre minimum de réponses sur une loi pour que son taux soit jugé fiable.
// En dessous, la loi garde un poids neutre (un 0/2 ne doit pas la propulser en tête).
const MIN_SAMPLE = 10

// Écart maximum de tirage entre la loi la plus faible et la plus solide.
const MAX_WEIGHT = 2

// Taux de réussite par loi pour CET utilisateur : { 'Loi 12': { total, correct } }
export async function fetchLawAccuracy(userId) {
  if (!userId) return {}

  const { data: sessions } = await supabase
    .from('rq_quiz_sessions')
    .select('id')
    .eq('user_id', userId)

  if (!sessions || sessions.length === 0) return {}

  const { data, error } = await supabase
    .from('rq_quiz_answers')
    .select('is_correct, questions:rq_questions!inner(categories:rq_categories!inner(law_number))')
    .in('session_id', sessions.map(s => s.id))

  if (error || !data) return {}

  const byLaw = {}
  for (const a of data) {
    const law = a.questions?.categories?.law_number
    if (!law) continue
    if (!byLaw[law]) byLaw[law] = { total: 0, correct: 0 }
    byLaw[law].total += 1
    if (a.is_correct) byLaw[law].correct += 1
  }
  return byLaw
}

// Poids de tirage par loi : 1 (maîtrisée) à MAX_WEIGHT (la plus faible).
export function buildLawWeights(lawAccuracy) {
  const weights = {}
  for (const [law, v] of Object.entries(lawAccuracy || {})) {
    if (!v.total || v.total < MIN_SAMPLE) continue
    const pct = v.correct / v.total
    weights[law] = 1 + (MAX_WEIGHT - 1) * (1 - pct)
  }
  return weights
}

// Mélange pondéré (Efraimidis-Spirakis) : reste aléatoire, mais les éléments
// de poids élevé remontent statistiquement.
function weightedShuffle(arr, weightOf) {
  return [...arr]
    .map(q => ({ q, key: Math.pow(Math.random(), 1 / Math.max(weightOf(q), 0.01)) }))
    .sort((a, b) => b.key - a.key)
    .map(x => x.q)
}

// Tri par paliers : les questions jamais posées d'abord, puis celles vues
// une fois, etc. À l'intérieur de chaque palier, tirage pondéré par loi
// (les lois les moins réussies sortent un peu plus souvent).
export function orderByLeastAsked(questions, counts, lawWeights) {
  const weightOf = (q) => {
    const law = q.categories?.law_number
    return (lawWeights && law && lawWeights[law]) || 1
  }

  const tiers = new Map()
  for (const q of questions) {
    const n = counts[q.id] || 0
    if (!tiers.has(n)) tiers.set(n, [])
    tiers.get(n).push(q)
  }

  const levels = [...tiers.keys()].sort((a, b) => a - b)
  const result = []
  for (const level of levels) {
    result.push(...weightedShuffle(tiers.get(level), weightOf))
  }
  return result
}

// Incrémente le compteur des questions réellement posées.
// Volontairement silencieux : un échec ne doit jamais bloquer le quiz.
export async function bumpAskedCounts(questionIds) {
  if (!questionIds || questionIds.length === 0) return
  try {
    await supabase.rpc('rq_bump_question_stats', { p_question_ids: questionIds })
  } catch (e) {
    console.error('bumpAskedCounts:', e)
  }
}
