import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns
from sklearn.model_selection import train_test_split
from sklearn.linear_model import LinearRegression
from sklearn.metrics import mean_absolute_error, mean_squared_error, r2_score

# ce e mai convinabil, sa postezi reels sau postari

#Pasul 2 citirea csv ca DataFrame
vanzari = pd.read_csv("Advertising.csv")
#print(vanzari)

#Pasul 3
#
#folosinf funcțiile info() și describe().

def afisare_info():
    users = vanzari.head()
    print(users.info())
    print(users.describe())

#afisare_info()

#Pasul 3.1
def analiza_date():
    sns.jointplot(x='Sales', y='TV', data=vanzari)
    plt.show()

#analiza_date()

#Pasul 4
def analiza_date2():
    sns.jointplot(x='Sales', y='Radio', data=vanzari)
    plt.show()

#analiza_date2()

#Pasul 5
def d2d_diagram():
    sns.jointplot(data=vanzari, x="Sales", y="TV", kind="hex")
    plt.show()

#d2d_diagram()

#Pasul 6
def airplot():
    sns.pairplot(data=vanzari)
    plt.show()

#airplot()

#Pasul 7
def model_liniar():
    sns.lmplot(data=vanzari, x="Sales", y="TV")
    plt.show()

#model_liniar()

#Pasul 8
X = vanzari[['TV', 'Radio','Newspaper']]
Y = vanzari['Sales']

def date2():
    X_antrenamente, X_test, Y_antrenamente, Y_test = train_test_split(X, Y, test_size=0.3, random_state=101)

    print("Dimensiunile setului de antrenament X:", X_antrenamente.shape)
    print("Dimensiunile setului de testare X:", X_test.shape)
    print("Dimensiunile setului de antrenament y:", Y_antrenamente.shape)
    print("Dimensiunile setului de testare y:", Y_test.shape)

    #pasul 10,11
    lm = LinearRegression()

    #Pasul 12
    lm.fit(X_antrenamente, Y_antrenamente)

    LinearRegression(copy_X=True, fit_intercept=True, n_jobs=1,positive=False)
    #Pasul 13
    print("Coeficienții modelului sunt:")
    print("Coeficienții:", lm.coef_)

    #Pasul 14
    predictie = lm.predict(X_test)

    #Pasul 15
    plt.scatter(Y_test, predictie)
    plt.xlabel("Valori reale de test")
    plt.ylabel("Valori prezise")
    plt.title("Diagramă de dispersie a valorilor reale de test vs. valorile prezise")
    plt.show()

    #Pasul 16
    eroarea_medie_absoluta = mean_absolute_error(Y_test, predictie)
    eroarea_medie_patratica = mean_squared_error(Y_test, predictie)
    radacina_eraore_medie_absoluta = np.sqrt(eroarea_medie_patratica)
    r2 = r2_score(Y_test, predictie)

    print("MAE:Eroarea medie absoluta:", eroarea_medie_absoluta)
    print("MSE:Eroarea medie patratica:", eroarea_medie_patratica)
    print("RMSE:Radacina eroare medie absoluta :", radacina_eraore_medie_absoluta)
    print("R^2 (Scorul de varianță):", r2)

    #Pasul 17
    reziduri = Y_test - predictie

    # Trasează o histogramă a reziduurilor
    plt.figure(figsize=(8, 6))
    sns.histplot(reziduri, kde=True)
    plt.title('Histograma reziduurilor')
    plt.xlabel('Reziduuri')
    plt.ylabel('Frecvență')
    plt.show()

    #Pasul 18
    new_datafreame = pd.DataFrame(lm.coef_)
    new_datafreame = new_datafreame.rename(index=dict(zip(new_datafreame.index, X)))
    print(new_datafreame)

date2()