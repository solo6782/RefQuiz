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

// Tri par paliers : les questions jamais posées d'abord, puis celles vues
// une fois, etc. Mélange aléatoire à l'intérieur de chaque palier pour que
// l'ordre change à chaque session.
export function orderByLeastAsked(questions, counts) {
  const tiers = new Map()
  for (const q of questions) {
    const n = counts[q.id] || 0
    if (!tiers.has(n)) tiers.set(n, [])
    tiers.get(n).push(q)
  }

  const levels = [...tiers.keys()].sort((a, b) => a - b)
  const result = []
  for (const level of levels) {
    result.push(...shuffle(tiers.get(level)))
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
