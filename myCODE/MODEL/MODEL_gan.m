function [u,u_n,XB0,TB0] = MODEL_gan()
global c dt dx t_end x_end tlen xlen mycase cons seed RN ;    

    u = zeros(tlen,xlen);
    %% 初始条件初始化
    Xs = linspace(0,2*pi,xlen);
    XB0=0.5*sin(Xs);
    u(1,:)=XB0;
    %% 边界条件初始化
    Ts = linspace(0,2*pi,tlen); 
    TB0=0.5*sin(Ts);
    u(:,1)=TB0;
    %%
    u_n = u;  %叠加噪声u
    tlist = 0:dt:t_end-dt;
    xlist = 0:dx:x_end-dx;
    for k = 2:tlen
        for n = 2:xlen

            t = tlist(k);
            x = xlist(n);

            F = Fs(x,t,mycase);

            u(k,n) =  dt*F...
                   + (1-cons)*u(k-1,n)...
                   + cons*u(k-1,n-1);   


        end
    u_n(k,2:end) =  u(k,2:end) + RN*randn(1,xlen-1);    
    end
    
end

