import { useState, useEffect } from 'react'
import { useNavigate } from 'react-router-dom'
import { Play, ArrowRight, CheckCircle, XCircle, RotateCcw, Home, Mic, MicOff, Lock } from 'lucide-react'
import { supabase } from '../lib/supabase'
import { useApp } from '../App'
import { fetchAskedCounts, orderByLeastAsked, bumpAskedCounts, fetchLawAccuracy, buildLawWeights } from '../lib/questionRotation'

const LETTERS = ['A', 'B', 'C', 'D', 'E', 'F']
const FREE_WEEKLY_LIMIT = 3

const CATEGORY_GROUPS = [
  { id: 'L1-2', label: 'Lois 1-2 — Terrain & Ballon', categoryIds: [1, 2] },
  { id: 'L3', label: 'Loi 3 — Les joueurs', categoryIds: [3] },
  { id: 'L4', label: 'Loi 4 — L\'équipement', categoryIds: [4] },
  { id: 'L5-7', label: 'Lois 5-6-7 — Arbitre, Officiels & Durée', categoryIds: [5, 6, 7] },
  { id: 'L8-10', label: 'Lois 8-9-10 — Reprise, Ballon en jeu & Issue', categoryIds: [8, 9, 10] },
  { id: 'L11', label: 'Loi 11 — Hors-jeu', categoryIds: [11] },
  { id: 'L12', label: 'Loi 12 — Fautes & comportement', categoryIds: [12] },
  { id: 'L13', label: 'Loi 13 — Coups francs', categoryIds: [13] },
  { id: 'L14', label: 'Loi 14 — Penalty', categoryIds: [14] },
  { id: 'L15-17', label: 'Lois 15-16-17 — Remises en jeu', categoryIds: [15, 16, 17] },
]

const DIFFICULTY_MODES = [
  { id: 'easy', label: '🟢 Facile', maxDifficulty: 1 },
  { id: 'medium', label: '🟡 Moyen', maxDifficulty: 2 },
  { id: 'hard', label: '🔴 Difficile', maxDifficulty: 3 },
]

export default function Quiz() {
  const { profile, categories } = useApp()
  const navigate = useNavigate()

  // States
  const [phase, setPhase] = useState('setup') // setup | playing | results
  const [groupId, setGroupId] = useState('')
  const [difficultyMode, setDifficultyMode] = useState('hard')
  const [numQuestions, setNumQuestions] = useState(10)
  const [questions, setQuestions] = useState([])
  const [currentIndex, setCurrentIndex] = useState(0)
  const [answers, setAnswers] = useState([]) // { question_id, user_answer, is_correct, ai_score, ai_feedback }
  const [selectedChoice, setSelectedChoice] = useState(null)
  const [openAnswer, setOpenAnswer] = useState('')
  const [showCorrection, setShowCorrection] = useState(false)
  const [evaluating, setEvaluating] = useState(false)
  const [currentFeedback, setCurrentFeedback] = useState(null)
  const [retryAttempt, setRetryAttempt] = useState(0)
  const [spareQuestions, setSpareQuestions] = useState([])
  const [replaceNotice, setReplaceNotice] = useState(false)
  const [sessionId, setSessionId] = useState(null)

  // Quota hebdomadaire (free = 3/semaine)
  const [weeklyCount, setWeeklyCount] = useState(0)
  const isFree = profile?.plan === 'free' || (!profile?.plan && profile?.role !== 'admin')
  const quotaRemaining = FREE_WEEKLY_LIMIT - weeklyCount
  const quotaReached = isFree && weeklyCount >= FREE_WEEKLY_LIMIT

  useEffect(() => {
    if (isFree) loadWeeklyCount()
  }, [profile])

  async function loadWeeklyCount() {
    // Lundi de cette semaine à 00:00
    const now = new Date()
    const day = now.getDay()
    const diffToMonday = day === 0 ? 6 : day - 1
    const monday = new Date(now)
    monday.setDate(now.getDate() - diffToMonday)
    monday.setHours(0, 0, 0, 0)

    const { count } = await supabase
      .from('rq_quiz_sessions')
      .select('*', { count: 'exact', head: true })
      .eq('user_id', profile.id)
      .gte('started_at', monday.toISOString())

    setWeeklyCount(count || 0)
  }

  // Speech-to-text (Web Speech API)
  const [isListening, setIsListening] = useState(false)
  const [recognition, setRecognition] = useState(null)

  useEffect(() => {
    const SpeechRecognition = window.SpeechRecognition || window.webkitSpeechRecognition
    if (SpeechRecognition) {
      const recog = new SpeechRecognition()
      recog.lang = 'fr-FR'
      recog.continuous = true
      recog.interimResults = true

      recog.onresult = (event) => {
        let finalTranscript = ''
        let interimTranscript = ''
        for (let i = event.resultIndex; i < event.results.length; i++) {
          const transcript = event.results[i][0].transcript
          if (event.results[i].isFinal) {
            finalTranscript += transcript
          } else {
            interimTranscript = transcript
          }
        }
        if (finalTranscript) {
          setOpenAnswer(prev => prev + (prev ? ' ' : '') + finalTranscript)
        }
      }

      recog.onerror = (event) => {
        console.warn('Speech error:', event.error)
        setIsListening(false)
      }

      recog.onend = () => {
        setIsListening(false)
      }

      setRecognition(recog)
    }
  }, [])

  function toggleMic() {
    if (!recognition) {
      alert('La reconnaissance vocale n\'est pas supportée par ton navigateur.')
      return
    }
    if (isListening) {
      recognition.stop()
      setIsListening(false)
    } else {
      recognition.start()
      setIsListening(true)
    }
  }

  // Setup : charger les questions
  async function startQuiz() {
    if (quotaReached) {
      alert('Tu as atteint la limite de 3 quiz par semaine en version gratuite.')
      return
    }

    // Déterminer les category_ids selon le groupe sélectionné
    const group = CATEGORY_GROUPS.find(g => g.id === groupId)
    const categoryIds = group ? group.categoryIds : null

    // Déterminer la difficulté max
    const mode = DIFFICULTY_MODES.find(m => m.id === difficultyMode)
    const maxDiff = mode ? mode.maxDifficulty : 3

    let query = supabase
      .from('rq_questions')
      .select('*, categories:rq_categories(name, law_number)')
      .eq('is_active', true)
      .lte('difficulty', maxDiff)

    if (categoryIds) {
      query = query.in('category_id', categoryIds)
    }

    const { data, error } = await query

    if (error || !data || data.length === 0) {
      alert('Pas assez de questions disponibles pour cette sélection.')
      return
    }

    // Séparer les questions principales des questions « suite »
    // Une question « suite » a previous_question_id renseigné et ne doit jamais
    // être tirée seule : elle s'ajoute automatiquement après sa parent si celle-ci est sélectionnée.
    const parents = data.filter(q => !q.previous_question_id)
    const followersByParentId = new Map()
    for (const q of data) {
      if (q.previous_question_id) {
        followersByParentId.set(q.previous_question_id, q)
      }
    }

    // Mélanger les parents et construire la liste active en insérant chaque "suite" juste après sa parent.
    // On s'arrête dès qu'on atteint numQuestions, ce qui gère naturellement le cas
    // « parent en dernière position » → sa suite ne sera pas insérée (pas de place).
    // Priorité aux questions les moins posées à cet utilisateur.
    // On mélange à l'intérieur de chaque palier : l'ordre reste imprévisible
    // tout en garantissant la rotation de toute la banque.
    // Les lois les moins réussies sont tirées un peu plus souvent (max x2),
    // à condition d'avoir assez de réponses pour que le taux soit fiable.
    const [counts, lawAccuracy] = await Promise.all([
      fetchAskedCounts(),
      fetchLawAccuracy(profile.id),
    ])
    const lawWeights = buildLawWeights(lawAccuracy)
    const shuffledParents = orderByLeastAsked(parents, counts, lawWeights)
    const active = []
    for (const q of shuffledParents) {
      if (active.length >= numQuestions) break
      active.push(q)
      if (active.length >= numQuestions) break
      const follower = followersByParentId.get(q.id)
      if (follower) {
        active.push(follower)
      }
    }
    // Les parents non utilisés restent en réserve (au cas où l'IA fait défaut et qu'il faut remplacer).
    const usedIds = new Set(active.map(q => q.id))
    const spares = shuffledParents.filter(q => !usedIds.has(q.id))
    setQuestions(active)
    setSpareQuestions(spares)

    // Compter les questions posées (parents ET suites).
    bumpAskedCounts(active.map(q => q.id))

    // Créer la session
    const { data: session, error: sessionError } = await supabase
      .from('rq_quiz_sessions')
      .insert({
        user_id: profile.id,
        category_id: categoryIds && categoryIds.length === 1 ? categoryIds[0] : null,
        total_questions: active.length,
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
    setShowCorrection(false)
    setCurrentFeedback(null)
    setReplaceNotice(false)
    setRetryAttempt(0)
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

  // Soumettre une réponse ouverte (évaluation IA, avec réessais auto)
  async function submitOpenAnswer() {
    if (!openAnswer.trim()) return
    if (recognition && isListening) {
      recognition.stop()
      setIsListening(false)
    }
    setShowCorrection(true)
    setEvaluating(true)

    const MAX_ATTEMPTS = 4
    let evaluation = null

    for (let attempt = 1; attempt <= MAX_ATTEMPTS; attempt++) {
      setRetryAttempt(attempt)
      let retryable = false
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
        const body = await res.json().catch(() => ({}))

        if (res.ok && typeof body?.score === 'number') {
          evaluation = body
          break
        }

        // Erreurs qu'il est inutile de réessayer (clé absente, requête invalide)
        const nonRetryable =
          body?.error === 'Clé API non configurée' ||
          res.status === 400 || res.status === 401 || res.status === 403
        retryable = !nonRetryable
        console.error(`Évaluation IA — tentative ${attempt}/${MAX_ATTEMPTS} échouée :`, body)
        if (nonRetryable) break
      } catch (err) {
        // Erreur réseau : on réessaie
        retryable = true
        console.error(`Évaluation IA — tentative ${attempt}/${MAX_ATTEMPTS} (réseau) :`, err)
      }

      // Attente progressive avant la prochaine tentative (sauf après la dernière)
      if (retryable && attempt < MAX_ATTEMPTS) {
        await new Promise(r => setTimeout(r, 800 * attempt))
      }
    }

    setRetryAttempt(0)

    if (evaluation) {
      const rawScore = Number(evaluation.score)
      const safeScore = Number.isFinite(rawScore) ? Math.max(0, Math.min(1, rawScore)) : 0.5
      const answer = {
        question_id: currentQuestion.id,
        user_answer: openAnswer,
        is_correct: evaluation.is_correct === true,
        ai_score: safeScore,
        ai_feedback: evaluation.feedback,
        missing_elements: evaluation.missing_elements,
      }
      setCurrentFeedback(answer)
      setAnswers(prev => [...prev, answer])
      setEvaluating(false)
      saveAnswer(answer)
    } else {
      // Indisponible après tous les essais : on annule cette question et on la remplace.
      setEvaluating(false)
      replaceCurrentQuestion()
    }
  }

  // Passer la question (l'utilisateur ne sait pas) : comptée fausse, réponse révélée
  function skipQuestion() {
    if (recognition && isListening) {
      recognition.stop()
      setIsListening(false)
    }
    const answer = {
      question_id: currentQuestion.id,
      user_answer: '',
      is_correct: false,
      ai_score: 0,
      ai_feedback: 'Question passée. Voici la réponse attendue.',
      missing_elements: [],
      skipped: true,
    }
    setShowCorrection(true)
    setCurrentFeedback(answer)
    setAnswers(prev => [...prev, answer])
    saveAnswer(answer)
  }

  // Annule la question courante (non évaluable) et la remplace par une question de réserve
  function replaceCurrentQuestion() {
    setShowCorrection(false)
    setCurrentFeedback(null)
    setOpenAnswer('')
    setSelectedChoice(null)
    setReplaceNotice(true)

    // valeurs figées au moment de l'appel
    const idx = currentIndex
    const spares = spareQuestions
    const total = questions.length

    setTimeout(() => {
      setReplaceNotice(false)
      if (spares.length > 0) {
        const next = spares[0]
        setSpareQuestions(prev => prev.slice(1))
        setQuestions(prev => prev.map((q, i) => (i === idx ? next : q)))
        bumpAskedCounts([next.id])
        // on reste sur le même index : la nouvelle question s'affiche à la place
      } else {
        // Aucune réserve disponible : on retire simplement la question du quiz
        const remaining = questions.filter((_, i) => i !== idx)
        setQuestions(remaining)
        if (idx >= remaining.length) {
          // c'était la dernière question → on termine avec ce qui a été répondu
          finishQuiz(answers)
        }
        // sinon, l'index courant pointe désormais sur la question suivante (décalée)
      }
    }, 2200)
  }

  async function saveAnswer(answer) {
    await supabase.from('rq_quiz_answers').insert({
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
    if (recognition && isListening) {
      recognition.stop()
      setIsListening(false)
    }
    if (currentIndex + 1 >= questions.length) {
      finishQuiz(answers)
      return
    }
    setCurrentIndex(prev => prev + 1)
    setSelectedChoice(null)
    setOpenAnswer('')
    setShowCorrection(false)
    setCurrentFeedback(null)
    setReplaceNotice(false)
    setRetryAttempt(0)
  }

  // Terminer le quiz
  async function finishQuiz(finalAnswers = answers) {
    const totalScore = finalAnswers.reduce((sum, a) => sum + (a.ai_score || 0), 0)
    const pct = finalAnswers.length > 0 ? (totalScore / finalAnswers.length) * 100 : 0

    await supabase
      .from('rq_quiz_sessions')
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

          {isFree && (
            <div className={`quota-banner ${quotaReached ? 'quota-reached' : ''}`}>
              <div className="quota-info">
                <span className="quota-label">{quotaReached ? '🔒 Limite atteinte' : `📊 Version gratuite`}</span>
                <span className="quota-count">{weeklyCount}/{FREE_WEEKLY_LIMIT} quiz cette semaine</span>
              </div>
              <div className="quota-bar">
                <div className="quota-fill" style={{ width: `${Math.min(100, (weeklyCount / FREE_WEEKLY_LIMIT) * 100)}%` }} />
              </div>
            </div>
          )}

          <div className="card" style={{ marginBottom: 16 }}>
            <div className="form-group">
              <label>Catégorie</label>
              <select value={groupId} onChange={e => setGroupId(e.target.value)} disabled={quotaReached}>
                <option value="">Toutes les lois</option>
                {CATEGORY_GROUPS.map(g => (
                  <option key={g.id} value={g.id}>{g.label}</option>
                ))}
              </select>
            </div>

            <div className="form-group">
              <label>Difficulté</label>
              <div className="difficulty-selector">
                {DIFFICULTY_MODES.map(m => (
                  <button
                    key={m.id}
                    className={`difficulty-btn ${difficultyMode === m.id ? 'active' : ''} diff-${m.id}`}
                    onClick={() => !quotaReached && setDifficultyMode(m.id)}
                    disabled={quotaReached}
                  >
                    {m.label}
                  </button>
                ))}
              </div>
              <div style={{ fontSize: '0.78rem', color: 'var(--text-muted)', marginTop: 6 }}>
                {difficultyMode === 'easy' && 'Questions faciles uniquement'}
                {difficultyMode === 'medium' && 'Questions faciles + moyennes'}
                {difficultyMode === 'hard' && 'Toutes les questions, y compris les plus dures'}
              </div>
            </div>

            <div className="form-group" style={{ marginBottom: 0 }}>
              <label>Nombre de questions</label>
              <select value={numQuestions} onChange={e => setNumQuestions(parseInt(e.target.value))} disabled={quotaReached}>
                <option value={5}>5 questions</option>
                <option value={10}>10 questions</option>
                <option value={15}>15 questions</option>
                <option value={20}>20 questions</option>
              </select>
            </div>
          </div>

          {quotaReached ? (
            <div className="quota-blocked">
              <Lock size={20} />
              <div>
                <strong>Limite hebdomadaire atteinte</strong>
                <p>Reviens lundi prochain ou passe en Premium pour des quiz illimités !</p>
              </div>
            </div>
          ) : (
            <button className="btn btn-primary btn-lg" style={{ width: '100%' }} onClick={startQuiz}>
              <Play size={20} /> Commencer
            </button>
          )}
        </div>
      </div>
    )
  }

  // PHASE : Results
  if (phase === 'results') {
    const totalScore = answers.reduce((sum, a) => sum + (a.ai_score || 0), 0)
    const pct = answers.length > 0 ? Math.round((totalScore / answers.length) * 100) : 0
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

        {currentQuestion.previous_question_id && (
          <div style={{
            display: 'flex',
            alignItems: 'center',
            gap: 8,
            padding: '8px 12px',
            margin: '6px 0 10px',
            background: 'rgba(99, 102, 241, 0.12)',
            border: '1px solid rgba(99, 102, 241, 0.35)',
            borderRadius: 8,
            color: 'var(--text-secondary)',
            fontSize: '0.85rem',
          }}>
            <span aria-hidden="true">↪️</span>
            <span>Suite de la question précédente : tiens compte du contexte que tu viens de voir.</span>
          </div>
        )}

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
          <div className="open-answer-wrapper">
            <textarea
              className="answer-textarea"
              value={openAnswer}
              onChange={e => setOpenAnswer(e.target.value)}
              placeholder={isListening ? '🎙️ Parle maintenant...' : 'Tape ta réponse ici...'}
              disabled={showCorrection}
            />
            {!showCorrection && (
              <button
                className={`mic-btn ${isListening ? 'mic-active' : ''}`}
                onClick={toggleMic}
                type="button"
                title={isListening ? 'Arrêter la dictée' : 'Dicter ma réponse'}
              >
                {isListening ? <MicOff size={20} /> : <Mic size={20} />}
              </button>
            )}
          </div>
        )}

        {/* Feedback IA pour questions ouvertes */}
        {evaluating && (
          <div className="evaluating-spinner">
            <div className="spinner" />
            {retryAttempt > 1
              ? `Le correcteur intelligent est très sollicité, nouvelle tentative (${retryAttempt}/4)…`
              : 'Évaluation en cours…'}
          </div>
        )}

        {replaceNotice && (
          <div className="evaluating-spinner">
            <div className="spinner" />
            Le correcteur est indisponible pour cette question. Elle est annulée et remplacée par une autre…
          </div>
        )}

        {showCorrection && currentFeedback && !evaluating && currentQuestion.type === 'open' && (
          <div className={`ai-feedback ${currentFeedback.ai_score >= 0.7 ? 'good' : currentFeedback.ai_score >= 0.4 ? 'partial' : 'bad'}`}>
            <div className="feedback-score">
              Score : {Number.isFinite(currentFeedback.ai_score) ? Math.round(currentFeedback.ai_score * 100) : '—'}%
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
        {replaceNotice ? null : !showCorrection ? (
          <>
            {currentQuestion.type === 'open' ? (
              <>
                <button
                  className="btn btn-secondary"
                  onClick={skipQuestion}
                  disabled={evaluating}
                  title="Marquer la question comme non sue et voir la réponse"
                >
                  Passer
                </button>
                <button
                  className="btn btn-primary"
                  onClick={submitOpenAnswer}
                  disabled={!openAnswer.trim() || evaluating}
                >
                  Valider ma réponse
                </button>
              </>
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
          <>
            <button className="btn btn-primary" onClick={nextQuestion} disabled={evaluating}>
              {currentIndex + 1 >= questions.length ? (
                <><CheckCircle size={18} /> Voir les résultats</>
              ) : (
                <><ArrowRight size={18} /> Question suivante</>
              )}
            </button>
          </>
        )}
      </div>
    </div>
  )
}
