import { useState, useEffect } from 'react'
import { useNavigate } from 'react-router-dom'
import { Play, ArrowRight, CheckCircle, XCircle, RotateCcw, Home } from 'lucide-react'
import { supabase } from '../lib/supabase'
import { useApp } from '../App'

const LETTERS = ['A', 'B', 'C', 'D', 'E', 'F']

export default function Quiz() {
  const { profile, categories } = useApp()
  const navigate = useNavigate()

  // States
  const [phase, setPhase] = useState('setup') // setup | playing | results
  const [categoryId, setCategoryId] = useState('')
  const [numQuestions, setNumQuestions] = useState(10)
  const [questions, setQuestions] = useState([])
  const [currentIndex, setCurrentIndex] = useState(0)
  const [answers, setAnswers] = useState([]) // { question_id, user_answer, is_correct, ai_score, ai_feedback }
  const [selectedChoice, setSelectedChoice] = useState(null)
  const [openAnswer, setOpenAnswer] = useState('')
  const [showCorrection, setShowCorrection] = useState(false)
  const [evaluating, setEvaluating] = useState(false)
  const [currentFeedback, setCurrentFeedback] = useState(null)
  const [sessionId, setSessionId] = useState(null)

  // Setup : charger les questions
  async function startQuiz() {
    let query = supabase
      .from('questions')
      .select('*, categories(name, law_number)')
      .eq('is_active', true)

    if (categoryId) {
      query = query.eq('category_id', parseInt(categoryId))
    }

    const { data, error } = await query

    if (error || !data || data.length === 0) {
      alert('Aucune question disponible pour cette catégorie.')
      return
    }

    // Mélanger et limiter
    const shuffled = data.sort(() => Math.random() - 0.5).slice(0, numQuestions)
    setQuestions(shuffled)

    // Créer la session
    const { data: session, error: sessionError } = await supabase
      .from('quiz_sessions')
      .insert({
        user_id: profile.id,
        category_id: categoryId ? parseInt(categoryId) : null,
        total_questions: shuffled.length,
      })
      .select()
      .single()

    if (sessionError) {
      console.error('Session error:', sessionError)
      alert('Erreur lors de la création de la session.')
      return
    }

    setSessionId(session.id)
    setAnswers([])
    setCurrentIndex(0)
    setPhase('playing')
  }

  const currentQuestion = questions[currentIndex]
  const progress = questions.length > 0 ? ((currentIndex) / questions.length) * 100 : 0

  // Soumettre une réponse QCM / Vrai-Faux
  function submitChoice() {
    if (selectedChoice === null) return
    const isCorrect = selectedChoice === currentQuestion.correct_index
    setShowCorrection(true)

    const answer = {
      question_id: currentQuestion.id,
      user_answer: currentQuestion.type === 'true_false'
        ? (selectedChoice === 1 ? 'Vrai' : 'Faux')
        : currentQuestion.choices[selectedChoice],
      is_correct: isCorrect,
      ai_score: isCorrect ? 1 : 0,
      ai_feedback: isCorrect
        ? 'Bonne réponse !'
        : `La bonne réponse était : ${currentQuestion.type === 'true_false'
          ? (currentQuestion.correct_index === 1 ? 'Vrai' : 'Faux')
          : currentQuestion.choices[currentQuestion.correct_index]}`,
    }
    setCurrentFeedback(answer)
    setAnswers(prev => [...prev, answer])

    // Sauvegarder en BDD
    saveAnswer(answer)
  }

  // Soumettre une réponse ouverte (évaluation IA)
  async function submitOpenAnswer() {
    if (!openAnswer.trim()) return
    setEvaluating(true)
    setShowCorrection(true)

    let evaluation
    try {
      const res = await fetch('/api/evaluate', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({
          question: currentQuestion.question,
          expected_answer: currentQuestion.expected_answer,
          user_answer: openAnswer,
        }),
      })
      evaluation = await res.json()
    } catch (err) {
      evaluation = {
        score: 0.5,
        is_correct: false,
        feedback: 'Impossible d\'évaluer automatiquement. Compare avec la réponse attendue ci-dessous.',
        missing_elements: [],
      }
    }

    const answer = {
      question_id: currentQuestion.id,
      user_answer: openAnswer,
      is_correct: evaluation.is_correct,
      ai_score: evaluation.score,
      ai_feedback: evaluation.feedback,
      missing_elements: evaluation.missing_elements,
    }
    setCurrentFeedback(answer)
    setAnswers(prev => [...prev, answer])
    setEvaluating(false)

    saveAnswer(answer)
  }

  async function saveAnswer(answer) {
    await supabase.from('quiz_answers').insert({
      session_id: sessionId,
      question_id: answer.question_id,
      user_answer: answer.user_answer,
      is_correct: answer.is_correct,
      ai_score: answer.ai_score,
      ai_feedback: answer.ai_feedback,
    })
  }

  // Question suivante
  function nextQuestion() {
    if (currentIndex + 1 >= questions.length) {
      finishQuiz()
      return
    }
    setCurrentIndex(prev => prev + 1)
    setSelectedChoice(null)
    setOpenAnswer('')
    setShowCorrection(false)
    setCurrentFeedback(null)
  }

  // Terminer le quiz
  async function finishQuiz() {
    const totalScore = answers.reduce((sum, a) => sum + (a.ai_score || 0), 0)
    const pct = (totalScore / answers.length) * 100

    await supabase
      .from('quiz_sessions')
      .update({
        score: pct,
        completed: true,
        completed_at: new Date().toISOString(),
      })
      .eq('id', sessionId)

    setPhase('results')
  }

  // PHASE : Setup
  if (phase === 'setup') {
    return (
      <div className="page">
        <div className="quiz-setup">
          <h1 style={{ marginBottom: 8 }}>Nouveau Quiz</h1>
          <p className="subtitle" style={{ marginBottom: 28 }}>Configure ton quiz et c'est parti !</p>

          <div className="card" style={{ marginBottom: 16 }}>
            <div className="form-group">
              <label>Catégorie</label>
              <select value={categoryId} onChange={e => setCategoryId(e.target.value)}>
                <option value="">Toutes les catégories</option>
                {categories.map(c => (
                  <option key={c.id} value={c.id}>{c.law_number} — {c.name}</option>
                ))}
              </select>
            </div>

            <div className="form-group" style={{ marginBottom: 0 }}>
              <label>Nombre de questions</label>
              <select value={numQuestions} onChange={e => setNumQuestions(parseInt(e.target.value))}>
                <option value={5}>5 questions</option>
                <option value={10}>10 questions</option>
                <option value={15}>15 questions</option>
                <option value={20}>20 questions</option>
              </select>
            </div>
          </div>

          <button className="btn btn-primary btn-lg" style={{ width: '100%' }} onClick={startQuiz}>
            <Play size={20} /> Commencer
          </button>
        </div>
      </div>
    )
  }

  // PHASE : Results
  if (phase === 'results') {
    const totalScore = answers.reduce((sum, a) => sum + (a.ai_score || 0), 0)
    const pct = Math.round((totalScore / answers.length) * 100)
    const scoreClass = pct >= 70 ? 'high' : pct >= 50 ? 'medium' : 'low'

    return (
      <div className="page">
        <div className="results-header">
          <h1>Résultats</h1>
          <div className={`score-circle ${scoreClass}`}>
            <div className="score-number">{pct}%</div>
            <div className="score-label">
              {answers.filter(a => a.is_correct).length}/{answers.length}
            </div>
          </div>
          <p className="subtitle">
            {pct >= 80 ? 'Excellent travail ! 🎉' : pct >= 60 ? 'Pas mal, continue à réviser ! 💪' : 'Il y a du travail, courage ! 📚'}
          </p>
        </div>

        <div style={{ display: 'flex', gap: 10, justifyContent: 'center', marginBottom: 32 }}>
          <button className="btn btn-primary" onClick={() => { setPhase('setup'); setAnswers([]); }}>
            <RotateCcw size={18} /> Nouveau quiz
          </button>
          <button className="btn btn-secondary" onClick={() => navigate('/')}>
            <Home size={18} /> Accueil
          </button>
        </div>

        {/* Détail des réponses */}
        <h2 style={{ marginBottom: 16 }}>Détail des réponses</h2>
        {answers.map((answer, i) => {
          const q = questions[i]
          return (
            <div key={i} className="result-item">
              <div className="result-item-header">
                <div className="result-q">
                  <span style={{ color: 'var(--text-muted)', marginRight: 8 }}>Q{i + 1}.</span>
                  {q.question}
                </div>
                {answer.is_correct
                  ? <CheckCircle size={22} color="var(--accent-green)" />
                  : <XCircle size={22} color="var(--accent-red)" />
                }
              </div>

              <div className="result-answer">
                <strong>Ta réponse :</strong> {answer.user_answer}
              </div>

              {!answer.is_correct && (
                <div className="result-expected">
                  <strong>Réponse attendue :</strong>{' '}
                  {q.type === 'open'
                    ? q.expected_answer
                    : q.type === 'true_false'
                      ? (q.correct_index === 1 ? 'Vrai' : 'Faux')
                      : q.choices[q.correct_index]
                  }
                </div>
              )}

              {answer.ai_feedback && q.type === 'open' && (
                <div className={`ai-feedback ${answer.ai_score >= 0.7 ? 'good' : answer.ai_score >= 0.4 ? 'partial' : 'bad'}`} style={{ marginTop: 8 }}>
                  <div className="feedback-text">{answer.ai_feedback}</div>
                  {answer.missing_elements?.length > 0 && (
                    <ul className="missing-list">
                      {answer.missing_elements.map((el, j) => <li key={j}>{el}</li>)}
                    </ul>
                  )}
                </div>
              )}

              {q.explanation && (
                <div style={{ marginTop: 8, fontSize: '0.85rem', color: 'var(--text-muted)', fontStyle: 'italic' }}>
                  💡 {q.explanation}
                </div>
              )}
            </div>
          )
        })}
      </div>
    )
  }

  // PHASE : Playing
  return (
    <div className="page">
      {/* Header avec progression */}
      <div className="quiz-header">
        <div className="quiz-progress">
          <div className="progress-bar">
            <div className="progress-fill" style={{ width: `${progress}%` }} />
          </div>
          <span className="progress-text">{currentIndex + 1}/{questions.length}</span>
        </div>
        <button className="btn btn-ghost btn-sm" onClick={() => {
          if (confirm('Quitter le quiz ? Ta progression sera perdue.')) {
            setPhase('setup')
            setAnswers([])
          }
        }}>
          Quitter
        </button>
      </div>

      {/* Question */}
      <div className="question-card">
        <div className="question-meta">
          {currentQuestion.categories && (
            <span className="badge badge-blue">
              {currentQuestion.categories.law_number}
            </span>
          )}
          <span className={`badge ${currentQuestion.difficulty === 1 ? 'badge-green' : currentQuestion.difficulty === 2 ? 'badge-yellow' : 'badge-red'}`}>
            {currentQuestion.difficulty === 1 ? 'Facile' : currentQuestion.difficulty === 2 ? 'Moyen' : 'Difficile'}
          </span>
          <span className="badge badge-purple">
            {currentQuestion.type === 'qcm' ? 'QCM' : currentQuestion.type === 'true_false' ? 'Vrai/Faux' : 'Question ouverte'}
          </span>
        </div>

        <div className="question-text">{currentQuestion.question}</div>

        {/* QCM */}
        {currentQuestion.type === 'qcm' && currentQuestion.choices && (
          <div className="choices-list">
            {currentQuestion.choices.map((choice, i) => {
              let cls = 'choice-btn'
              if (showCorrection) {
                if (i === currentQuestion.correct_index) cls += ' correct'
                else if (i === selectedChoice && i !== currentQuestion.correct_index) cls += ' incorrect'
              } else if (i === selectedChoice) {
                cls += ' selected'
              }
              return (
                <button
                  key={i}
                  className={cls}
                  onClick={() => !showCorrection && setSelectedChoice(i)}
                  disabled={showCorrection}
                >
                  <span className="choice-letter">{LETTERS[i]}</span>
                  {choice}
                </button>
              )
            })}
          </div>
        )}

        {/* Vrai/Faux */}
        {currentQuestion.type === 'true_false' && (
          <div className="choices-list" style={{ flexDirection: 'row', gap: 12 }}>
            {['Faux', 'Vrai'].map((label, i) => {
              let cls = 'choice-btn'
              if (showCorrection) {
                if (i === currentQuestion.correct_index) cls += ' correct'
                else if (i === selectedChoice && i !== currentQuestion.correct_index) cls += ' incorrect'
              } else if (i === selectedChoice) {
                cls += ' selected'
              }
              return (
                <button
                  key={i}
                  className={cls}
                  style={{ flex: 1, justifyContent: 'center' }}
                  onClick={() => !showCorrection && setSelectedChoice(i)}
                  disabled={showCorrection}
                >
                  {label}
                </button>
              )
            })}
          </div>
        )}

        {/* Question ouverte */}
        {currentQuestion.type === 'open' && (
          <div>
            <textarea
              className="answer-textarea"
              value={openAnswer}
              onChange={e => setOpenAnswer(e.target.value)}
              placeholder="Tape ta réponse ici..."
              disabled={showCorrection}
            />
          </div>
        )}

        {/* Feedback IA pour questions ouvertes */}
        {evaluating && (
          <div className="evaluating-spinner">
            <div className="spinner" />
            Évaluation en cours...
          </div>
        )}

        {showCorrection && currentFeedback && currentQuestion.type === 'open' && (
          <div className={`ai-feedback ${currentFeedback.ai_score >= 0.7 ? 'good' : currentFeedback.ai_score >= 0.4 ? 'partial' : 'bad'}`}>
            <div className="feedback-score">
              Score : {Math.round(currentFeedback.ai_score * 100)}%
              {currentFeedback.is_correct ? ' ✅' : ' ❌'}
            </div>
            <div className="feedback-text">{currentFeedback.ai_feedback}</div>
            {currentFeedback.missing_elements?.length > 0 && (
              <>
                <div style={{ marginTop: 8, fontSize: '0.8rem', fontWeight: 600, color: 'var(--text-muted)' }}>
                  Éléments manquants :
                </div>
                <ul className="missing-list">
                  {currentFeedback.missing_elements.map((el, j) => <li key={j}>{el}</li>)}
                </ul>
              </>
            )}
            {currentQuestion.expected_answer && (
              <div style={{ marginTop: 12, padding: '10px', background: 'rgba(16,185,129,0.08)', borderRadius: 'var(--radius-sm)', fontSize: '0.85rem' }}>
                <strong style={{ color: 'var(--accent-green)' }}>Réponse attendue :</strong>
                <div style={{ marginTop: 4, color: 'var(--text-secondary)' }}>{currentQuestion.expected_answer}</div>
              </div>
            )}
          </div>
        )}

        {/* Correction QCM/V-F */}
        {showCorrection && currentQuestion.type !== 'open' && currentQuestion.explanation && (
          <div style={{ marginTop: 16, padding: 14, background: 'var(--bg-input)', borderRadius: 'var(--radius-sm)', fontSize: '0.85rem', color: 'var(--text-secondary)' }}>
            💡 {currentQuestion.explanation}
          </div>
        )}
      </div>

      {/* Actions */}
      <div className="quiz-actions">
        {!showCorrection ? (
          <>
            {currentQuestion.type === 'open' ? (
              <button
                className="btn btn-primary"
                onClick={submitOpenAnswer}
                disabled={!openAnswer.trim() || evaluating}
              >
                Valider ma réponse
              </button>
            ) : (
              <button
                className="btn btn-primary"
                onClick={submitChoice}
                disabled={selectedChoice === null}
              >
                Valider
              </button>
            )}
          </>
        ) : (
          <button className="btn btn-primary" onClick={nextQuestion}>
            {currentIndex + 1 >= questions.length ? (
              <><CheckCircle size={18} /> Voir les résultats</>
            ) : (
              <><ArrowRight size={18} /> Question suivante</>
            )}
          </button>
        )}
      </div>
    </div>
  )
}
