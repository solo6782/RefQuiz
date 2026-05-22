import { useState } from 'react'
import { createPortal } from 'react-dom'
import { X } from 'lucide-react'
import { VERSION, CHANGELOG } from '../version'

export default function VersionBadge() {
  const [open, setOpen] = useState(false)

  return (
    <>
      <button
        type="button"
        className="version-badge"
        onClick={() => setOpen(true)}
        title="Voir les nouveautés"
      >
        v{VERSION}
      </button>

      {open && createPortal(
        <div className="changelog-overlay" onClick={() => setOpen(false)}>
          <div
            className="changelog-modal"
            onClick={(e) => e.stopPropagation()}
            role="dialog"
            aria-modal="true"
          >
            <div className="changelog-header">
              <h2>Nouveautés</h2>
              <button
                type="button"
                className="changelog-close"
                onClick={() => setOpen(false)}
                title="Fermer"
              >
                <X size={20} />
              </button>
            </div>

            <div className="changelog-body">
              {CHANGELOG.map((entry) => (
                <div key={entry.version} className="changelog-entry">
                  <div className="changelog-entry-head">
                    <span className="changelog-version">v{entry.version}</span>
                    {entry.title && (
                      <span className="changelog-title">{entry.title}</span>
                    )}
                    <span className="changelog-date">{entry.date}</span>
                  </div>
                  <ul>
                    {entry.changes.map((c, i) => (
                      <li key={i}>{c}</li>
                    ))}
                  </ul>
                </div>
              ))}
            </div>
          </div>
        </div>,
        document.body
      )}
    </>
  )
}
