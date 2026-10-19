"""Export RSVPs to Excel (XLSX)

Usage:
- For SQLite (default):
    python3 scripts/export_rsvps.py --sqlite db/rsvp.db --out db/rsvp-export.xlsx

- For MySQL:
    python3 scripts/export_rsvps.py --mysql "mysql+pymysql://user:password@host:3306/wedding" --out db/rsvp-export.xlsx

Requirements:
    pip install pandas openpyxl sqlalchemy pymysql

The script reads the 'rsvps' table and writes an Excel file with the same columns.
"""
import argparse
import pandas as pd
from sqlalchemy import create_engine

parser = argparse.ArgumentParser(description='Export rsvps table to Excel')
parser.add_argument('--sqlite', help='SQLite DB path (e.g. db/rsvp.db)')
parser.add_argument('--mysql', help='MySQL SQLAlchemy URL (e.g. mysql+pymysql://user:pass@host/db)')
parser.add_argument('--out', required=True, help='Output XLSX path')
args = parser.parse_args()

if not args.sqlite and not args.mysql:
    parser.error('Either --sqlite or --mysql must be provided')

if args.sqlite:
    engine = create_engine(f'sqlite:///{args.sqlite}')
else:
    engine = create_engine(args.mysql)

with engine.connect() as conn:
    # Read RSVPs table
    df = pd.read_sql_table('rsvps', conn)
    df.to_excel(args.out, index=False)
    print(f'Exported {len(df)} rows to {args.out}')
