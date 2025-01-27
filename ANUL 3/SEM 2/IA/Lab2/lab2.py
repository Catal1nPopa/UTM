import numpy as np
import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn.naive_bayes import GaussianNB
from sklearn.datasets import load_breast_cancer
breast_cancer = load_breast_cancer()

#print(breast_cancer)

df = pd.DataFrame(
    np.c_[breast_cancer.data, breast_cancer.target],
    columns = [list(breast_cancer.feature_names)+ ['target']]
                 )
print(df)

X = df.iloc[:, 0:-1]
y = df.iloc[:,-1]
X_train, X_val, y_train, y_val = train_test_split(X, y, test_size = 0.2, random_state = 999)

clf = GaussianNB()
clf.fit(X_train, y_train)
print(clf.score(X_val, y_val))

#Predictia (luam datele la un pacient)
pd.set_option('display.max_columns', None)
print(df[99:100])

patient1 = [14.42,19.77,94.48,642.5,0.09752,0.1141,0.09388,0.05839,0.1879,0.0639,0.2895,1.851,2.376,26.85,0.008005,0.02895,0.03321,0.01424,0.01462,0.004452,16.33,30.86,109.5,826.4,0.1431,0.3026,0.3194,0.1565,0.2718,0.09353]

patient1 = np.array([patient1])
#print(patient1)

pred = clf.predict(patient1)

if pred[0] == 0:
    print("Pacientul are cancer")
else:
    print("Pacientul nu are cancer")