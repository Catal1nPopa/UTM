import matplotlib.pyplot as plt
from sklearn.cluster import DBSCAN
from sklearn.datasets import make_blobs

# Generăm datele
data = make_blobs(n_samples=200, n_features=2, centers=4, cluster_std=1.8, random_state=101)

# Inițializăm și antrenăm modelul DBSCAN
dbscan = DBSCAN(eps=1.0, min_samples=5)
dbscan_labels = dbscan.fit_predict(data[0])

# Afișăm datele cu clusterii atribuiți de DBSCAN
plt.scatter(data[0][:, 0], data[0][:, 1], c=dbscan_labels, cmap='rainbow')
plt.title('DBSCAN')
plt.show()