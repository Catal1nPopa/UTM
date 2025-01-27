##1
import pandas as pd

df1 = pd.read_csv('curs1.csv')
df2 = pd.read_csv('curs2.csv')
df3 = pd.read_csv('curs3.csv')

merged_df = pd.merge(df1, df2, on='Date', how='inner')
merged_df = pd.merge(merged_df, df3, on='Date', how='inner')
merged_df.columns = ['Date', 'Banca1', 'Banca2' , 'Banca3']

merged_df.to_csv('rezultat.csv', index=False)


##2
import pandas as pd

df = pd.read_csv('rezultat.csv',dayfirst=True)
# Calcularea valorilor pentru fiecare zi
for date in df['Date'].unique():
    df_date = df[df['Date'] == date]
    print(f"\nDate: {date}")
    print(f"Min: {df_date.min(numeric_only=True).min()}")
    print(f"Max: {df_date.max(numeric_only=True).max()}")
    print(f"Media: {df_date.mean(numeric_only=True).mean()}")

# Calcularea valorilor pentru toate datele
print("\n\nSumar general:")
print(f"Min pentru toate datele: {df.min(numeric_only=True).min()}")
print(f"Max pentru toate datele: {df.max(numeric_only=True).max()}")
print(f"Media pentru toate datele: {df.mean(numeric_only=True).mean()}")

##3
import pandas as pd

df = pd.read_csv('rezultat.csv')
# Convertirea coloanei 'Date' la tipul de date datetime
df['Date'] = pd.to_datetime(df['Date'], format='%m/%d/%Y')

# Calcularea săptămânii pentru fiecare dată
df['Week'] = (df['Date'] - pd.to_timedelta(df['Date'].dt.dayofweek, unit='D')).dt.strftime('%Y%m%d')
grouped = df.groupby('Week')

for name, group in grouped:
    start_date = group['Date'].min().strftime('%Y%m%d')
    end_date = group['Date'].max().strftime('%Y%m%d')
    filename = f'{start_date}_{end_date}.csv'
    group.to_csv(filename, index=False)
    print(f'Creat fișierul {filename}')


##4
import pandas as pd
def get_data(file_path, data_necesara):
    date = pd.read_csv(file_path)
    date['Date'] = pd.to_datetime(date['Date'], format='%m/%d/%Y')
    result_date = date[date['Date'] == data_necesara]
    if result_date.empty:
        return None
    else:
        return result_date

data_necesara = pd.to_datetime('2023.11.23')
fisier = 'rezultat.csv'
result = get_data(fisier, data_necesara)
if result is not None:
    print(f'Datele pentru {data_necesara.date()} sunt:\n{result}')
else:
    print(f'Nu există date pentru {data_necesara.date()} în fișier.')

##5
import pandas as pd
def get_data(file_path, target_date):
    df = pd.read_csv(file_path)
    df['Date'] = pd.to_datetime(df['Date'], format='%m/%d/%Y')

    start_date = target_date - pd.to_timedelta(target_date.dayofweek, unit='D')
    end_date = start_date + pd.DateOffset(days=6)
    result_date = df[(df['Date'] >= start_date) & (df['Date'] <= end_date)]

    if result_date.empty:
        return None
    else:
        return result_date

data_necesara = pd.to_datetime('2023-11-15')
fisier = 'rezultat.csv'
result = get_data(fisier, data_necesara)
if result is not None:
    print(f'Datele pentru săptămâna {data_necesara.strftime("%Y-%m-%d")} sunt:\n{result}')
else:
    print(f'Nu există date pentru săptămâna {data_necesara.strftime("%Y-%m-%d")} în fișier.')
