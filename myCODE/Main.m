clc;clear;close all;
%% ����ӳ���·��
setPath
%% ����ȫ�ֱ���
global c dt dx t_end x_end tlen xlen ...
    mycase cons seed u_n DD p DX DT RN window;
%% ȫ�ֲ����趨 
seed = 2022;
window = 10;
max_iters = 5;
% ģʽ����
c = 0.9;
dt = 0.1;
dx = 0.2;
t_end = 20;
x_end = 20;
tlen = t_end/dt;
xlen = x_end/dx;
cons = c*dt/dx;
RN = 0.5; % �������

mycase = 2;% ����������������
% ��������
DD = 1;
p = 0.6;
DX = [];
DT = [];
rng(seed);%����������ӣ��̶��������
%% ���ɹ۲ⳡ
[u0,u_n,XB0,TB0] = MODEL_gan();
u1 = u_n(end-window+1:end,:); 
%% ��ʼ������ʼ��
XB = 1*zeros(1,xlen);
%% �߽�������ʼ��
TB = 1*zeros(tlen,1);
%% ����
B0 = [XB';TB];
[f,g] = MODEL_cal(B0);
[u2] = MODEL_forward(B0);%ģʽ��
nn = length(B0);
ll = -1*ones(nn,1);
uu = 1*ones(nn,1);
opts = struct('display',true,'xhistory',true,'max_iters',max_iters);
B = LBFGSB(@MODEL_cal,B0,ll,uu,opts);
%% ͬ�������
[u3] = MODEL_forward(B);%ͬ����
XB = transpose(B(1:xlen,:));
TB = B(xlen+1:end,:);
save data4 TB TB0 XB XB0 u_n u3
%% ͬ�������ͼ
figure(1)
set(gcf,'Position',[100 100 990 650]);
subplot(2,3,[1,2])
x = 1:length(TB);
plot(x,TB,'b*','LineWidth',2)
hold on 
plot(x,TB0,'k-','LineWidth',2)
ylim([-1,1])
legend('ͬ�����:��ʼ����','��ʵ���:��ʼ����');
xlabel('t/s');ylabel('u/(m/s)');title('��ʼ����')
set(gca,'Fontsize',14,'FontWeight','bold')
subplot(2,3,3)
plot(-1:1,-1:1,'k-','LineWidth',2)
hold on 
plot(TB,TB0,'r*','LineWidth',2);
xlim([-1,1])
ylim([-1,1])
xlabel('ͬ�����');ylabel('��ʵ���');
set(gca,'Fontsize',14,'FontWeight','bold')
subplot(2,3,[4,5])
x = 1:length(XB);
plot(x,XB,'b*','LineWidth',2)
hold on 
plot(x,XB0,'k-','LineWidth',2)
ylim([-1,1])
legend('ͬ�����:�߽�����','��ʵ���:�߽�����');
xlabel('x/m');ylabel('u/(m/s)');title('�߽�����')
set(gca,'Fontsize',14,'FontWeight','bold')
subplot(2,3,6)
plot(-1:1,-1:1,'k-','LineWidth',2)
hold on 
plot(XB,XB0,'r*','LineWidth',2);
xlim([-1,1])
ylim([-1,1])
xlabel('ͬ�����');ylabel('��ʵ���');
set(gca,'Fontsize',14,'FontWeight','bold')
%% ��ʵ��vs�۲ⳡvs������vs������
figure(2)
set(gcf,'Position',[100 100 990 650]);
subplot(2,2,1)
surf(u0);
zlim([-2,2])
xlabel('x/m');ylabel('t/s');zlabel('u/(m/s)');title('��ʵ��')
set(gca,'Fontsize',14,'FontWeight','bold')
subplot(2,2,2)
surf(u_n);
zlim([-2,2])
xlabel('x/m');ylabel('t/s');zlabel('u/(m/s)');title('�۲ⳡ')
set(gca,'Fontsize',14,'FontWeight','bold')
subplot(2,2,3)
surf(u2);
zlim([-2,2])
xlabel('x/m');ylabel('t/s');zlabel('u/(m/s)');title('������')
set(gca,'Fontsize',14,'FontWeight','bold')
subplot(2,2,4)
surf(u3);
zlim([-2,2])
xlabel('x/m');ylabel('t/s');zlabel('u/(m/s)');title('������')
set(gca,'Fontsize',14,'FontWeight','bold')
%% 