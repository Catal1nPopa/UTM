#PASUL 1

import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns
from sklearn.model_selection import train_test_split
from sklearn.linear_model import LinearRegression
from sklearn.metrics import mean_absolute_error, mean_squared_error, r2_score

#%matplotlib inline

# PASUL 2
customers = pd.read_csv("Customers.csv")
#print(customers)

#PASUL 3
#print(customers.head())
#print(customers.info())
#print(customers.describe())

#PASUL 3.1
#sns.jointplot(x='Time on Website', y='Yearly Amount Spent', data=customers)
#plt.show()

#PASUL 4
#sns.jointplot( data=customers,x='Time on App', y='Yearly Amount Spent')
#plt.show()

#PASUL 5
#sns.jointplot(data=customers, x="Time on App", y="Length of Membership", kind="hex")
#plt.show()

#PASUL 6
#sns.pairplot(data=customers)
#plt.show()

#PASUL 7
#sns.lmplot(data=customers, x="Length of Membership", y="Yearly Amount Spent")
#plt.show()

#PASUL 8

X = customers[['Avg. Session Length', 'Time on App', 'Time on Website', 'Length of Membership']]
Y = customers['Yearly Amount Spent']

#PASUL 9
X_antrenamente, X_test, Y_antrenamente, Y_test = train_test_split(X, Y, test_size=0.3, random_state=101)

print("Dimensiunile setului de antrenament X:", X_antrenamente.shape)
print("Dimensiunile setului de testare X:", X_test.shape)
print("Dimensiunile setului de antrenament y:", Y_antrenamente.shape)
print("Dimensiunile setului de testare y:", Y_test.shape)

# pasul 10,11:
lm = LinearRegression()

# PASUL 12:
lm.fit(X_antrenamente, Y_antrenamente)

# Pasul 13:
print("Coeficienții modelului sunt:")
print("Intercept:", lm.intercept_)
print("Coeficienții:", lm.coef_)

# PASUL 14: Utilizați lm.predict() pentru a prezice setul X_test de date
predictie = lm.predict(X_test)

# PASUL 15: Creați o diagramă de dispersie a valorilor reale de test față de valorile prezise
plt.scatter(Y_test, predictie)
plt.xlabel("Valori reale de test")
plt.ylabel("Valori prezise")
plt.title("Diagramă de dispersie a valorilor reale de test vs. valorile prezise")
plt.show()

# PASUL 16: Calculați eroarea medie absolută, eroarea medie pătratică și eroarea medie pătratică
eroarea_medie_absoluta = mean_absolute_error(Y_test, predictie)
eroarea_medie_patratica = mean_squared_error(Y_test, predictie)
radacina_eraore_medie_absoluta = np.sqrt(eroarea_medie_patratica)  # np.sqrt() pentru a obține rădăcina pătrată a MSE
r2 = r2_score(Y_test, predictie)

# Afișați rezultatele
print("MAE:Eroarea medie absoluta:", eroarea_medie_absoluta)
print("MSE:Eroarea medie patratica:", eroarea_medie_patratica)
print("RMSE:Eroarea medie :", radacina_eraore_medie_absoluta)
print("R^2 (Scorul de varianță):", r2)

# pasul 17
# Calculează reziduurile
reziduri = Y_test - predictie

# Trasează o histogramă a reziduurilor
plt.figure(figsize=(8, 6))
sns.histplot(reziduri, kde=True)
plt.title('Histograma reziduurilor')
plt.xlabel('Reziduuri')
plt.ylabel('Frecvență')
plt.show()

#PASUL 18
new_datafreame = pd.DataFrame(lm.coef_)
print(new_datafreame)
#????????????