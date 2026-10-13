"""Basic local dataset inspection; no model training yet."""
from pathlib import Path
import pandas as pd

csv_path = Path(__file__).resolve().parents[1] / 'data' / 'raw' / 'fraud_oracle.csv'
if not csv_path.exists():
    raise SystemExit(f'Missing dataset: {csv_path}')
df = pd.read_csv(csv_path)
print('Shape:', df.shape)
print('Columns:', list(df.columns))
if 'FraudFound_P' in df.columns:
    print('Fraud labels:\n', df['FraudFound_P'].value_counts(dropna=False))
