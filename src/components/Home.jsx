import { useState, useEffect } from 'react'
import { Link } from 'react-router-dom'
import { Play, BarChart3, FileText, Settings, Trophy, Target, TrendingUp, Lock } from 'lucide-react'
import { supabase } from '../lib/supabase'
import { useApp } from '../App'

const FREE_WEEKLY_LIMIT = 3

export default function HomePage() {
  const { profile, categories } = useApp()
  const [stats, setStats] = useState({ sessions: 0, avgScore: 0, totalQuestions: 0 })
  const [recentSessions, setRecentSessions] = useState([])
  const [weeklyCount, setWeeklyCount] = useState(0)

  const isFree = profile?.plan === 'free' || (!profile?.plan && profile?.role !== 'admin')

  useEffect(() => {
    loadStats()
    loadRecentSessions()
    if (isFree) loadWeeklyCount()
  }, [])

  async function loadWeeklyCount() {
    const now = new Date()
    const day = now.getDay()
    const diffToMonday = day === 0 ? 6 : day - 1
    const monday = new Date(now)
    monday.setDate(now.getDate() - diffToMonday)
    monday.setHours(0, 0, 0, 0)

    const { count } = await supabase
      .from('quiz_sessions')
      .select('*', { count: 'exact', head: true })
      .eq('user_id', profile.id)
      .gte('started_at', monday.toISOString())

    setWeeklyCount(count || 0)
  }

  async function loadStats() {
    const { data } = await supabase
      .from('quiz_sessions')
      .select('score, total_questions')
      .eq('user_id', profile.id)
      .eq('completed', true)

    if (data && data.length > 0) {
      const avg = data.reduce((sum, s) => sum + Number(s.score), 0) / data.length
      const total = data.reduce((sum, s) => sum + s.total_questions, 0)
      setStats({ sessions: data.length, avgScore: Math.round(avg), totalQuestions: total })
    }
  }

  async function loadRecentSessions() {
    const { data } = await supabase
      .from('quiz_sessions')
      .select('*, categories(name)')
      .eq('user_id', profile.id)
      .eq('completed', true)
      .order('completed_at', { ascending: false })
      .limit(5)

    setRecentSessions(data || [])
  }

  return (
    <div className="page">
      <div className="home-header">
        <h1>Salut {profile?.display_name} 👋</h1>
        <p className="subtitle">Prêt à réviser les lois du jeu ?</p>
      </div>

      {/* Stats rapides */}
      <div className="stats-grid">
        <div className="stat-card">
          <div className="stat-label">Quiz complétés</div>
          <div className="stat-value">{stats.sessions}</div>
        </div>
        <div className="stat-card">
          <div className="stat-label">Score moyen</div>
          <div className="stat-value" style={{ color: stats.avgScore >= 70 ? 'var(--accent-green)' : stats.avgScore >= 50 ? 'var(--accent-yellow)' : 'var(--accent-red)' }}>
            {stats.sessions > 0 ? `${stats.avgScore}%` : '—'}
          </div>
        </div>
        <div className="stat-card">
          <div className="stat-label">Questions répondues</div>
          <div className="stat-value">{stats.totalQuestions}</div>
        </div>
      </div>

      {/* Actions principales */}
      {isFree && (
        <div className={`quota-banner ${weeklyCount >= FREE_WEEKLY_LIMIT ? 'quota-reached' : ''}`} style={{ marginBottom: 20 }}>
          <div className="quota-info">
            <span className="quota-label">📊 Version gratuite</span>
            <span className="quota-count">{weeklyCount}/{FREE_WEEKLY_LIMIT} quiz cette semaine</span>
          </div>
          <div className="quota-bar">
            <div className="quota-fill" style={{ width: `${Math.min(100, (weeklyCount / FREE_WEEKLY_LIMIT) * 100)}%` }} />
          </div>
        </div>
      )}

      <div className="home-actions">
        <Link to="/quiz" className="action-card">
          <div className="action-icon" style={{ background: 'var(--accent-blue-soft)', color: 'var(--accent-blue)' }}>
            <Play size={24} />
          </div>
          <h3>Lancer un Quiz</h3>
          <p>Choisis une catégorie et teste tes connaissances sur les lois du jeu.</p>
        </Link>

        <Link to="/dashboard" className="action-card">
          <div className="action-icon" style={{ background: 'var(--accent-green-soft)', color: 'var(--accent-green)' }}>
            <BarChart3 size={24} />
          </div>
          <h3>Ma Progression</h3>
          <p>Analyse tes résultats, identifie tes points forts et tes axes de travail.</p>
        </Link>

        <Link to="/resources" className="action-card">
          <div className="action-icon" style={{ background: 'var(--accent-purple-soft)', color: 'var(--accent-purple)' }}>
            <FileText size={24} />
          </div>
          <h3>Ressources</h3>
          <p>Consulte les lois du jeu, les supports de formation et les documents utiles.</p>
        </Link>
      </div>

      {/* Sessions récentes */}
      {recentSessions.length > 0 && (
        <div style={{ marginTop: 32 }}>
          <h2>Derniers quiz</h2>
          <div style={{ marginTop: 12, display: 'flex', flexDirection: 'column', gap: 8 }}>
            {recentSessions.map(s => (
              <div key={s.id} className="card" style={{ display: 'flex', alignItems: 'center', justifyContent: 'space-between', padding: '14px 20px' }}>
                <div>
                  <span style={{ fontWeight: 500 }}>
                    {s.categories?.name || 'Toutes catégories'}
                  </span>
                  <span style={{ color: 'var(--text-muted)', fontSize: '0.8rem', marginLeft: 10 }}>
                    {s.total_questions} questions
                  </span>
                </div>
                <div style={{ display: 'flex', alignItems: 'center', gap: 8 }}>
                  <span className={`badge ${Number(s.score) >= 70 ? 'badge-green' : Number(s.score) >= 50 ? 'badge-yellow' : 'badge-red'}`}>
                    {Math.round(Number(s.score))}%
                  </span>
                  <span style={{ color: 'var(--text-muted)', fontSize: '0.75rem' }}>
                    {new Date(s.completed_at).toLocaleDateString('fr-FR')}
                  </span>
                </div>
              </div>
            ))}
          </div>
        </div>
      )}
    </div>
  )
}
