import matplotlib.pyplot as plt
from sklearn.cluster import KMeans
from sklearn.datasets import make_blobs

# Generăm datele
data = make_blobs(n_samples=200, n_features=2, centers=4, cluster_std=1.8, random_state=101)

# Afișăm datele originale
plt.scatter(data[0][:, 0], data[0][:, 1], c=data[1], cmap='rainbow')
plt.title('Original')


# Inițializăm și antrenăm modelul K-Means
kmeans = KMeans(n_clusters=4)
kmeans.fit(data[0])

# Obținem etichetele clusterelor
kmeans_labels = kmeans.labels_

# Afișăm datele cu clusterii atribuiți de K-Means
plt.scatter(data[0][:, 0], data[0][:, 1], c=kmeans_labels, cmap='rainbow')
plt.scatter(kmeans.cluster_centers_[:, 0], kmeans.cluster_centers_[:, 1], marker='x', s=200, color='black')
plt.title('K-Means')
plt.show()
