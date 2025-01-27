import matplotlib.pyplot as plt
from sklearn.cluster import AgglomerativeClustering
from sklearn.datasets import make_blobs

# Generăm datele
data = make_blobs(n_samples=200, n_features=2, centers=4, cluster_std=1.8, random_state=101)
# Inițializăm și antrenăm modelul Agglomerative Clustering
agg = AgglomerativeClustering(n_clusters=4)
agg_labels = agg.fit_predict(data[0])

# Afișăm datele cu clusterii atribuiți de Agglomerative Clustering
plt.scatter(data[0][:, 0], data[0][:, 1], c=agg_labels, cmap='rainbow')
plt.title('Agglomerative Clustering')
plt.show()