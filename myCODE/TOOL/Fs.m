function [F] = Fs(x,t,mc)
% 一维波动方程的驱动项 F
% x 空间变量
% t 时间变量
% mc 驱动模式选择
    if mc == 1
        
%         F = sin(2*t+x);
        F = sin(x);
        
    elseif mc == 2
        
        F = cos(2*t+x);
        
    elseif mc == 3
        
        F = sin(2*t+x);
    elseif mc == 4
        
        F = 0.0;    
    else 
        disp('【驱动项F】错误')
    end
end

