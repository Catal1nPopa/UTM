import numpy as np
import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn.ensemble import RandomForestClassifier
from sklearn.metrics import accuracy_score, precision_score

# Citeste datele
df = pd.read_csv("car_evaluation.csv", header=None)
col_names = ['buying', 'maint', 'doors', 'persons', 'lug_boot', 'safety', 'class']
df.columns = col_names

# Converteste caracteristicile categorice in variabile dummy
df = pd.get_dummies(df, columns=['buying', 'maint', 'doors', 'persons', 'lug_boot', 'safety'])

# Defineste variabilele de caracteristici si variabila tinta
X = df.drop(['class'], axis=1)
Y = df['class']

# Imparte datele in setul de antrenare si de testare
X_train, X_test, y_train, y_test = train_test_split(X, Y, test_size=0.33, random_state=42)

# Initializare si antrenare model RandomForestClassifier
rfc = RandomForestClassifier(random_state=0)
rfc_100 = RandomForestClassifier(n_estimators=100,random_state=0)
rfc.fit(X_train, y_train)
rfc_100.fit(X_train, y_train)

# Realizare predictii pe setul de testare
y_pred = rfc.predict(X_test)
y_pred_100 = rfc.predict(X_test)

# Calculare precizie
precision = precision_score(y_test, y_pred, average='weighted')
precision2 = precision_score(y_test, y_pred_100, average='weighted')

# Verificare acuratete
accuracy = accuracy_score(y_test, y_pred)
accuracy2 = accuracy_score(y_test, y_pred_100)

print('Acuratetea modelului 10 arbori: {0:0.4f}'.format(accuracy))
print('Precizia modelului 10 arbori: {0:0.4f}'.format(precision))
print('Acuratetea modelului 100 arbori: {0:0.4f}'.format(accuracy2))
print('Precizia modelului 100 arbori: {0:0.4f}'.format(precision2))