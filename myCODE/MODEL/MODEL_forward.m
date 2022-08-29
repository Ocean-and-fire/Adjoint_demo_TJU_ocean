function [u] = MODEL_forward(B0)
global c dt dx t_end x_end tlen xlen mycase cons seed; 

    u = zeros(tlen,xlen);
    XB = transpose(B0(1:xlen,:));
    TB = B0(xlen+1:end,:);
    %% 初始条件初始化
    u(1,:)=XB;
    %% 边界条件初始化
    u(:,1)=TB;
    %%
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
    end
end

