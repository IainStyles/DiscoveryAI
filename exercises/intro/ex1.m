% 1a
A = [1,1,1;2,3,-1;3,-1,2];
b = [5;7;2];
x=A\b
A*x

% 1b
A = [2,-1,4;-1,4,-5];
b = [8;-3];
x=A\b
A*x

% 1c
A = [2,1,-1;-3,2,1;5,-2,3;3,1,1]
b = [2;-5;0;-2]
x=A\b
A*x

% 2a
x = [3.1, 2.9, 3.0, 3.5, 2.6, 2.9, 3.0]
mean(x)
median(x)
std(x)

% 2b
x = [3.1, 2.9, 3.0, 3.2, 2.9, 2.9, 6.0]
mean(x)
median(x)
std(x)

% 3
x = [0:0.1:5];
y = sin(x).^2;
plot(x,y,'r:s')
xlabel('x')
ylabel('y')
title('Plot of y vs sin^2(x)')

% 4
%x = [0.2,1.5,3.1,4.6,5.8,7.4];
%y = randn(10,length(x)) + repmat(10*exp(-x),10,1)
load ex1q4.mat
figure();
errorbar(q4x,mean(q4y),std(q4y),'k--o');
xlabel('x')
ylabel('y')