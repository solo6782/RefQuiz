import { useState, useEffect, Fragment } from 'react'
import { Plus, Edit2, Trash2, Upload, Users, BookOpen, FileText, ChevronDown, ChevronRight } from 'lucide-react'
import { supabase } from '../lib/supabase'
import { useApp } from '../App'

export default function Admin() {
  const { categories, loadCategories } = useApp()
  const [tab, setTab] = useState('questions')
  const [questions, setQuestions] = useState([])
  const [documents, setDocuments] = useState([])
  const [users, setUsers] = useState([])
  const [sessions, setSessions] = useState([])
  const [answers, setAnswers] = useState([])
  const [expandedUser, setExpandedUser] = useState(null)
  const [showModal, setShowModal] = useState(false)
  const [editItem, setEditItem] = useState(null)
  const [loading, setLoading] = useState(true)

  useEffect(() => {
    loadAll()
  }, [])

  async function loadAll() {
    const [qRes, dRes, uRes, sRes, aRes] = await Promise.all([
      supabase.from('rq_questions').select('*, rq_categories(name, law_number)').order('id', { ascending: false }),
      supabase.from('rq_documents').select('*').order('uploaded_at', { ascending: false }),
      supabase.from('rq_profiles').select('*').order('created_at', { ascending: false }),
      supabase.from('rq_quiz_sessions').select('*').order('created_at', { ascending: false }),
      supabase.from('rq_quiz_answers').select('is_correct, ai_score, session_id, rq_questions(category_id, rq_categories(law_number))'),
    ])
    setQuestions(qRes.data || [])
    setDocuments(dRes.data || [])
    setUsers(uRes.data || [])
    setSessions(sRes.data || [])
    setAnswers(aRes.data || [])
    setLoading(false)
  }

  // ===== QUESTIONS =====
  function QuestionForm({ onSave, onCancel, initial }) {
    const [form, setForm] = useState(initial || {
      category_id: '',
      type: 'qcm',
      question: '',
      choices: ['', '', '', ''],
      correct_index: 0,
      expected_answer: '',
      explanation: '',
      difficulty: 1,
    })

    function updateChoice(i, val) {
      const c = [...(form.choices || [])]
      c[i] = val
      setForm({ ...form, choices: c })
    }

    function addChoice() {
      setForm({ ...form, choices: [...(form.choices || []), ''] })
    }

    function removeChoice(i) {
      const c = [...(form.choices || [])]
      c.splice(i, 1)
      const ci = form.correct_index >= c.length ? c.length - 1 : form.correct_index
      setForm({ ...form, choices: c, correct_index: ci })
    }

    async function handleSubmit(e) {
      e.preventDefault()
      const payload = {
        category_id: form.category_id ? parseInt(form.category_id) : null,
        type: form.type,
        question: form.question,
        choices: form.type === 'qcm' ? form.choices.filter(c => c.trim()) : null,
        correct_index: form.type !== 'open' ? parseInt(form.correct_index) : null,
        expected_answer: form.type === 'open' ? form.expected_answer : null,
        explanation: form.explanation || null,
        difficulty: parseInt(form.difficulty),
        is_active: true,
      }

      if (initial?.id) {
        await supabase.from('rq_questions').update(payload).eq('id', initial.id)
      } else {
        await supabase.from('rq_questions').insert(payload)
      }
      onSave()
    }

    return (
      <div className="modal-overlay" onClick={onCancel}>
        <div className="modal" onClick={e => e.stopPropagation()}>
          <h2>{initial?.id ? 'Modifier' : 'Nouvelle'} question</h2>
          <form onSubmit={handleSubmit}>
            <div className="form-group">
              <label>Catégorie</label>
              <select value={form.category_id} onChange={e => setForm({ ...form, category_id: e.target.value })}>
                <option value="">— Choisir —</option>
                {categories.map(c => (
                  <option key={c.id} value={c.id}>{c.law_number} — {c.name}</option>
                ))}
              </select>
            </div>

            <div className="form-group">
              <label>Type</label>
              <select value={form.type} onChange={e => setForm({ ...form, type: e.target.value })}>
                <option value="qcm">QCM</option>
                <option value="true_false">Vrai / Faux</option>
                <option value="open">Question ouverte</option>
              </select>
            </div>

            <div className="form-group">
              <label>Question</label>
              <textarea
                value={form.question}
                onChange={e => setForm({ ...form, question: e.target.value })}
                placeholder="Énoncé de la question..."
                required
              />
            </div>

            {form.type === 'qcm' && (
              <>
                <div className="form-group">
                  <label>Choix de réponse</label>
                  {(form.choices || []).map((c, i) => (
                    <div key={i} style={{ display: 'flex', gap: 8, marginBottom: 6, alignItems: 'center' }}>
                      <input
                        type="radio"
                        name="correct"
                        checked={form.correct_index === i}
                        onChange={() => setForm({ ...form, correct_index: i })}
                        style={{ width: 'auto', flexShrink: 0 }}
                      />
                      <input
                        type="text"
                        value={c}
                        onChange={e => updateChoice(i, e.target.value)}
                        placeholder={`Choix ${String.fromCharCode(65 + i)}`}
                      />
                      {(form.choices || []).length > 2 && (
                        <button type="button" className="btn btn-ghost btn-sm" onClick={() => removeChoice(i)}>
                          <Trash2 size={14} />
                        </button>
                      )}
                    </div>
                  ))}
                  {(form.choices || []).length < 6 && (
                    <button type="button" className="btn btn-ghost btn-sm" onClick={addChoice}>
                      <Plus size={14} /> Ajouter un choix
                    </button>
                  )}
                  <p style={{ fontSize: '0.75rem', color: 'var(--text-muted)', marginTop: 4 }}>
                    Le cercle coché indique la bonne réponse.
                  </p>
                </div>
              </>
            )}

            {form.type === 'true_false' && (
              <div className="form-group">
                <label>Bonne réponse</label>
                <select value={form.correct_index} onChange={e => setForm({ ...form, correct_index: parseInt(e.target.value) })}>
                  <option value={0}>Faux</option>
                  <option value={1}>Vrai</option>
                </select>
              </div>
            )}

            {form.type === 'open' && (
              <div className="form-group">
                <label>Réponse attendue (utilisée par l'IA pour évaluer)</label>
                <textarea
                  value={form.expected_answer}
                  onChange={e => setForm({ ...form, expected_answer: e.target.value })}
                  placeholder="La réponse complète attendue..."
                  required={form.type === 'open'}
                  style={{ minHeight: 120 }}
                />
              </div>
            )}

            <div className="form-group">
              <label>Explication (affichée après correction)</label>
              <textarea
                value={form.explanation}
                onChange={e => setForm({ ...form, explanation: e.target.value })}
                placeholder="Explication optionnelle..."
                style={{ minHeight: 60 }}
              />
            </div>

            <div className="form-group">
              <label>Difficulté</label>
              <select value={form.difficulty} onChange={e => setForm({ ...form, difficulty: e.target.value })}>
                <option value={1}>Facile</option>
                <option value={2}>Moyen</option>
                <option value={3}>Difficile</option>
              </select>
            </div>

            <div className="modal-actions">
              <button type="button" className="btn btn-secondary" onClick={onCancel}>Annuler</button>
              <button type="submit" className="btn btn-primary">
                {initial?.id ? 'Enregistrer' : 'Créer'}
              </button>
            </div>
          </form>
        </div>
      </div>
    )
  }

  // ===== DOCUMENTS =====
  function DocumentForm({ onSave, onCancel }) {
    const [title, setTitle] = useState('')
    const [category, setCategory] = useState('LOTG')
    const [description, setDescription] = useState('')
    const [file, setFile] = useState(null)
    const [uploading, setUploading] = useState(false)

    async function handleSubmit(e) {
      e.preventDefault()
      if (!file) return

      setUploading(true)
      const ext = file.name.split('.').pop()
      const path = `${Date.now()}_${file.name}`

      const { error: uploadError } = await supabase.storage
        .from('rq_documents')
        .upload(path, file)

      if (uploadError) {
        alert('Erreur upload: ' + uploadError.message)
        setUploading(false)
        return
      }

      await supabase.from('rq_documents').insert({
        title,
        category,
        description: description || null,
        storage_path: path,
        file_size: file.size,
      })

      setUploading(false)
      onSave()
    }

    return (
      <div className="modal-overlay" onClick={onCancel}>
        <div className="modal" onClick={e => e.stopPropagation()}>
          <h2>Ajouter un document</h2>
          <form onSubmit={handleSubmit}>
            <div className="form-group">
              <label>Titre</label>
              <input type="text" value={title} onChange={e => setTitle(e.target.value)} required />
            </div>
            <div className="form-group">
              <label>Catégorie</label>
              <select value={category} onChange={e => setCategory(e.target.value)}>
                <option value="LOTG">Lois du Jeu (LOTG)</option>
                <option value="Formation">Formation</option>
                <option value="Test">Test</option>
                <option value="Autre">Autre</option>
              </select>
            </div>
            <div className="form-group">
              <label>Description</label>
              <input type="text" value={description} onChange={e => setDescription(e.target.value)} />
            </div>
            <div className="form-group">
              <label>Fichier PDF</label>
              <input
                type="file"
                accept=".pdf"
                onChange={e => setFile(e.target.files[0])}
                required
                style={{ padding: 8, background: 'var(--bg-input)', border: '1px solid var(--border)', borderRadius: 'var(--radius-sm)', width: '100%', color: 'var(--text-primary)' }}
              />
            </div>
            <div className="modal-actions">
              <button type="button" className="btn btn-secondary" onClick={onCancel}>Annuler</button>
              <button type="submit" className="btn btn-primary" disabled={uploading}>
                {uploading ? 'Upload...' : 'Ajouter'}
              </button>
            </div>
          </form>
        </div>
      </div>
    )
  }

  async function deleteQuestion(id) {
    if (!confirm('Supprimer cette question ?')) return
    await supabase.from('rq_questions').delete().eq('id', id)
    loadAll()
  }

  async function deleteDocument(doc) {
    if (!confirm('Supprimer ce document ?')) return
    await supabase.storage.from('rq_documents').remove([doc.storage_path])
    await supabase.from('rq_documents').delete().eq('id', doc.id)
    loadAll()
  }

  async function toggleQuestion(q) {
    await supabase.from('rq_questions').update({ is_active: !q.is_active }).eq('id', q.id)
    loadAll()
  }

  // Stats agrégées pour un utilisateur donné
  function statsForUser(userId) {
    const userSessions = sessions.filter(s => s.user_id === userId)
    const completed = userSessions.filter(s => s.completed)
    const nbQuiz = completed.length
    const avgScore = nbQuiz > 0
      ? Math.round(completed.reduce((sum, s) => sum + (Number(s.score) || 0), 0) / nbQuiz)
      : null
    const lastQuiz = userSessions[0]?.completed_at || userSessions[0]?.created_at || null

    // Points faibles par loi (sur les réponses de cet utilisateur)
    const sessionIds = new Set(userSessions.map(s => s.id))
    const userAnswers = answers.filter(a => sessionIds.has(a.session_id))
    const byLaw = {}
    for (const a of userAnswers) {
      const law = a.rq_questions?.rq_categories?.law_number || '—'
      if (!byLaw[law]) byLaw[law] = { total: 0, correct: 0 }
      byLaw[law].total += 1
      if (a.is_correct) byLaw[law].correct += 1
    }
    const lawStats = Object.entries(byLaw)
      .map(([law, v]) => ({ law, total: v.total, correct: v.correct, pct: Math.round((v.correct / v.total) * 100) }))
      .sort((a, b) => a.pct - b.pct)

    return { nbQuiz, avgScore, lastQuiz, userSessions: completed, lawStats }
  }

  const lawNum = (l) => parseInt(String(l).replace(/\D/g, ''), 10) || 0

  if (loading) {
    return (
      <div className="page">
        <div className="loading-container">
          <div className="loading-dots"><span /><span /><span /></div>
        </div>
      </div>
    )
  }

  return (
    <div className="page">
      <h1 style={{ marginBottom: 24 }}>Administration</h1>

      {/* Tabs */}
      <div className="admin-tabs">
        <button className={`admin-tab ${tab === 'questions' ? 'active' : ''}`} onClick={() => setTab('questions')}>
          <BookOpen size={16} style={{ marginRight: 6 }} />
          Questions ({questions.length})
        </button>
        <button className={`admin-tab ${tab === 'documents' ? 'active' : ''}`} onClick={() => setTab('documents')}>
          <FileText size={16} style={{ marginRight: 6 }} />
          Documents ({documents.length})
        </button>
        <button className={`admin-tab ${tab === 'users' ? 'active' : ''}`} onClick={() => setTab('users')}>
          <Users size={16} style={{ marginRight: 6 }} />
          Utilisateurs ({users.length})
        </button>
      </div>

      {/* Questions tab */}
      {tab === 'questions' && (
        <>
          <div style={{ display: 'flex', justifyContent: 'space-between', marginBottom: 16 }}>
            <p style={{ color: 'var(--text-muted)', fontSize: '0.85rem' }}>
              {questions.filter(q => q.is_active).length} actives / {questions.length} total
            </p>
            <button className="btn btn-primary btn-sm" onClick={() => { setEditItem(null); setShowModal('question') }}>
              <Plus size={16} /> Nouvelle question
            </button>
          </div>

          <div className="table-container">
            <table>
              <thead>
                <tr>
                  <th>ID</th>
                  <th>Question</th>
                  <th>Catégorie</th>
                  <th>Type</th>
                  <th>Difficulté</th>
                  <th>Active</th>
                  <th>Actions</th>
                </tr>
              </thead>
              <tbody>
                {questions.map(q => (
                  <tr key={q.id}>
                    <td style={{ fontFamily: "'Space Mono', monospace", fontSize: '0.8rem' }}>#{q.id}</td>
                    <td style={{ maxWidth: 300, overflow: 'hidden', textOverflow: 'ellipsis', whiteSpace: 'nowrap' }}>
                      {q.question}
                    </td>
                    <td><span className="badge badge-blue">{q.categories?.law_number || '—'}</span></td>
                    <td><span className="badge badge-purple">{q.type}</span></td>
                    <td>
                      <span className={`badge ${q.difficulty === 1 ? 'badge-green' : q.difficulty === 2 ? 'badge-yellow' : 'badge-red'}`}>
                        {q.difficulty === 1 ? 'Facile' : q.difficulty === 2 ? 'Moyen' : 'Difficile'}
                      </span>
                    </td>
                    <td>
                      <button
                        className={`btn btn-sm ${q.is_active ? 'btn-success' : 'btn-secondary'}`}
                        onClick={() => toggleQuestion(q)}
                        style={{ minWidth: 50 }}
                      >
                        {q.is_active ? 'Oui' : 'Non'}
                      </button>
                    </td>
                    <td>
                      <div style={{ display: 'flex', gap: 4 }}>
                        <button className="btn btn-ghost btn-sm" onClick={() => {
                          setEditItem({
                            ...q,
                            category_id: q.category_id || '',
                            choices: q.choices || ['', '', '', ''],
                          })
                          setShowModal('question')
                        }}>
                          <Edit2 size={14} />
                        </button>
                        <button className="btn btn-ghost btn-sm" onClick={() => deleteQuestion(q.id)} style={{ color: 'var(--accent-red)' }}>
                          <Trash2 size={14} />
                        </button>
                      </div>
                    </td>
                  </tr>
                ))}
              </tbody>
            </table>
          </div>
        </>
      )}

      {/* Documents tab */}
      {tab === 'documents' && (
        <>
          <div style={{ display: 'flex', justifyContent: 'flex-end', marginBottom: 16 }}>
            <button className="btn btn-primary btn-sm" onClick={() => setShowModal('document')}>
              <Upload size={16} /> Ajouter un document
            </button>
          </div>

          <div className="table-container">
            <table>
              <thead>
                <tr>
                  <th>Titre</th>
                  <th>Catégorie</th>
                  <th>Taille</th>
                  <th>Date</th>
                  <th>Actions</th>
                </tr>
              </thead>
              <tbody>
                {documents.map(d => (
                  <tr key={d.id}>
                    <td style={{ fontWeight: 500 }}>{d.title}</td>
                    <td><span className="badge badge-blue">{d.category}</span></td>
                    <td>{d.file_size ? `${(d.file_size / 1024 / 1024).toFixed(1)} MB` : '—'}</td>
                    <td>{new Date(d.uploaded_at).toLocaleDateString('fr-FR')}</td>
                    <td>
                      <button className="btn btn-ghost btn-sm" onClick={() => deleteDocument(d)} style={{ color: 'var(--accent-red)' }}>
                        <Trash2 size={14} />
                      </button>
                    </td>
                  </tr>
                ))}
              </tbody>
            </table>
          </div>
        </>
      )}

      {/* Users tab */}
      {tab === 'users' && (
        <div className="table-container">
          <table>
            <thead>
              <tr>
                <th></th>
                <th>Pseudo</th>
                <th>Email</th>
                <th>Quiz terminés</th>
                <th>Score moyen</th>
                <th>Dernier quiz</th>
                <th>Rôle</th>
                <th>Plan</th>
              </tr>
            </thead>
            <tbody>
              {users.map(u => {
                const st = statsForUser(u.id)
                const isOpen = expandedUser === u.id
                return (
                  <Fragment key={u.id}>
                    <tr
                      onClick={() => setExpandedUser(isOpen ? null : u.id)}
                      style={{ cursor: 'pointer' }}
                    >
                      <td style={{ width: 28 }}>
                        {isOpen ? <ChevronDown size={16} /> : <ChevronRight size={16} />}
                      </td>
                      <td style={{ fontWeight: 500 }}>{u.display_name}</td>
                      <td>{u.email}</td>
                      <td>{st.nbQuiz}</td>
                      <td>
                        {st.avgScore === null ? '—' : (
                          <span className={`badge ${st.avgScore >= 70 ? 'badge-green' : st.avgScore >= 50 ? 'badge-blue' : 'badge-red'}`}>
                            {st.avgScore}%
                          </span>
                        )}
                      </td>
                      <td>{st.lastQuiz ? new Date(st.lastQuiz).toLocaleDateString('fr-FR') : '—'}</td>
                      <td>
                        <span className={`badge ${u.role === 'admin' ? 'badge-red' : 'badge-blue'}`}>
                          {u.role}
                        </span>
                      </td>
                      <td onClick={e => e.stopPropagation()}>
                        <select
                          value={u.plan || 'free'}
                          onChange={async (e) => {
                            const newPlan = e.target.value
                            await supabase.from('rq_profiles').update({ plan: newPlan }).eq('id', u.id)
                            setUsers(users.map(x => x.id === u.id ? { ...x, plan: newPlan } : x))
                          }}
                          style={{ padding: '4px 8px', fontSize: '0.8rem', minWidth: 100 }}
                        >
                          <option value="free">🆓 Free</option>
                          <option value="premium">⭐ Premium</option>
                          <option value="admin">🔧 Admin</option>
                        </select>
                      </td>
                    </tr>

                    {isOpen && (
                      <tr>
                        <td colSpan={8} style={{ background: 'var(--bg-card-hover)', padding: 18 }}>
                          {st.nbQuiz === 0 ? (
                            <p style={{ color: 'var(--text-muted)', margin: 0 }}>
                              Cet utilisateur n'a pas encore terminé de quiz.
                            </p>
                          ) : (
                            <div style={{ display: 'grid', gap: 22, gridTemplateColumns: '1fr 1fr' }}>
                              {/* Points faibles par loi */}
                              <div>
                                <h4 style={{ margin: '0 0 10px' }}>Réussite par loi (les plus faibles en premier)</h4>
                                {st.lawStats.length === 0 ? (
                                  <p style={{ color: 'var(--text-muted)', margin: 0 }}>Aucune réponse enregistrée.</p>
                                ) : (
                                  <div style={{ display: 'flex', flexDirection: 'column', gap: 6 }}>
                                    {st.lawStats.map(ls => (
                                      <div key={ls.law} style={{ display: 'flex', alignItems: 'center', gap: 10 }}>
                                        <span style={{ minWidth: 56, fontSize: '0.82rem', color: 'var(--text-secondary)' }}>{ls.law}</span>
                                        <div style={{ flex: 1, height: 8, background: 'var(--bg-card)', borderRadius: 999, overflow: 'hidden' }}>
                                          <div style={{
                                            width: `${ls.pct}%`, height: '100%',
                                            background: ls.pct >= 70 ? 'var(--accent-green)' : ls.pct >= 50 ? 'var(--accent-blue)' : 'var(--accent-red)',
                                          }} />
                                        </div>
                                        <span style={{ minWidth: 78, fontSize: '0.8rem', textAlign: 'right', color: 'var(--text-muted)' }}>
                                          {ls.pct}% ({ls.correct}/{ls.total})
                                        </span>
                                      </div>
                                    ))}
                                  </div>
                                )}
                              </div>

                              {/* Historique des quiz */}
                              <div>
                                <h4 style={{ margin: '0 0 10px' }}>Historique des quiz</h4>
                                <div style={{ display: 'flex', flexDirection: 'column', gap: 6, maxHeight: 220, overflowY: 'auto' }}>
                                  {st.userSessions.map(s => (
                                    <div key={s.id} style={{ display: 'flex', justifyContent: 'space-between', gap: 12, fontSize: '0.84rem', padding: '4px 0', borderBottom: '1px solid var(--border)' }}>
                                      <span style={{ color: 'var(--text-secondary)' }}>
                                        {new Date(s.completed_at || s.created_at).toLocaleDateString('fr-FR')} — {s.total_questions} questions
                                      </span>
                                      <span className={`badge ${Number(s.score) >= 70 ? 'badge-green' : Number(s.score) >= 50 ? 'badge-blue' : 'badge-red'}`}>
                                        {Math.round(Number(s.score) || 0)}%
                                      </span>
                                    </div>
                                  ))}
                                </div>
                              </div>
                            </div>
                          )}
                        </td>
                      </tr>
                    )}
                  </Fragment>
                )
              })}
            </tbody>
          </table>
        </div>
      )}

      {/* Modals */}
      {showModal === 'question' && (
        <QuestionForm
          initial={editItem}
          onCancel={() => { setShowModal(false); setEditItem(null) }}
          onSave={() => { setShowModal(false); setEditItem(null); loadAll() }}
        />
      )}
      {showModal === 'document' && (
        <DocumentForm
          onCancel={() => setShowModal(false)}
          onSave={() => { setShowModal(false); loadAll() }}
        />
      )}
    </div>
  )
}
