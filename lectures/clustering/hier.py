from clustering import agghier as agg
from scipy.spatial.distance import euclidean as euc
import numpy as np
import matplotlib.pyplot as plt

X = np.array([[0.5,2],[0.5,3.5],[1,3],[3,3],[3,2],[4,5],[5,4]])
clusters = agg.agghier(X,euc,'average')
agg.dendrogram(clusters)
plt.figure()
plt.plot(X[:,0],X[:,1],'ro',markersize=10)
plt.axis([0,6,0,6])
plt.grid(which='major', axis='both')
plt.xlabel('x1')
plt.ylabel('x2')
labels = ['{0}'.format(i) for i in range(X.shape[0])]
for label, x, y in zip(labels, X[:, 0], X[:, 1]):
    plt.annotate(
        label, 
        xy = (x, y), xytext = (-5, 5),
        textcoords = 'offset points', ha = 'right', va = 'bottom')
plt.show()
