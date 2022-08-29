function [f,g] = MODEL_cal(B0)
    %% ��ģʽ
    u = MODEL_forward(B0);
    %% ����ģʽ
    [J,Jn,Jk] = MODEL_adjoint(u);
    f = J;
    g = [Jn';Jk'];
end

