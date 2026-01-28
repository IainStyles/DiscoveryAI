close all;
clear all;

% Generate some data
n1 = 100;
n2 = 500;
x1 = randn(2,n1) + repmat([2;2],1,n1);
x2 = randn(2,n2) + repmat([7;9],1,n2); 
figure; hold on; axis equal;
plot(x1(1,:),x1(2,:),'bx');
plot(x2(1,:),x2(2,:),'rx');

% Calculate class covariances - note should be the same but won't be
% because of sampling
C1 = cov(x1');
C2 = cov(x2');

% "Gradient" (eq 12) using the covariance of the largest group
m = inv(C2)*(mean(x1,2)-mean(x2,2))

% Constant
c = -0.5*(mean(x1,2)'*inv(C2)*mean(x1,2) - mean(x2,2)'*inv(C2)*mean(x2,2))+log(n1/n2);

% Generate 100 random pts and classify them
xtest = 10*rand(2,100);
class = zeros(1,100); % all class 1 initially
for i=1:size(xtest,2)
    L = m'*xtest(:,i)+c
    if L <= 0
        class(i) = 1;
    end
end
class1pts = xtest(:,class==0);
class2pts = xtest(:,class==1);
plot(class1pts(1,:),class1pts(2,:),'bo');
plot(class2pts(1,:),class2pts(2,:),'ro');