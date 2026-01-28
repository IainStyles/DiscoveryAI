close all;
clear all;
set(0, 'DefaultAxesFontSize',16)
% set(0, 'DefaultLineWidth',2)
%% Define a gaussin
gaussian = @(sigma,x0,x) exp(-((x-x0).^2)/(2*sigma^2))/(sigma*sqrt(2*pi));

%% Probability distribution
x = 0:0.1:10;
sigma = 1;
x0 = 5;
figure, plot(x,gaussian(sigma,x0,x),'b-','LineWidth',2);
xlabel('x');
ylabel('p(x)')

%% Fitting
y = -3*x+5;
z = -3*(1:9)+5 + randn(1,9);
figure,plot(x,y,'b--','LineWidth',2)
hold on, errorbar(1:9,z,randn(1,9),'kx');
xlabel('t');
ylabel('log[H_2O_2]','LineWidth',2)

%% Probability distribution
x = 0:0.1:10;
sigma = 1;
x0 = 5;
figure, plot(x,gaussian(sigma,x0,x),'b-','LineWidth',2);
xlabel('x');
ylabel('p(x)')
hold on;
line([4,4],[0,gaussian(sigma,x0,4)],'Color','red','LineWidth',2)
line([4.2,4.2],[0,gaussian(sigma,x0,4.2)],'Color','red','LineWidth',2)
line([3.5,4],[0.1,0.1],'Color','black','LineWidth',2)
line([4.7,4.2],[0.1,0.1],'Color','black','LineWidth',2)
line([4,3.8],[0.1,0.11],'Color','black','LineWidth',2)
line([4,3.8],[0.1,0.09],'Color','black','LineWidth',2)
line([4.2,4.4],[0.1,0.11],'Color','black','LineWidth',2)
line([4.2,4.4],[0.1,0.09],'Color','black','LineWidth',2)
text(4.25,0.12,'dx','FontSize',16,'Color','black');
%% Normal distribution averages
x = 0:0.1:10;
sigma = 1;
x0 = 5;
figure, plot(x,gaussian(sigma,x0,x),'b-','LineWidth',2);
xlabel('x');
ylabel('p(x)')

hold on;
line([5,5],[0,gaussian(sigma,x0,5)],'Color','red','LineWidth',2)
text(5.1,0.15,'mean','FontSize',16,'Color','red')
text(5.1,0.1,'median','FontSize',16,'Color','red')
text(5.1,0.05,'mode','FontSize',16,'Color','red')
%% Lognormal averages
sigma = 0.5;
x0 = 0.5;
x = [0:0.001:10];
lognormal = @(sigma,x0,x) exp(-((log(x)-x0).^2)/(2*sigma^2))./(x*sigma*sqrt(2*pi));
figure, plot(x,lognormal(sigma,x0,x),'b-','LineWidth',2);
mean = exp(x0+0.5*sigma^2);
median = exp(x0);
mode = exp(x0-sigma^2);
line([mean,mean],[0,lognormal(sigma,x0,mean)],'Color','red','LineWidth',2)
line([median,median],[0,lognormal(sigma,x0,median)],'Color','black','LineWidth',2)
line([mode,mode],[0,lognormal(sigma,x0,mode)],'Color','magenta','LineWidth',2)
text(mean+0.1,lognormal(sigma,x0,mean),'mean','FontSize',16,'Color','red');
text(median+0.1,lognormal(sigma,x0,median),'median','FontSize',16,'Color','black');
text(mode+0.1,lognormal(sigma,x0,mode),'mode','FontSize',16,'Color','magenta');
