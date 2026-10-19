# Database migrations for RSVP

This folder contains SQL migration files to store RSVP (RSVP / Ucapan & Doa Restu) data for the invitation site.

Files:
- `rsvp-mysql.sql` — MySQL / MariaDB migration
- `rsvp-sqlite.sql` — SQLite migration (lightweight)

Notes and integration
- The front-end `index.html` currently stores RSVPs/wishes in `localStorage` (key: `wedding_wishes_sage`).
- To persist RSVPs to the database, add a backend endpoint (e.g. `POST /api/rsvp`) that accepts JSON with at least these fields:
  - `name` (string)
  - `status` ("Hadir" or "Tidak Hadir")
  - `message` (string)
  - optional: `guest_count` (int)

Example minimal request body:

```
{
  "name": "Budi Santoso",
  "status": "Hadir",
  "message": "Selamat ya!",
  "guest_count": 1
}
```

How to apply
- MySQL/MariaDB:
  1. Create or select your database: `CREATE DATABASE wedding;` and `USE wedding;`
  2. Apply migration: `mysql -u user -p wedding < db/rsvp-mysql.sql`

- SQLite:
  1. Create a file and apply migration: `sqlite3 rsvp.db < db/rsvp-sqlite.sql`

Security & validation
- Always validate and sanitize input on server-side before inserting into the database.
- If you expose a public API, consider adding rate-limiting and CAPTCHA to prevent spam.

Would you like me to:
- add an example backend endpoint (Node/Express, PHP, or Python/Flask) wired to this schema?
- automatically update `index.html` to POST to that endpoint instead of using localStorage?

If yes, tell me which backend language you prefer and whether I should commit the server code to this repo (e.g. in a new `api/` folder).