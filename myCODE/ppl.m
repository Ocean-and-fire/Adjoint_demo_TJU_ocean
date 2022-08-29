clc;clear;
%% 
data = importdata('results1.txt');

X = data(:,1);
f = data(:,2);
MAE = data(:,3);
RMSE = data(:,4);
%%
figure(1);
subplot(3,1,1)
plot(X,f,'k-','LineWidth',2)
hold on
plot(X,f,'r*','LineWidth',2)
ylabel('目标函数值');
set(gca,'Fontsize',14,'FontWeight','bold')
subplot(3,1,2)
plot(X,MAE,'k-','LineWidth',2)
hold on
plot(X,MAE,'r*','LineWidth',2)
ylabel('MAE');
set(gca,'Fontsize',14,'FontWeight','bold')
subplot(3,1,3)
plot(X,RMSE,'k-','LineWidth',2)
hold on
plot(X,RMSE,'r*','LineWidth',2)
xlabel('优化迭代步数');ylabel('RMSE');
set(gca,'Fontsize',14,'FontWeight','bold')