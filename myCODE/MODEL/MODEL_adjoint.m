function [J,Jn,Jk] = MODEL_adjoint(u)
global c dt dx t_end x_end cons u_n DD p DX DT;    
    %% ������ʼ��
    [tl,xl] = size(u_n);
    lambt = zeros(tl,xl);
    w = 1/50;
    %% lambt��ʼ������ʼ��
    lambt(tl,:)=0;
    %% lambt�߽�������ʼ��
    lambt(:,xl)=0;
    %%
    tlist = 0:dt:t_end-dt;
    xlist = 0:dx:x_end-dx;
    [Xg,Tg] = meshgrid(xlist,tlist);
    % ���ɲ�������(1:���������2:�Ⱦ࣬3:�ǵȾ�)
    [MAPs] = getMap(tl,xl,DD,p,DX,DT);
    Dm = u_n(MAPs);
    Um = u(MAPs);
    Xg = Xg(MAPs);
    Tg = Tg(MAPs);
    [kk,nn] = find(MAPs==1);
    %%
    DU = Dm-Um;
    dd = zeros(length(DU),1);
    for k = tl-1:-1:1
        for n = xl-1:-1:1
            for m = 1:1:length(DU)
               if nn(m)==n && kk(m)==k 
                   dd(m)=1;
               else
                   dd(m)=0;
               end
            end
    %         dsd(k,n) = sum(dd);
            QQ = w*sum(DU.*dd);
            lambt(k,n) =  dt.*QQ...
                       + (1-cons)*lambt(k+1,n)...
                       + cons*lambt(k+1,n+1);

        end
    end
    % sum(dsd)
    %% ��ʼ���ݶ�
    Jn(1)=0.0;
    for i = 1:1:xl-1
        Jn(i+1) = -lambt(2,i)/dt+(c/dx)*(lambt(2,i)-lambt(2,i+1)); 
    end
    %% �߽������ݶ�
    Jk(1)=0.0;
    for i = 1:1:tl-1
        Jk(i+1) = -(c/dx)*lambt(i+1,2); 
    end
    %% Ŀ�꺯��ֵ
    J = 0.5*w*sum(DU.^2);
end

