Updated README: added note about CSV export and export script

I added a sample CSV export (db/rsvp-export.csv) containing the two default wishes present in index.html. I also added a small Python utility (scripts/export_rsvps.py) to export the `rsvps` table from SQLite or MySQL into an Excel .xlsx file.

How to use the script:
- Install dependencies: pip install pandas openpyxl sqlalchemy pymysql
- For SQLite: python3 scripts/export_rsvps.py --sqlite db/rsvp.db --out db/rsvp-export.xlsx
- For MySQL: python3 scripts/export_rsvps.py --mysql "mysql+pymysql://user:pass@host/db" --out db/rsvp-export.xlsx

Files added:
- db/rsvp-export.csv — sample CSV containing current default wishes.
- scripts/export_rsvps.py — export utility to create an XLSX from the DB.
