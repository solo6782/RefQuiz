import { useState, useEffect, createContext, useContext } from 'react'
import { BrowserRouter, Routes, Route, Link, Navigate, useLocation, useNavigate } from 'react-router-dom'
import { supabase } from './lib/supabase'
import { BookOpen, BarChart3, FileText, Settings, LogOut, Play, Home as HomeIcon } from 'lucide-react'
import Auth from './components/Auth'
import HomePage from './components/Home'
import Quiz from './components/Quiz'
import Dashboard from './components/Dashboard'
import Resources from './components/Resources'
import Admin from './components/Admin'

// Context
const AppContext = createContext()
export const useApp = () => useContext(AppContext)

function Navbar({ user, profile, onLogout }) {
  const location = useLocation()
  const isActive = (path) => location.pathname === path ? 'active' : ''

  return (
    <nav className="navbar">
      <div className="navbar-inner">
        <Link to="/" className="navbar-brand">
          <div className="logo-icon">⚽</div>
          RefQuiz
        </Link>
        <div className="navbar-links">
          <Link to="/" className={isActive('/')}>
            <HomeIcon size={18} /><span>Accueil</span>
          </Link>
          <Link to="/quiz" className={isActive('/quiz')}>
            <Play size={18} /><span>Quiz</span>
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
      if (session) loadProfile(session.user.id)
      else setLoading(false)
    })

    // Listen for auth changes
    const { data: { subscription } } = supabase.auth.onAuthStateChange((_event, session) => {
      setSession(session)
      if (session) loadProfile(session.user.id)
      else { setProfile(null); setLoading(false) }
    })

    return () => subscription.unsubscribe()
  }, [])

  useEffect(() => {
    if (session) loadCategories()
  }, [session])

  async function loadProfile(userId) {
    const { data } = await supabase
      .from('profiles')
      .select('*')
      .eq('id', userId)
      .single()
    setProfile(data)
    setLoading(false)
  }

  async function loadCategories() {
    const { data } = await supabase
      .from('categories')
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
