function [F] = Fs(x,t,mc)
% һά�������̵������� F
% x �ռ����
% t ʱ�����
% mc ����ģʽѡ��
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
        disp('��������F������')
    end
end

