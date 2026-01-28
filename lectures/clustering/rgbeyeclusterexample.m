close all;
clear all;

% Load in the image
im = imread('rgbeye.jpg');
im = imresize(im,[128,128]);
image(im); axis equal; axis off;
nRows = 128;
nCols = 128;

% Massage it into the right shape: one pixel per column
X = double(reshape(im,[],3)');

% Euclidean distance
deuc = @(d,c) mean((c-d)'*(c-d));

% Normalise
% X = max(X./repmat(sqrt(sum(X.^2)),size(X,1),1),0);

% 2 clusters
[cmean,ClusterIndex]=kmeans(X,10,deuc);
plotClusterImages(ClusterIndex,nRows,nCols);
