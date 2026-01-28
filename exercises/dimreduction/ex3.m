close all;
clear all;

load unit4.mat
[T,S]=pca(X);
TV = sum(S);
plot(cumsum(S)/TV)

for i=1:10
    figure();
    imagesc(reshape(T(:,i)'*X,nRows,nCols));
    colorbar; colormap gray;
end