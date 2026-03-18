import { useState, useEffect } from 'react'
import { FileText, Download, ExternalLink } from 'lucide-react'
import { supabase } from '../lib/supabase'

const CATEGORY_COLORS = {
  LOTG: 'badge-blue',
  Formation: 'badge-green',
  Test: 'badge-yellow',
  Autre: 'badge-purple',
}

export default function Resources() {
  const [documents, setDocuments] = useState([])
  const [filter, setFilter] = useState('all')
  const [loading, setLoading] = useState(true)

  useEffect(() => {
    loadDocuments()
  }, [])

  async function loadDocuments() {
    const { data } = await supabase
      .from('documents')
      .select('*')
      .order('uploaded_at', { ascending: false })

    setDocuments(data || [])
    setLoading(false)
  }

  async function downloadDoc(doc) {
    const { data, error } = await supabase.storage
      .from('documents')
      .createSignedUrl(doc.storage_path, 3600) // 1h

    if (data?.signedUrl) {
      window.open(data.signedUrl, '_blank')
    } else {
      alert('Erreur lors du téléchargement')
    }
  }

  const filtered = filter === 'all'
    ? documents
    : documents.filter(d => d.category === filter)

  const categories = ['all', 'LOTG', 'Formation', 'Test', 'Autre']

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
      <h1 style={{ marginBottom: 8 }}>Ressources</h1>
      <p className="subtitle" style={{ marginBottom: 24 }}>Consulte les lois du jeu et les documents de formation.</p>

      {/* Filtres */}
      <div style={{ display: 'flex', gap: 6, marginBottom: 20, flexWrap: 'wrap' }}>
        {categories.map(cat => (
          <button
            key={cat}
            className={`btn btn-sm ${filter === cat ? 'btn-primary' : 'btn-secondary'}`}
            onClick={() => setFilter(cat)}
          >
            {cat === 'all' ? 'Tous' : cat}
          </button>
        ))}
      </div>

      {filtered.length === 0 ? (
        <div className="empty-state">
          <div className="empty-icon">📄</div>
          <p>Aucun document disponible pour l'instant.</p>
        </div>
      ) : (
        <div className="resources-grid">
          {filtered.map(doc => (
            <div key={doc.id} className="resource-card">
              <div style={{ display: 'flex', alignItems: 'center', gap: 12 }}>
                <div className="resource-icon">
                  <FileText size={20} />
                </div>
                <div style={{ flex: 1 }}>
                  <h3 style={{ fontSize: '0.95rem' }}>{doc.title}</h3>
                  <span className={`badge ${CATEGORY_COLORS[doc.category] || 'badge-purple'}`} style={{ marginTop: 4 }}>
                    {doc.category}
                  </span>
                </div>
              </div>
              {doc.description && (
                <p style={{ fontSize: '0.85rem', color: 'var(--text-secondary)', lineHeight: 1.5 }}>
                  {doc.description}
                </p>
              )}
              <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center' }}>
                <span style={{ fontSize: '0.75rem', color: 'var(--text-muted)' }}>
                  {doc.file_size ? `${(doc.file_size / 1024 / 1024).toFixed(1)} MB` : ''}
                </span>
                <button className="btn btn-sm btn-secondary" onClick={() => downloadDoc(doc)}>
                  <Download size={14} /> Ouvrir
                </button>
              </div>
            </div>
          ))}
        </div>
      )}
    </div>
  )
}
