import { useState } from 'react'
import { supabase } from '../lib/supabase'

export default function Auth() {
  const [isLogin, setIsLogin] = useState(true)
  const [email, setEmail] = useState('')
  const [password, setPassword] = useState('')
  const [displayName, setDisplayName] = useState('')
  const [error, setError] = useState('')
  const [loading, setLoading] = useState(false)

  async function handleGoogleLogin() {
    setError('')
    const { error } = await supabase.auth.signInWithOAuth({
      provider: 'google',
      options: {
        redirectTo: window.location.origin,
      },
    })
    if (error) setError(error.message)
  }

  async function handleSubmit(e) {
    e.preventDefault()
    setError('')
    setLoading(true)

    try {
      if (isLogin) {
        const { error } = await supabase.auth.signInWithPassword({ email, password })
        if (error) throw error
      } else {
        if (!displayName.trim()) {
          throw new Error('Le pseudo est requis')
        }
        const { data, error } = await supabase.auth.signUp({
          email,
          password,
          options: { data: { display_name: displayName.trim() } }
        })
        if (error) throw error
        if (data?.user?.identities?.length === 0) {
          setError('Un compte existe déjà avec cet email.')
        }
      }
    } catch (err) {
      const msg = err.message
      if (msg === 'Invalid login credentials') {
        setError('Email ou mot de passe incorrect')
      } else if (msg.includes('Email not confirmed')) {
        setError('Vérifie ta boîte mail pour confirmer ton compte.')
      } else {
        setError(msg)
      }
    } finally {
      setLoading(false)
    }
  }

  return (
    <div className="auth-container">
      <div className="auth-card">
        <div style={{ textAlign: 'center', marginBottom: 8 }}>
          <div style={{
            width: 56, height: 56, borderRadius: 14,
            background: 'linear-gradient(135deg, #10b981, #3b82f6)',
            display: 'inline-flex', alignItems: 'center', justifyContent: 'center',
            fontSize: 28, marginBottom: 12
          }}>⚽</div>
        </div>
        <h1>RefQuiz</h1>
        <p className="subtitle">
          {isLogin ? 'Connecte-toi pour réviser' : 'Crée ton compte pour commencer'}
        </p>

        {error && <div className="auth-error">{error}</div>}

        {/* Bouton Google */}
        <button
          onClick={handleGoogleLogin}
          style={{
            width: '100%',
            padding: '12px 20px',
            background: 'var(--bg-input)',
            border: '1px solid var(--border)',
            borderRadius: 'var(--radius-sm)',
            color: 'var(--text-primary)',
            fontSize: '0.9rem',
            fontWeight: 600,
            fontFamily: 'inherit',
            cursor: 'pointer',
            display: 'flex',
            alignItems: 'center',
            justifyContent: 'center',
            gap: 10,
            transition: 'all 0.2s',
            marginBottom: 20,
          }}
          onMouseOver={e => { e.currentTarget.style.borderColor = 'var(--text-muted)'; e.currentTarget.style.background = 'var(--bg-card-hover)' }}
          onMouseOut={e => { e.currentTarget.style.borderColor = 'var(--border)'; e.currentTarget.style.background = 'var(--bg-input)' }}
        >
          <svg width="20" height="20" viewBox="0 0 24 24">
            <path fill="#4285F4" d="M22.56 12.25c0-.78-.07-1.53-.2-2.25H12v4.26h5.92a5.06 5.06 0 0 1-2.2 3.32v2.77h3.57c2.08-1.92 3.28-4.74 3.28-8.1z"/>
            <path fill="#34A853" d="M12 23c2.97 0 5.46-.98 7.28-2.66l-3.57-2.77c-.98.66-2.23 1.06-3.71 1.06-2.86 0-5.29-1.93-6.16-4.53H2.18v2.84C3.99 20.53 7.7 23 12 23z"/>
            <path fill="#FBBC05" d="M5.84 14.09c-.22-.66-.35-1.36-.35-2.09s.13-1.43.35-2.09V7.07H2.18C1.43 8.55 1 10.22 1 12s.43 3.45 1.18 4.93l2.85-2.22.81-.62z"/>
            <path fill="#EA4335" d="M12 5.38c1.62 0 3.06.56 4.21 1.64l3.15-3.15C17.45 2.09 14.97 1 12 1 7.7 1 3.99 3.47 2.18 7.07l3.66 2.84c.87-2.6 3.3-4.53 6.16-4.53z"/>
          </svg>
          Continuer avec Google
        </button>

        <div style={{
          display: 'flex', alignItems: 'center', gap: 12, marginBottom: 20,
          color: 'var(--text-muted)', fontSize: '0.8rem'
        }}>
          <div style={{ flex: 1, height: 1, background: 'var(--border)' }} />
          ou
          <div style={{ flex: 1, height: 1, background: 'var(--border)' }} />
        </div>

        <form onSubmit={handleSubmit}>
          {!isLogin && (
            <div className="form-group">
              <label>Pseudo</label>
              <input
                type="text"
                value={displayName}
                onChange={e => setDisplayName(e.target.value)}
                placeholder="Ton prénom ou pseudo"
                required={!isLogin}
              />
            </div>
          )}
          <div className="form-group">
            <label>Email</label>
            <input
              type="email"
              value={email}
              onChange={e => setEmail(e.target.value)}
              placeholder="ton@email.com"
              required
            />
          </div>
          <div className="form-group">
            <label>Mot de passe</label>
            <input
              type="password"
              value={password}
              onChange={e => setPassword(e.target.value)}
              placeholder="Minimum 6 caractères"
              minLength={6}
              required
            />
          </div>
          <button type="submit" className="btn btn-primary btn-lg" style={{ width: '100%' }} disabled={loading}>
            {loading ? 'Chargement...' : isLogin ? 'Se connecter' : 'Créer mon compte'}
          </button>
        </form>

        <div className="auth-toggle">
          {isLogin ? "Pas encore de compte ? " : "Déjà un compte ? "}
          <button onClick={() => { setIsLogin(!isLogin); setError('') }}>
            {isLogin ? "S'inscrire" : "Se connecter"}
          </button>
        </div>
      </div>
    </div>
  )
}
