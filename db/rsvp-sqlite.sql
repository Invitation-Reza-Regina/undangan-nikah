-- SQLite migration for RSVP
-- Path: db/rsvp-sqlite.sql

PRAGMA foreign_keys = ON;

CREATE TABLE IF NOT EXISTS rsvps (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT NOT NULL,
  status TEXT NOT NULL DEFAULT 'Hadir', -- use 'Hadir' or 'Tidak Hadir'
  message TEXT,
  guest_count INTEGER DEFAULT 1,
  ip_address TEXT,
  user_agent TEXT,
  created_at DATETIME DEFAULT (datetime('now')),
  updated_at DATETIME DEFAULT (datetime('now'))
);

-- Trigger to update 'updated_at' on row update
CREATE TRIGGER IF NOT EXISTS rsvps_updated_at
AFTER UPDATE ON rsvps
FOR EACH ROW
BEGIN
  UPDATE rsvps SET updated_at = datetime('now') WHERE id = OLD.id;
END;
