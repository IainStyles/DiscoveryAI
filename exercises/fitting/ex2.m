close all;
clear all;
load ex2.mat
%% Q1
x = q1data(:,1); % Extract the 
y = q1data(:,2);
s = q1data(:,3);
F = [exp(-x),x.^0];
W = diag(s.^-2); % Form the diagonal weight matrix
figure,errorbar(x,y,s,'ko'),hold on;
p = (F'*F)\(F'*y);
plot(x,F*p,'b-');
p = (F'*W*F)\(F'*W*y);
plot(x,F*p,'r-');

%% Q2
x = q2data(:,1);
y = q2data(:,2);
s = q2data(:,3);
F=[];
W=diag(s.^-2);
figure, hold on;
for i=1:5 % Add columns to the left for higher polynomial degree
  F=[x.^(i-1),F];
  p = (F'*W*F)\(F'*W*y);
  err(i) = (y-F*p)'*(y-F*p);
  plot(x,F*p)
end
figure,plot(0:4,err)

%% Q3
f = @(x,p) p(1)*exp(-p(2)*(x-p(3)).*(x-p(3))); % Anon function for f
jac = @(x,p) [ exp(-p(2)*(x-p(3)).*(x-p(3))) , -p(1)*(x-p(3)).*(x-p(3)).*exp(-p(2)*(x-p(3)).*(x-p(3))) , 2*p(1)*p(2)*(x+p(3)).*exp(-p(2)*(x-p(3)).*(x-p(3)))]; % Anon function for the jacobian
[p,e] = LMMin(q3data(:,1),q3data(:,2),rand(3,1),f,jac,1,2,0.00001,1000) % Solve
%% Q4
F = [q4gfp(:,2),q4rfp(:,2)];
Y=[];
for i=500:10:720
  im = double(imread(['image_',num2str(i),'.tif']));
  [nr,nc] = size(im);
  Y = [Y;reshape(im,1,nr*nc)];
end
P = (F'*F)\(F'*Y);
[nr,nc] = size(im);
figure, imagesc(reshape(P(1,:),nr,nc));
figure, imagesc(reshape(P(2,:),nr,nc));