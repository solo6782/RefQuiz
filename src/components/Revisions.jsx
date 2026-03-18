import { useState, useEffect } from 'react'
import { useApp } from '../App'
import { supabase } from '../lib/supabase'
import { Layers, AlertTriangle, ChevronLeft, ChevronRight, Eye, EyeOff, RotateCcw, Shuffle, CheckCircle, Filter } from 'lucide-react'

export default function Revisions() {
  const { profile, categories } = useApp()
  const [mode, setMode] = useState(null) // null | 'flashcards' | 'errors'

  if (!mode) {
    return (
      <div className="page">
        <h1 style={{ marginBottom: 8 }}>Révisions</h1>
        <p className="subtitle" style={{ marginBottom: 28 }}>Révise à ton rythme, sans score ni pression.</p>

        <div className="home-actions">
          <button className="action-card" onClick={() => setMode('flashcards')} style={{ textAlign: 'left', cursor: 'pointer', border: 'none' }}>
            <div className="action-icon" style={{ background: 'var(--accent-blue-soft)', color: 'var(--accent-blue)' }}>
              <Layers size={24} />
            </div>
            <h3>Flashcards</h3>
            <p>Parcours les questions par loi. Réfléchis, puis révèle la réponse.</p>
          </button>

          <button className="action-card" onClick={() => setMode('errors')} style={{ textAlign: 'left', cursor: 'pointer', border: 'none' }}>
            <div className="action-icon" style={{ background: 'var(--accent-red-soft)', color: 'var(--accent-red)' }}>
              <AlertTriangle size={24} />
            </div>
            <h3>Revoir mes erreurs</h3>
            <p>Reprends les questions que tu as ratées dans tes quiz passés.</p>
          </button>
        </div>
      </div>
    )
  }

  if (mode === 'flashcards') return <Flashcards categories={categories} onBack={() => setMode(null)} />
  if (mode === 'errors') return <ReviewErrors profile={profile} categories={categories} onBack={() => setMode(null)} />
}

// ==========================================
// FLASHCARDS
// ==========================================
function Flashcards({ categories, onBack }) {
  const [categoryId, setCategoryId] = useState('')
  const [cards, setCards] = useState([])
  const [index, setIndex] = useState(0)
  const [revealed, setRevealed] = useState(false)
  const [started, setStarted] = useState(false)
  const [shuffled, setShuffled] = useState(true)

  async function loadCards() {
    let query = supabase
      .from('questions')
      .select('*, categories(name, law_number)')
      .eq('is_active', true)

    if (categoryId) {
      query = query.eq('category_id', parseInt(categoryId))
    }

    const { data } = await query

    if (!data || data.length === 0) {
      alert('Aucune question disponible pour cette catégorie.')
      return
    }

    const result = shuffled
      ? data.sort(() => Math.random() - 0.5)
      : data.sort((a, b) => a.id - b.id)

    setCards(result)
    setIndex(0)
    setRevealed(false)
    setStarted(true)
  }

  function next() {
    if (index < cards.length - 1) {
      setIndex(i => i + 1)
      setRevealed(false)
    }
  }

  function prev() {
    if (index > 0) {
      setIndex(i => i - 1)
      setRevealed(false)
    }
  }

  function reshuffle() {
    setCards(c => [...c].sort(() => Math.random() - 0.5))
    setIndex(0)
    setRevealed(false)
  }

  if (!started) {
    return (
      <div className="page">
        <button className="btn btn-ghost btn-sm" onClick={onBack} style={{ marginBottom: 16 }}>
          <ChevronLeft size={16} /> Retour
        </button>
        <h1 style={{ marginBottom: 8 }}>Flashcards</h1>
        <p className="subtitle" style={{ marginBottom: 28 }}>Choisis une catégorie et parcours les fiches.</p>

        <div className="card" style={{ marginBottom: 16 }}>
          <div className="form-group">
            <label>Catégorie</label>
            <select value={categoryId} onChange={e => setCategoryId(e.target.value)}>
              <option value="">Toutes les lois</option>
              {categories.map(c => (
                <option key={c.id} value={c.id}>{c.law_number} — {c.name}</option>
              ))}
            </select>
          </div>
          <div className="form-group" style={{ marginBottom: 0 }}>
            <label style={{ display: 'flex', alignItems: 'center', gap: 8, cursor: 'pointer' }}>
              <input
                type="checkbox"
                checked={shuffled}
                onChange={e => setShuffled(e.target.checked)}
                style={{ width: 18, height: 18 }}
              />
              Mélanger les questions
            </label>
          </div>
        </div>

        <button className="btn btn-primary btn-lg" style={{ width: '100%' }} onClick={loadCards}>
          <Layers size={20} /> Commencer les fiches
        </button>
      </div>
    )
  }

  const card = cards[index]

  return (
    <div className="page">
      {/* Header */}
      <div className="quiz-header">
        <div className="quiz-progress">
          <div className="progress-bar">
            <div className="progress-fill" style={{ width: `${((index + 1) / cards.length) * 100}%` }} />
          </div>
          <span className="progress-text">{index + 1}/{cards.length}</span>
        </div>
        <div style={{ display: 'flex', gap: 8 }}>
          <button className="btn btn-ghost btn-sm" onClick={reshuffle} title="Remélanger">
            <Shuffle size={16} />
          </button>
          <button className="btn btn-ghost btn-sm" onClick={() => { setStarted(false); setCards([]) }}>
            Quitter
          </button>
        </div>
      </div>

      {/* Flashcard */}
      <div className="flashcard">
        <div className="question-meta">
          {card.categories && (
            <span className="badge badge-blue">{card.categories.law_number}</span>
          )}
          <span className={`badge ${card.difficulty === 1 ? 'badge-green' : card.difficulty === 2 ? 'badge-yellow' : 'badge-red'}`}>
            {card.difficulty === 1 ? 'Facile' : card.difficulty === 2 ? 'Moyen' : 'Difficile'}
          </span>
          <span className="badge" style={{ background: 'var(--accent-blue-soft)', color: 'var(--accent-blue)' }}>
            📖 Révision
          </span>
        </div>

        <div className="question-text">{card.question}</div>

        {!revealed ? (
          <button className="reveal-btn" onClick={() => setRevealed(true)}>
            <Eye size={18} /> Révéler la réponse
          </button>
        ) : (
          <div className="flashcard-answer">
            <div className="flashcard-answer-label">Réponse attendue :</div>
            <div>{card.expected_answer || (card.type === 'qcm' ? card.choices?.[card.correct_index] : card.correct_index === 1 ? 'Vrai' : 'Faux')}</div>
            {card.explanation && (
              <div style={{ marginTop: 10, fontSize: '0.85rem', color: 'var(--text-muted)', fontStyle: 'italic' }}>
                💡 {card.explanation}
              </div>
            )}
          </div>
        )}
      </div>

      {/* Navigation */}
      <div className="flashcard-nav">
        <button className="btn btn-ghost" onClick={prev} disabled={index === 0}>
          <ChevronLeft size={18} /> Précédente
        </button>
        <button className="btn btn-ghost" onClick={next} disabled={index === cards.length - 1}>
          Suivante <ChevronRight size={18} />
        </button>
      </div>
    </div>
  )
}

// ==========================================
// REVIEW ERRORS
// ==========================================
function ReviewErrors({ profile, categories, onBack }) {
  const [cards, setCards] = useState([])
  const [index, setIndex] = useState(0)
  const [revealed, setRevealed] = useState(false)
  const [loading, setLoading] = useState(true)
  const [filterCat, setFilterCat] = useState('')
  const [noErrors, setNoErrors] = useState(false)

  useEffect(() => {
    loadErrors()
  }, [filterCat])

  async function loadErrors() {
    setLoading(true)

    // Chercher les questions ratées (score < 0.7)
    let query = supabase
      .from('quiz_answers')
      .select(`
        question_id,
        ai_score,
        questions (*, categories(name, law_number))
      `)
      .eq('is_correct', false)
      .eq('questions.is_active', true)

    // Filtrer par session de l'utilisateur
    const { data: sessions } = await supabase
      .from('quiz_sessions')
      .select('id')
      .eq('user_id', profile.id)

    if (!sessions || sessions.length === 0) {
      setCards([])
      setNoErrors(true)
      setLoading(false)
      return
    }

    const sessionIds = sessions.map(s => s.id)
    const { data: wrongAnswers } = await supabase
      .from('quiz_answers')
      .select(`
        question_id,
        ai_score,
        user_answer,
        questions!inner (*, categories!inner(name, law_number))
      `)
      .in('session_id', sessionIds)
      .eq('is_correct', false)

    if (!wrongAnswers || wrongAnswers.length === 0) {
      setCards([])
      setNoErrors(true)
      setLoading(false)
      return
    }

    // Dédupliquer par question_id (garder la plus récente)
    const uniqueMap = new Map()
    for (const wa of wrongAnswers) {
      if (wa.questions && wa.questions.is_active) {
        if (!uniqueMap.has(wa.question_id)) {
          uniqueMap.set(wa.question_id, {
            ...wa.questions,
            last_user_answer: wa.user_answer,
            last_score: wa.ai_score,
          })
        }
      }
    }

    let result = Array.from(uniqueMap.values())

    // Filtrer par catégorie si sélectionnée
    if (filterCat) {
      result = result.filter(q => q.category_id === parseInt(filterCat))
    }

    // Mélanger
    result.sort(() => Math.random() - 0.5)

    setCards(result)
    setNoErrors(result.length === 0 && !filterCat)
    setIndex(0)
    setRevealed(false)
    setLoading(false)
  }

  function next() {
    if (index < cards.length - 1) {
      setIndex(i => i + 1)
      setRevealed(false)
    }
  }

  function prev() {
    if (index > 0) {
      setIndex(i => i - 1)
      setRevealed(false)
    }
  }

  if (loading) {
    return (
      <div className="page">
        <button className="btn btn-ghost btn-sm" onClick={onBack} style={{ marginBottom: 16 }}>
          <ChevronLeft size={16} /> Retour
        </button>
        <div className="loading-container">
          <div className="loading-dots"><span /><span /><span /></div>
        </div>
      </div>
    )
  }

  if (noErrors && !filterCat) {
    return (
      <div className="page">
        <button className="btn btn-ghost btn-sm" onClick={onBack} style={{ marginBottom: 16 }}>
          <ChevronLeft size={16} /> Retour
        </button>
        <div className="card" style={{ textAlign: 'center', padding: 40 }}>
          <CheckCircle size={48} color="var(--accent-green)" style={{ marginBottom: 16 }} />
          <h2>Aucune erreur à revoir !</h2>
          <p className="subtitle" style={{ marginTop: 8 }}>Tu n'as encore aucune question ratée, ou tu les as toutes réussies. Continue les quiz !</p>
        </div>
      </div>
    )
  }

  return (
    <div className="page">
      {/* Header */}
      <div className="quiz-header">
        <div style={{ display: 'flex', alignItems: 'center', gap: 12 }}>
          <button className="btn btn-ghost btn-sm" onClick={onBack}>
            <ChevronLeft size={16} />
          </button>
          <span style={{ fontWeight: 600 }}>Mes erreurs ({cards.length})</span>
        </div>
        <div style={{ display: 'flex', gap: 8, alignItems: 'center' }}>
          <select
            value={filterCat}
            onChange={e => setFilterCat(e.target.value)}
            style={{ padding: '6px 10px', fontSize: '0.8rem', minWidth: 80 }}
          >
            <option value="">Toutes</option>
            {categories.map(c => (
              <option key={c.id} value={c.id}>{c.law_number}</option>
            ))}
          </select>
        </div>
      </div>

      {cards.length === 0 ? (
        <div className="card" style={{ textAlign: 'center', padding: 32 }}>
          <p className="subtitle">Aucune erreur dans cette catégorie.</p>
        </div>
      ) : (
        <>
          {/* Progress */}
          <div style={{ marginBottom: 16 }}>
            <div className="progress-bar" style={{ width: '100%' }}>
              <div className="progress-fill" style={{ width: `${((index + 1) / cards.length) * 100}%` }} />
            </div>
            <div style={{ textAlign: 'center', fontSize: '0.8rem', color: 'var(--text-muted)', marginTop: 6 }}>
              {index + 1}/{cards.length}
            </div>
          </div>

          {/* Card */}
          <div className="flashcard">
            <div className="question-meta">
              {cards[index].categories && (
                <span className="badge badge-blue">{cards[index].categories.law_number}</span>
              )}
              <span className={`badge ${cards[index].difficulty === 1 ? 'badge-green' : cards[index].difficulty === 2 ? 'badge-yellow' : 'badge-red'}`}>
                {cards[index].difficulty === 1 ? 'Facile' : cards[index].difficulty === 2 ? 'Moyen' : 'Difficile'}
              </span>
              <span className="badge" style={{ background: 'var(--accent-red-soft)', color: 'var(--accent-red)' }}>
                ❌ Erreur
              </span>
            </div>

            <div className="question-text">{cards[index].question}</div>

            {cards[index].last_user_answer && (
              <div className="error-prev-answer">
                <strong>Ta dernière réponse :</strong> {cards[index].last_user_answer}
              </div>
            )}

            {!revealed ? (
              <button className="reveal-btn" onClick={() => setRevealed(true)}>
                <Eye size={18} /> Révéler la réponse
              </button>
            ) : (
              <div className="flashcard-answer">
                <div className="flashcard-answer-label">Réponse attendue :</div>
                <div>{cards[index].expected_answer || (cards[index].type === 'qcm' ? cards[index].choices?.[cards[index].correct_index] : cards[index].correct_index === 1 ? 'Vrai' : 'Faux')}</div>
                {cards[index].explanation && (
                  <div style={{ marginTop: 10, fontSize: '0.85rem', color: 'var(--text-muted)', fontStyle: 'italic' }}>
                    💡 {cards[index].explanation}
                  </div>
                )}
              </div>
            )}
          </div>

          {/* Navigation */}
          <div className="flashcard-nav">
            <button className="btn btn-ghost" onClick={prev} disabled={index === 0}>
              <ChevronLeft size={18} /> Précédente
            </button>
            <button className="btn btn-ghost" onClick={next} disabled={index === cards.length - 1}>
              Suivante <ChevronRight size={18} />
            </button>
          </div>
        </>
      )}
    </div>
  )
}
