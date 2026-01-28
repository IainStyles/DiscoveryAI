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

figure, plot3(X(1,:),X(2,:),X(3,:),'k.')

Xbar = repmat(mean(X,2),[1,size(X,2)]);

X = X-Xbar;
figure, plot3(X(1,:),X(2,:),X(3,:),'k.')

C = X*X';

[V,S] = eig(C);

Xp = V'*X;

figure, plot3(Xp(1,:),Xp(2,:),Xp(3,:),'k.');
xlabel('PC3'); ylabel('PC2'); zlabel('PC1');

figure, imagesc(reshape(Xp(1,:),[128,128])), axis equal;
figure, imagesc(reshape(Xp(2,:),[128,128])), axis equal;
figure, imagesc(reshape(Xp(3,:),[128,128])), axis equal;

