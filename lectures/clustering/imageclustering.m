close all;
clear all;

im = imread('./rgbeye.jpg');
b = reshape(im(:,:,1),[],1);
g = reshape(im(:,:,2),[],1);
r = reshape(im(:,:,3),[],1);
plot3(b,g,r,'.');
xlabel('B');
ylabel('G');
zlabel('R');
