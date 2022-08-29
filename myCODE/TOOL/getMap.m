function [MAPs] = getMap(tlen,xlen,dd,p,DX,DT)
% 随机采样 MaskMap 生成
% tlen 时间纬度
% xlen 空间维度
% dd 采样模式选择
% p 随机采样率
% DX 等距采样模式下，空间采样间隔，非选令[]
% DT 等距采样模式下，时间采样间隔，非选令[]

    if dd == 1
        % 生成随机采样矩阵
%         p = 0.6;
        MAPs = binornd(1,p,tlen,xlen);
        
    elseif dd == 2
        % 生成等间距采样矩阵
%         DX = 4;
%         DT = 5;
        MAPs = zeros(tlen,xlen);
        for k = 1:DT:tlen
            for i = 1:DX:xlen
                MAPs(k,i)=1;
            end
        end
        
    elseif dd == 3
        % 生成非等间距采样矩阵
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

