close all;
clear all;

% Gaussian function
%gauss = @(x,x0,w) exp(-((x-x0).^2)./(2*w.^2));
% Create  two groups of points
N1=475;
N2=25;

%healthy = [0.707,0.707;-0.707,0.707]*randn(2,N1).*repmat([0.5;1],1,N1) + repmat([3;8],1,N1);
%diseased = [0.707,0.707;-0.707,0.707]*(randn(2,N2).*repmat([0.5;0.25],1,N2)) + repmat([6;13],1,N2);

load unit6

figure(), hold on;
plot(healthy(1,:), healthy(2,:),'bo')
plot(diseased(1,:), diseased(2,:),'ro')


mu1 = mean(healthy,2);
mu2 = mean(diseased,2);

% Calculate class covariances
Sig1 = (healthy-repmat(mu1,1,N1))*(healthy-repmat(mu1,1,N1))'/(N1-1);
Sig2 = (diseased-repmat(mu2,1,N2))*(diseased-repmat(mu2,1,N2))'/(N2-1);

% Compute the coefficients in the discriminant
A = -0.5*(inv(Sig1)-inv(Sig2))
b = inv(Sig1)*mu1  - inv(Sig2)*mu2
c = -0.5*(log(det(Sig1)/det(Sig2))+mu1'*inv(Sig1)*mu1 - mu2'*inv(Sig2)*mu2) - log(N1/N2)

Q = @(x,A,b,c) x'*A*x + b'*x + c;

allpts = [healthy,diseased];
mima = minmax(allpts);
nTestPts = 2000;
newpts = repmat(mima(:,1),1,nTestPts)+rand(2,nTestPts).*(1.25*repmat(mima(:,2),1,nTestPts)-repmat(mima(:,1),1,nTestPts));
q = zeros(nTestPts,1);
for ii=1:nTestPts
    q(ii) = Q(newpts(:,ii),A,b,c);
end
xclass = q>0;
xhealthy = newpts(:,xclass==1);
xdiseased = newpts(:,xclass==0);
plot(xhealthy(1,:),xhealthy(2,:),'bx');
plot(xdiseased(1,:),xdiseased(2,:),'rx');
axis tight;axis square; 