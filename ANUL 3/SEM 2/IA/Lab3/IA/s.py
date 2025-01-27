import seaborn as sns
import matplotlib.pyplot as plt
from sklearn.cluster import KMeans, AgglomerativeClustering, DBSCAN
from sklearn.mixture import GaussianMixture
from sklearn.datasets import make_blobs
from sklearn.metrics import silhouette_score


data = make_blobs(n_samples=200, n_features=2, centers=4, cluster_std=1.8, random_state=101)

# Metrici de evaluare
def evaluate_clustering(labels, data):
    silhouette = silhouette_score(data, labels)
    return silhouette

from sklearn.cluster import KMeans
kmeans = KMeans(n_clusters=4, init='k-means++', max_iter=300, random_state=42)
kmeans.fit(data[0])
kmeans_silhouette = evaluate_clustering(kmeans.labels_, data[0])
kmeans_inertia = kmeans.inertia_

# Algoritmul Agglomerative Clustering
agg = AgglomerativeClustering(n_clusters=4)
agg_labels = agg.fit_predict(data[0])
agg_silhouette = evaluate_clustering(agg_labels, data[0])

# Algoritmul DBSCAN
dbscan = DBSCAN(eps=3.0, min_samples=5)
dbscan_labels = dbscan.fit_predict(data[0])
dbscan_silhouette = evaluate_clustering(dbscan_labels, data[0])

# Algoritmul EM (Expectation Maximization)
gmm = GaussianMixture(n_components=4, covariance_type='full', random_state=42)
gmm.fit(data[0])
gmm_labels = gmm.predict(data[0])
gmm_silhouette = evaluate_clustering(gmm_labels, data[0])

# Creăm figura și subploturile
fig, axs = plt.subplots(2, 2, figsize=(12, 10))

# Plot pentru k-Means
axs[0, 1].scatter(data[0][:, 0], data[0][:, 1], c=kmeans.labels_, cmap='rainbow')
axs[0, 1].scatter(kmeans.cluster_centers_[:, 0], kmeans.cluster_centers_[:, 1])
axs[0, 1].set_title('K-Means\nSilhouette: {:.2f}'.format(kmeans_silhouette))

# Plot pentru Agglomerative Clustering
axs[1, 0].scatter(data[0][:, 0], data[0][:, 1], c=agg_labels, cmap='rainbow')
axs[1, 0].set_title('Agglomerative Clustering\nSilhouette: {:.2f}'.format(agg_silhouette))

# Plot pentru DBSCAN
axs[1, 1].scatter(data[0][:, 0], data[0][:, 1], c=dbscan_labels, cmap='rainbow')
axs[1, 1].set_title('DBSCAN\nSilhouette: {:.2f}'.format(dbscan_silhouette))

# Plot pentru Expectation Maximization (EM)
axs[0, 0].scatter(data[0][:, 0], data[0][:, 1], c=gmm_labels, cmap='rainbow')
axs[0, 0].set_title('Expectation Maximization\nSilhouette: {:.2f}'.format(gmm_silhouette))

# Afișăm ploturile
plt.tight_layout()
plt.show()
