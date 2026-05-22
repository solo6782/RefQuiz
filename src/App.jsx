import { useState, useEffect, createContext, useContext } from 'react'
import { BrowserRouter, Routes, Route, Link, Navigate, useLocation, useNavigate } from 'react-router-dom'
import { supabase } from './lib/supabase'
import { BookOpen, BarChart3, FileText, Settings, LogOut, Play, Home as HomeIcon, Layers } from 'lucide-react'
import Auth from './components/Auth'
import HomePage from './components/Home'
import Quiz from './components/Quiz'
import Dashboard from './components/Dashboard'
import Resources from './components/Resources'
import Revisions from './components/Revisions'
import Admin from './components/Admin'
import VersionBadge from './components/VersionBadge'

// Context
const AppContext = createContext()
export const useApp = () => useContext(AppContext)

function Navbar({ user, profile, onLogout }) {
  const location = useLocation()
  const isActive = (path) => location.pathname === path ? 'active' : ''

  return (
    <nav className="navbar">
      <div className="navbar-inner">
        <div className="navbar-brand-wrap">
          <Link to="/" className="navbar-brand">
            <div className="logo-icon">⚽</div>
            RefQuiz
          </Link>
          <VersionBadge />
        </div>
        <div className="navbar-links">
          <Link to="/" className={isActive('/')}>
            <HomeIcon size={18} /><span>Accueil</span>
          </Link>
          <Link to="/quiz" className={isActive('/quiz')}>
            <Play size={18} /><span>Quiz</span>
          </Link>
          <Link to="/revisions" className={isActive('/revisions')}>
            <Layers size={18} /><span>Révisions</span>
          </Link>
          <Link to="/dashboard" className={isActive('/dashboard')}>
            <BarChart3 size={18} /><span>Stats</span>
          </Link>
          <Link to="/resources" className={isActive('/resources')}>
            <FileText size={18} /><span>Docs</span>
          </Link>
          {profile?.role === 'admin' && (
            <Link to="/admin" className={isActive('/admin')}>
              <Settings size={18} /><span>Admin</span>
            </Link>
          )}
          <button onClick={onLogout} title="Déconnexion">
            <LogOut size={18} />
          </button>
        </div>
      </div>
    </nav>
  )
}

export default function App() {
  const [session, setSession] = useState(null)
  const [profile, setProfile] = useState(null)
  const [categories, setCategories] = useState([])
  const [loading, setLoading] = useState(true)

  useEffect(() => {
    // Get initial session
    supabase.auth.getSession().then(({ data: { session } }) => {
      setSession(session)
      if (session) loadProfile(session.user)
      else setLoading(false)
    })

    // Listen for auth changes
    const { data: { subscription } } = supabase.auth.onAuthStateChange((_event, session) => {
      setSession(session)
      if (session) loadProfile(session.user)
      else { setProfile(null); setLoading(false) }
    })

    return () => subscription.unsubscribe()
  }, [])

  useEffect(() => {
    if (session) loadCategories()
  }, [session])

  async function loadProfile(user) {
    // 1. Tente de charger le profil existant
    let { data } = await supabase
      .from('rq_profiles')
      .select('*')
      .eq('id', user.id)
      .maybeSingle()

    // 2. Première connexion : pas encore de profil → on le crée
    //    (remplace l'ancien trigger DB, pour ne pas toucher l'auth des autres apps du projet)
    if (!data) {
      const meta = user.user_metadata || {}
      const displayName =
        meta.full_name || meta.name || (user.email ? user.email.split('@')[0] : 'Arbitre')
      await supabase
        .from('rq_profiles')
        .upsert(
          { id: user.id, email: user.email || '', display_name: displayName },
          { onConflict: 'id', ignoreDuplicates: true }
        )
      const res = await supabase
        .from('rq_profiles')
        .select('*')
        .eq('id', user.id)
        .maybeSingle()
      data = res.data
    }

    setProfile(data)
    setLoading(false)
  }

  async function loadCategories() {
    const { data } = await supabase
      .from('rq_categories')
      .select('*')
      .order('sort_order')
    setCategories(data || [])
  }

  async function handleLogout() {
    await supabase.auth.signOut()
    setSession(null)
    setProfile(null)
  }

  if (loading) {
    return (
      <div className="loading-container" style={{ minHeight: '100vh' }}>
        <div className="loading-dots">
          <span /><span /><span />
        </div>
      </div>
    )
  }

  if (!session) {
    return <Auth />
  }

  return (
    <AppContext.Provider value={{ session, profile, categories, loadCategories }}>
      <BrowserRouter>
        <Navbar user={session.user} profile={profile} onLogout={handleLogout} />
        <div className="app-container">
          <Routes>
            <Route path="/" element={<HomePage />} />
            <Route path="/quiz" element={<Quiz />} />
            <Route path="/revisions" element={<Revisions />} />
            <Route path="/dashboard" element={<Dashboard />} />
            <Route path="/resources" element={<Resources />} />
            {profile?.role === 'admin' && (
              <Route path="/admin" element={<Admin />} />
            )}
            <Route path="*" element={<Navigate to="/" />} />
          </Routes>
        </div>
      </BrowserRouter>
    </AppContext.Provider>
  )
}
