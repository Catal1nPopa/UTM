# Importă bibliotecile necesare
import numpy as np
from sklearn import datasets
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import StandardScaler
from sklearn.svm import SVC
from sklearn.metrics import accuracy_score
from sklearn.metrics import precision_score

# Încarcă setul de date Iris
iris = datasets.load_iris()
X = iris.data
y = iris.target

# Împarte setul de date în set de antrenare și set de testare
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.3, random_state=42)

# Standardizează datele
sc = StandardScaler()
X_train_std = sc.fit_transform(X_train)
X_test_std = sc.transform(X_test)

# Inițializează clasificatorul SVM
svm = SVC(kernel='linear', C=1.0, random_state=42)

svm.fit(X_train_std, y_train)

# Prezice clasele pentru setul de testare
y_pred = svm.predict(X_test_std)

# Calculează acuratețea
accuracy = accuracy_score(y_test, y_pred)
print("Acuratețea clasificatorului SVM: {:.2f}".format(accuracy))
precision = precision_score(y_test, y_pred, average='weighted')
print("Precizia clasificatorului SVM: {:.2f}".format(precision))