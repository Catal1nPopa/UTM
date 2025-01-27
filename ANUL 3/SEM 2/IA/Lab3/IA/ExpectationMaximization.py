import matplotlib.pyplot as plt
from pandas import read_csv
from sklearn.mixture import GaussianMixture
from sklearn.datasets import make_blobs


# Generăm datele
#data = make_blobs(n_samples=200, n_features=2, centers=4, cluster_std=1.8, random_state=101)
data = read_csv("OnlineRetail.csv");

# Inițializăm și antrenăm modelul EM
gmm = GaussianMixture(n_components=4, covariance_type='full', random_state=42)
gmm.fit(data[0])

# Obținem etichetele prezise de modelul EM
gmm_labels = gmm.predict(data[0])

# Afișăm datele cu clusterii atribuiți de EM
plt.scatter(data[0][:, 0], data[0][:, 1], c=gmm_labels, cmap='rainbow')
plt.title('Expectation Maximization (EM)')
plt.show()
