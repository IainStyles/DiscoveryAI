function [T,S] = pca(X)
    Xt = X - repmat(mean(X,2),1,size(X,2));
    C = Xt*Xt'/(size(X,1)-1);
    [T,S] = eig(C);
    [S,si] = sort(diag(S),'descend');
    T = T(:,si);
end