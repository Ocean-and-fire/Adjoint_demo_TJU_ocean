clc;clear;
%%
load data1.mat
TB1 = TB;
XB1 = XB;
un1 = u_n;
U1 = u3;
load data2.mat
TB2 = TB;
XB2 = XB;
un2 = u_n;
U2 = u3;
load data3.mat
TB3 = TB;
XB3 = XB;
un3 = u_n;
U3 = u3;
load data4.mat
TB4 = TB;
XB4 = XB;
un4 = u_n;
U4 = u3;
%% 同化结果绘图
figure(1)
set(gcf,'Position',[100 100 990 650]);
subplot(2,4,[1,3])
x = 1:length(TB);
plot(x,TB0,'k-','LineWidth',2)
hold on 
plot(x,TB1,'b-','LineWidth',2)
hold on 
plot(x,TB2,'g-','LineWidth',2)
hold on 
plot(x,TB3,'m-','LineWidth',2)
hold on 
plot(x,TB4,'r-','LineWidth',2)
hold on 
ylim([-1,1])
legend('真实','采样1','采样2','采样3','采样4');
xlabel('t/s');ylabel('u/(m/s)');title('初始条件')
set(gca,'Fontsize',14,'FontWeight','bold')

subplot(2,4,4)
Rs1 = RMSE(TB1,TB0');
Rs2 = RMSE(TB2,TB0');
Rs3 = RMSE(TB3,TB0');
Rs4 = RMSE(TB4,TB0');
RS =[Rs1,Rs2,Rs3,Rs4];
bar(1,Rs1,'b','LineWidth',2)
hold on 
bar(2,Rs2,'g','LineWidth',2)
hold on 
bar(3,Rs3,'m','LineWidth',2)
hold on 
bar(4,Rs4,'r','LineWidth',2)
hold on 
set(gca, 'xtick', 1:1:4);
set(gca,'xticklabel',{'1','2','3','4'},'FontSize',15);
xlabel('采样');ylabel('RMSE');
set(gca,'Fontsize',14,'FontWeight','bold')
subplot(2,4,[5,7])
x = 1:length(XB);
plot(x,XB0,'k-','LineWidth',2)
hold on 
plot(x,XB1,'b-','LineWidth',2)
hold on 
plot(x,XB2,'g-','LineWidth',2)
hold on 
plot(x,XB3,'m-','LineWidth',2)
hold on 
plot(x,XB4,'r-','LineWidth',2)
hold on 
ylim([-1,1])
legend('真实','采样1','采样2','采样3','采样4');
xlabel('x/m');ylabel('u/(m/s)');title('边界条件')
set(gca,'Fontsize',14,'FontWeight','bold')
subplot(2,4,8)
Rs1 = RMSE(XB1,XB0);
Rs2 = RMSE(XB2,XB0);
Rs3 = RMSE(XB3,XB0);
Rs4 = RMSE(XB4,XB0);
% RS =[Rs1,Rs2,Rs3,Rs4];
bar(1,Rs1,'b','LineWidth',2)
hold on 
bar(2,Rs2,'g','LineWidth',2)
hold on 
bar(3,Rs3,'m','LineWidth',2)
hold on 
bar(4,Rs4,'r','LineWidth',2)
hold on 
set(gca, 'xtick', 1:1:4);
set(gca,'xticklabel',{'1','2','3','4'},'FontSize',15);
xlabel('采样');ylabel('RMSE');
set(gca,'Fontsize',14,'FontWeight','bold')
% %% 真实场vs观测场vs背景场vs分析场
% figure(2)
% set(gcf,'Position',[100 100 990 650]);
% subplot(4,2,1)
% surf(un1);
% zlim([-2,2])
% zlabel('噪声0.08','rotation',0);title('观测场')
% set(gca,'Fontsize',14,'FontWeight','bold')
% subplot(4,2,2)
% surf(U1);
% zlim([-2,2])
% zlabel('u/(m/s)');title('分析场')
% set(gca,'Fontsize',14,'FontWeight','bold')
% subplot(4,2,3)
% surf(un3);
% zlim([-2,2])
% zlabel('噪声0.1','rotation',0);
% set(gca,'Fontsize',14,'FontWeight','bold')
% subplot(4,2,4)
% surf(U3);
% zlim([-2,2])
% zlabel('u/(m/s)');
% set(gca,'Fontsize',14,'FontWeight','bold')
% subplot(4,2,5)
% surf(un4);
% zlim([-2,2])
% zlabel('噪声0.5','rotation',0);
% set(gca,'Fontsize',14,'FontWeight','bold')
% subplot(4,2,6)
% surf(U4);
% zlim([-2,2])
% zlabel('u/(m/s)');
% set(gca,'Fontsize',14,'FontWeight','bold')
% subplot(4,2,7)
% surf(un2);
% zlim([-2,2])
% xlabel('x/m');ylabel('t/s');zlabel('噪声0.8','rotation',0);
% set(gca,'Fontsize',14,'FontWeight','bold')
% subplot(4,2,8)
% surf(U2);
% zlim([-2,2])
% xlabel('x/m');ylabel('t/s');zlabel('u/(m/s)');
% set(gca,'Fontsize',14,'FontWeight','bold')
% %% 