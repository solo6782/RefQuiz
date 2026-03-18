import { useState, useEffect } from 'react'
import { TrendingUp, Target, Award, Calendar } from 'lucide-react'
import { supabase } from '../lib/supabase'
import { useApp } from '../App'

export default function Dashboard() {
  const { profile, categories } = useApp()
  const [sessions, setSessions] = useState([])
  const [categoryStats, setCategoryStats] = useState([])
  const [loading, setLoading] = useState(true)

  useEffect(() => {
    loadData()
  }, [])

  async function loadData() {
    // Charger toutes les sessions complètes
    const { data: sessionsData } = await supabase
      .from('quiz_sessions')
      .select('*, categories(name, law_number)')
      .eq('user_id', profile.id)
      .eq('completed', true)
      .order('completed_at', { ascending: false })

    setSessions(sessionsData || [])

    // Charger les réponses par catégorie
    const { data: answersData } = await supabase
      .from('quiz_answers')
      .select(`
        is_correct,
        ai_score,
        questions!inner(category_id, categories(name, law_number))
      `)
      .in('session_id', (sessionsData || []).map(s => s.id))

    // Agréger par catégorie
    const catMap = {}
    ;(answersData || []).forEach(a => {
      const catId = a.questions?.category_id
      const catName = a.questions?.categories?.name || 'Sans catégorie'
      const catLaw = a.questions?.categories?.law_number || ''
      if (!catMap[catId]) {
        catMap[catId] = { name: catName, law: catLaw, correct: 0, total: 0, scoreSum: 0 }
      }
      catMap[catId].total++
      if (a.is_correct) catMap[catId].correct++
      catMap[catId].scoreSum += Number(a.ai_score || (a.is_correct ? 1 : 0))
    })

    const catStats = Object.values(catMap)
      .map(c => ({ ...c, pct: Math.round((c.scoreSum / c.total) * 100) }))
      .sort((a, b) => a.law?.localeCompare(b.law, undefined, { numeric: true }))

    setCategoryStats(catStats)
    setLoading(false)
  }

  if (loading) {
    return (
      <div className="page">
        <div className="loading-container">
          <div className="loading-dots"><span /><span /><span /></div>
        </div>
      </div>
    )
  }

  const totalSessions = sessions.length
  const avgScore = totalSessions > 0
    ? Math.round(sessions.reduce((s, sess) => s + Number(sess.score), 0) / totalSessions)
    : 0
  const totalAnswers = categoryStats.reduce((s, c) => s + c.total, 0)
  const bestCategory = categoryStats.length > 0
    ? categoryStats.reduce((best, c) => c.pct > best.pct ? c : best)
    : null
  const worstCategory = categoryStats.length > 0
    ? categoryStats.reduce((worst, c) => c.pct < worst.pct ? c : worst)
    : null

  // Derniers 10 scores pour le mini graphe
  const recentScores = sessions.slice(0, 10).reverse()

  return (
    <div className="page">
      <h1 style={{ marginBottom: 8 }}>Ma Progression</h1>
      <p className="subtitle" style={{ marginBottom: 24 }}>Analyse tes résultats et identifie tes axes de travail.</p>

      {totalSessions === 0 ? (
        <div className="empty-state">
          <div className="empty-icon">📊</div>
          <p>Aucune donnée pour l'instant. Fais ton premier quiz !</p>
        </div>
      ) : (
        <>
          {/* Stats globales */}
          <div className="stats-grid">
            <div className="stat-card">
              <div className="stat-label">Quiz complétés</div>
              <div className="stat-value">{totalSessions}</div>
            </div>
            <div className="stat-card">
              <div className="stat-label">Score moyen</div>
              <div className="stat-value" style={{ color: avgScore >= 70 ? 'var(--accent-green)' : avgScore >= 50 ? 'var(--accent-yellow)' : 'var(--accent-red)' }}>
                {avgScore}%
              </div>
            </div>
            <div className="stat-card">
              <div className="stat-label">Questions répondues</div>
              <div className="stat-value">{totalAnswers}</div>
            </div>
            <div className="stat-card">
              <div className="stat-label">Meilleur score</div>
              <div className="stat-value" style={{ color: 'var(--accent-green)' }}>
                {Math.round(Math.max(...sessions.map(s => Number(s.score))))}%
              </div>
            </div>
          </div>

          {/* Mini graphe des scores récents */}
          {recentScores.length > 1 && (
            <div className="dashboard-section">
              <h2>Évolution récente</h2>
              <div className="card" style={{ padding: 20 }}>
                <div style={{ display: 'flex', alignItems: 'flex-end', gap: 6, height: 120 }}>
                  {recentScores.map((s, i) => {
                    const score = Number(s.score)
                    const h = Math.max(8, (score / 100) * 110)
                    const color = score >= 70 ? 'var(--accent-green)' : score >= 50 ? 'var(--accent-yellow)' : 'var(--accent-red)'
                    return (
                      <div key={i} style={{ flex: 1, display: 'flex', flexDirection: 'column', alignItems: 'center', gap: 4 }}>
                        <span style={{ fontSize: '0.7rem', color: 'var(--text-muted)', fontFamily: "'Space Mono', monospace" }}>
                          {Math.round(score)}%
                        </span>
                        <div style={{
                          width: '100%', maxWidth: 40, height: h, background: color,
                          borderRadius: '4px 4px 0 0', opacity: 0.8,
                          transition: 'height 0.4s ease',
                        }} />
                      </div>
                    )
                  })}
                </div>
              </div>
            </div>
          )}

          {/* Stats par catégorie */}
          {categoryStats.length > 0 && (
            <div className="dashboard-section">
              <h2>Par catégorie</h2>
              <div className="category-stats">
                {categoryStats.map((cat, i) => {
                  const color = cat.pct >= 70 ? 'var(--accent-green)' : cat.pct >= 50 ? 'var(--accent-yellow)' : 'var(--accent-red)'
                  return (
                    <div key={i} className="category-row">
                      <span className="badge badge-blue" style={{ minWidth: 55, justifyContent: 'center' }}>{cat.law}</span>
                      <span className="category-name">{cat.name}</span>
                      <span style={{ fontSize: '0.75rem', color: 'var(--text-muted)' }}>{cat.total} Q</span>
                      <div className="category-bar-container">
                        <div className="category-bar-fill" style={{ width: `${cat.pct}%`, background: color }} />
                      </div>
                      <span className="category-pct" style={{ color }}>{cat.pct}%</span>
                    </div>
                  )
                })}
              </div>
            </div>
          )}

          {/* Points forts / faibles */}
          {bestCategory && worstCategory && bestCategory.name !== worstCategory.name && (
            <div className="dashboard-section">
              <h2>Analyse</h2>
              <div style={{ display: 'grid', gridTemplateColumns: '1fr 1fr', gap: 12 }}>
                <div className="card" style={{ borderLeftColor: 'var(--accent-green)', borderLeftWidth: 3 }}>
                  <div style={{ fontSize: '0.8rem', color: 'var(--text-muted)', marginBottom: 4 }}>🎯 Point fort</div>
                  <div style={{ fontWeight: 600 }}>{bestCategory.law} — {bestCategory.name}</div>
                  <div style={{ color: 'var(--accent-green)', fontFamily: "'Space Mono', monospace", marginTop: 4 }}>{bestCategory.pct}%</div>
                </div>
                <div className="card" style={{ borderLeftColor: 'var(--accent-red)', borderLeftWidth: 3 }}>
                  <div style={{ fontSize: '0.8rem', color: 'var(--text-muted)', marginBottom: 4 }}>📚 À travailler</div>
                  <div style={{ fontWeight: 600 }}>{worstCategory.law} — {worstCategory.name}</div>
                  <div style={{ color: 'var(--accent-red)', fontFamily: "'Space Mono', monospace", marginTop: 4 }}>{worstCategory.pct}%</div>
                </div>
              </div>
            </div>
          )}

          {/* Historique */}
          <div className="dashboard-section">
            <h2>Historique</h2>
            <div className="table-container">
              <table>
                <thead>
                  <tr>
                    <th>Date</th>
                    <th>Catégorie</th>
                    <th>Questions</th>
                    <th>Score</th>
                  </tr>
                </thead>
                <tbody>
                  {sessions.map(s => (
                    <tr key={s.id}>
                      <td>{new Date(s.completed_at).toLocaleDateString('fr-FR', { day: 'numeric', month: 'short', year: 'numeric' })}</td>
                      <td>{s.categories?.name || 'Toutes'}</td>
                      <td>{s.total_questions}</td>
                      <td>
                        <span className={`badge ${Number(s.score) >= 70 ? 'badge-green' : Number(s.score) >= 50 ? 'badge-yellow' : 'badge-red'}`}>
                          {Math.round(Number(s.score))}%
                        </span>
                      </td>
                    </tr>
                  ))}
                </tbody>
              </table>
            </div>
          </div>
        </>
      )}
    </div>
  )
}
