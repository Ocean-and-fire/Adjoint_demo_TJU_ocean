function [MAPs] = getMap(tlen,xlen,dd,p,DX,DT)
% ������� MaskMap ����
% tlen ʱ��γ��
% xlen �ռ�ά��
% dd ����ģʽѡ��
% p ���������
% DX �Ⱦ����ģʽ�£��ռ�����������ѡ��[]
% DT �Ⱦ����ģʽ�£�ʱ������������ѡ��[]

    if dd == 1
        % ���������������
%         p = 0.6;
        MAPs = binornd(1,p,tlen,xlen);
        
    elseif dd == 2
        % ���ɵȼ���������
%         DX = 4;
%         DT = 5;
        MAPs = zeros(tlen,xlen);
        for k = 1:DT:tlen
            for i = 1:DX:xlen
                MAPs(k,i)=1;
            end
        end
        
    elseif dd == 3
        % ���ɷǵȼ���������
%         p = 0.6;
        DX = binornd(1,p,1,xlen);
        DT = binornd(1,p,tlen,1);
        MAPs = zeros(tlen,xlen);
        for i = 1:xlen
            if DX(i)==1 
                MAPs(:,i)=DT;
            end
        end
    end
    
    MAPs = logical(MAPs);
end

