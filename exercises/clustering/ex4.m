close all;
clear all;

load unit4.mat
nRows = 40;
nCols = 62;
% Define two distance functions
deuc = @(d,c) mean((c-d)'*(c-d));
dcos = @(d,c) acos((d'*c)/(norm(c)*norm(d)));

% 2 clusters
[cmean,ClusterIndex]=kmeans(X,7,dcos);
plotClusterImages(ClusterIndex,nRows,nCols);

XX = X./repmat(sqrt(sum(X.^2)),size(X,1),1);
[cmean,ClusterIndex]=kmeans(XX,5,deuc);
plotClusterImages(ClusterIndex,nRows,nCols)

[T,S] = pca(X);
T = T(:,1:20);
Xp = T'*X;
XXp = Xp./repmat(sqrt(sum(Xp.^2)),size(Xp,1),1);

[cmean,ClusterIndex]=kmeans(XXp,10,deuc);
plotClusterImages(ClusterIndex,nRows,nCols)
