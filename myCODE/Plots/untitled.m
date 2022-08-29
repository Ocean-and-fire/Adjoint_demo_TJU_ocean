clc;clear;
%% 
data = importdata('results1.txt');
X1 = data(:,1);
f1 = data(:,2);
MAE1 = data(:,3);
RMSE1 = data(:,4);
data = importdata('results2.txt');
X2 = data(:,1);
f2 = data(:,2);
MAE2 = data(:,3);
RMSE2 = data(:,4);
data = importdata('results3.txt');
X3 = data(:,1);
f3 = data(:,2);
MAE3 = data(:,3);
RMSE3 = data(:,4);
data = importdata('results4.txt');
X4 = data(:,1);
f4 = data(:,2);
MAE4 = data(:,3);
RMSE4 = data(:,4);
%%
figure(1);
subplot(3,1,1)
plot(X1,f1,'k-','LineWidth',2)
hold on
plot(X2,f2,'r-','LineWidth',2)
hold on
plot(X3,f3,'g-','LineWidth',2)
hold on
plot(X4,f4,'b-','LineWidth',2)
legend('L-BFGS-B','L-BFGS','GA','PSO');
ylabel('目标函数值');
set(gca,'Fontsize',14,'FontWeight','bold')
subplot(3,1,2)
plot(X1,MAE1,'k-','LineWidth',2)
hold on
plot(X2,MAE2,'r-','LineWidth',2)
hold on
plot(X3,MAE3,'g-','LineWidth',2)
hold on
plot(X4,MAE4,'b-','LineWidth',2)
hold on
legend('L-BFGS-B','L-BFGS','GA','PSO');
ylabel('MAE');
set(gca,'Fontsize',14,'FontWeight','bold')
subplot(3,1,3)
plot(X1,RMSE1,'k-','LineWidth',2)
hold on
plot(X2,RMSE2,'r-','LineWidth',2)
hold on
plot(X3,RMSE3,'g-','LineWidth',2)
hold on
plot(X4,RMSE4,'b-','LineWidth',2)
hold on
legend('L-BFGS-B','L-BFGS','GA','PSO');
xlabel('优化迭代步数');ylabel('RMSE');
set(gca,'Fontsize',14,'FontWeight','bold')