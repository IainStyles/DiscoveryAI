close all;
clear all;
set(0, 'DefaultAxesFontSize',16)
% set(0, 'DefaultLineWidth',2)

%%
xx = 1:9;
yy = xx.^2;
zz = yy + 20*randn(size(yy));
figure, plot(xx,zz,'ko','MarkerSize',10,'MarkerEdgeColor','r','MarkerFaceColor','r');
hold on;
x = 0:0.1:10;
y1 = x.^2;
y2 = 7.5*x;
y3 = 5*x;
plot(x,y1,'b-','LineWidth',2);
plot(x,y2,'g-','LineWidth',2);
plot(x,y3,'y-','LineWidth',2);

saveas(gcf,'possiblefits.png','png')



%% Residuals

x = 0:0.1:10;
y = x.^2;
xx = 1:9;
yy = xx.^2;
zz = yy + 20*randn(size(yy));
figure, plot(x,y,'b-','LineWidth',2);
hold on;
plot(xx,zz,'ko','MarkerSize',10,'MarkerEdgeColor','r','MarkerFaceColor','r')
for i=1:length(xx)
	line([xx(i),xx(i)],[yy(i),zz(i)],'Color','red','LineWidth',2);
	text(xx(i)+0.1,mean([yy(i),zz(i)]),sprintf('r_%d', i),'FontSize',16,'Color','black');
end
xlabel('x');
ylabel('y')

saveas(gcf,'residuals.png','png');

%% Weighted Fits
x = 0:0.1:10;
y = x.^2;
xx = 1:9;
yy = xx.^2;
zz = 10*ones(size(xx)).*rand(size(yy));
yy(1:3) = yy(1:3) + [15,10,5];
zz(1:3) = zz(1:3) + [15,10,5];
figure, plot(x,y,'b-','LineWidth',2);
hold on;
errorbar(xx,yy,zz,'ko','MarkerSize',10,'MarkerEdgeColor','r','MarkerFaceColor','r','LineWidth',2);
xlabel('x');
ylabel('y')

saveas(gcf,'weighted.png','png');

