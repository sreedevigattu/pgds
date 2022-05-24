## Clustering
Euclidean distance
Centroid:  centre points of the clusters

### K-Means
Euclidean distance, which is the sum of the squared differences between each observation's value and the center of the cluster. The steps look a little bit like this:

- Randomly pick k points in space and call them your cluster centers.
- **Assignment**: Assign each observation in your data set to the cluster that miminizes the Euclidean distance. Minimum of the distances of the each datapoint to the centroids of each of the clusters
- **Optimization**: Recompute the new centroids (center of each cluster) by taking the means of each of the observations in each cluster.
- Repeat steps 2 and 3 until either the centers don't change or your maximum number of iterations has been reached.

### Practical Considerations/Gotchas
- How do you pick k, the number of clusters? One way is to pick the number of clusters that maximizes what's known as a **silhouette score**, which is essentially the ratio of the within-cluster distance to the between-cluster distance. By running our k-means algorithm multiple times, we can pick the k that maximizes the silhouette score. **Silhouette coefficient** is a measure of how similar a data point is to its own cluster (cohesion) compared to other clusters (separation).
    - Business Strategy
- **Cluster Tendency**: Process to evaluate the data to check if the data is feasible for clustering or not. To check cluster tendency, we use Hopkins test. **Hopkins test** examines whether data points differ significantly from uniformly distributed data in the multidimensional space.
- K-means algorithm is non-deterministic. This means that the final outcome of clustering can be different each time the algorithm is run even on the same data set.    
- How to randomly pick the centers for each cluster first step of the algorithm? re-run the algorithm multiple times with different start points to see if your results are robust. 
- Center & scale your data if the different variables aren't in the same or comparable units. Centering means subtracting the mean of each variable from each observation and scaling means dividing by the standard deviation of that variable. Since the distance metric used in the clustering process is the Euclidean distance, you need to bring all your attributes on the same scale. This can be achieved through standardisation.
- How do you know if you even have good clusters? The clusters should make sense using the knowledge that you already have. 
    - Sum of squared errors (SSE) is used as the objective function for K-means clustering with Euclidean distance. The Euclidean distance is calculated from each data point to its nearest centroid. These distances are squared and summed to obtain the SSE. The aim of the algorithm is to minimize the SSE. Note that SSE considers all the clusters formed using the K-means algorithm.
- Clusters are highly dependent on what variables you use in your clustering. If a new variable is added we might see a number of players switch cluster assignments. 
- The clustering process is very sensitive to the presence of outliers in the data. The centroids will not be a true representation of a cluster in the presence of outliers. The sum of squared errors (SSE) will also be very high in the case of outliers. Small clusters will bond with outliers, which may not be the true representation of the natural patterns of clusters in data. Due to these reasons, outliers need to be removed before proceeding with clustering on the data.
- The process may not converge in the given number of iterations. You should always check for convergence.
- The K-Means algorithm does not work with categorical data.    

K-means++ is just an initialisation procedure for K-means. In K-means++ you pick the initial centroids using an algorithm that tries to initialise centroids that are far apart from each other.

[Visualizing K-Means Clustering](https://www.naftaliharris.com/blog/visualizing-k-means-clustering/)

### Segmentation
- RFM:  Need long duration data
    - R (Recency): Number of days since last purchase
    - F (Frequency): Number of tracsactions
    - M (Monetary): Total amount of transactions (revenue contributed)
- RPI: Looks at what kind of **relationship** you have had with the person before, what type of person he/she is, and the **intent** of the person at the time of buying.
    - Relationship
    - Persona
    - Intent
- CDJ: Consumer Decision Journey: Looks at the path that customers take while experiencing your product. For example for youtube, at what level the consumer is churning, different levels would be install, open, watch, how often watching etc.
- Psychographic segmentation is defined as a market segmentation technique where groups are formed according to psychological traits that influence consumption habits drawn from people's lifestyle and preferences.

### Distance measures
Euclidean, Manhattan, Cosine, and Bregman divergence are some distance metrics used for the K-means algorithm. 
- Euclidean is the squared distance from a data point to the centroid. 
- Manhattan is the absolute distance from a data point to the centroid. 
- Cosine is the cosine distance from a data point to the cluster centroid. 
- Bregman divergence is a class of distance metrics that includes Euclidean, Mahalanobis, and Cosine. Basically, Bregman divergence includes all those distance metrics for which the mean is a centroid.

### Initial centroids
Initiation of the centroids in a cluster is one of the most important steps of the K-means algorithm. Many times, random selection of initial centroid does not lead to an optimal solution. In order to overcome this problem, the algorithm is run multiple times with different random initialisations. The sum of squared errors (SSE) are calculated for different initial centroids. The set of centroids with the minimum SSE is selected. Even though this is a very simple method, it is not foolproof. The results of multiple random cluster initialisations will depend on the dataset and the number of clusters selected, however, that still will not give an optimum output every time.  

The other method involves first selecting the centroid of all the data points. Then, for each successive initial centroid, select the point which is the farthest from the already selected centroid. This procedure will ensure that the selection is random, and the centroids are far apart. The disadvantage of this method is that calculating the farthest point will be expensive. In order to avoid this problem, initialisation is carried out on a subset of the dataset.

K-means is not suitable for all shapes, sizes, and densities of clusters. If the natural clusters of a dataset are vastly different from a spherical shape, then K-means will face great difficulties in detecting it. K-means will also fail if the sizes and densities of the clusters are different by a large margin. This is mostly due to using SSE as the objective function, which is more suited for spherical shapes. SSE is not suited for clusters with non-spherical shapes, varied cluster sizes, and densities.

## Hierarchial Clustering
A series of partitions/merges take place, which may run from a single cluster containing all objects to n clusters that each contain a single object or vice-versa.

Dendrogram

One major advantage is that you do not have to pre-define the number of clusters. However, since you compute the distance of each point from every other point, it is time-consuming and needs a lot of processing power.

Linkage: Measure of dissimilarity between clusters having multiple observations
single linkage: minimum of all the pairwise distances between the data points as the representative of the distance between 2 clusters. 
- Single Linkage: Shortest distance between points in the two clusters. Generates loose clusters i.e. intra-cluster variance is very high.
- Complete Linkage: Maximum distance between any 2 points in the clusters. Generates Stable and close knit clusters
- Average Linkage: Average distance between every point of one cluster to every other point of the other cluster.

- Agglomerative (HAC): In agglomerative or bottom-up clustering method we assign each observation to its own cluster. Then, compute the similarity (e.g., distance) between each of the clusters and join the two most similar clusters. Finally, repeat steps 2 and 3 until there is only a single cluster left. The related algorithm is shown below.
- Divisive (HDC): In divisive or top-down clustering method we assign all of the observations to a single cluster and then partition the cluster to two least similar clusters. Finally, we proceed recursively on each cluster until there is one cluster for each observation. There is evidence that divisive algorithms produce more accurate hierarchies than agglomerative  algorithms in some circumstances but is conceptually more complex.

## DBSCAN 
is a density-based clustering algorithm that divides a data set into subgroups of high-density regions. DBSCAN groups together point that are close to each other based on a distance measurement (usually Euclidean distance) and a minimum number of points. It also marks as outliers the points that are in low-density regions.

DBSCAN algorithm requires 2 parameters i.e. Epsom or EPS and MinPoints or MinSamples.

# K-Mode
Data: Categorical
Matching dissimilarity: How many attributes are different?

# K-Prototype
D(x,p) = E(x,p) +λ C(x,p)
Where,
    - x = Any datapoint,
    - y = Prototype of a cluster,
    - D(x,p) = Dissimilarity measure between x and y,
    - E(x,p) = Euclidean distance between continuous attributes of x and y,
    - C(x,p) = number of mismatched categorical attributes between x and y,
    - λ= weightage for categorical variable value that determines the relative importance of numerical categorical attributes.


| | K-Means | K-Mode | K-Prototype|
|---|---|---|---|
| Data | Continuous | Categorical | Categorical + Continuous |
| Dissimilarity Measure | Euclidean Distance | Matching dissimilarity | | 
| Optimization Step | Mean | Mode | |