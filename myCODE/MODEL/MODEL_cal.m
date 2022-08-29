function [f,g] = MODEL_cal(B0)
    %% 正模式
    u = MODEL_forward(B0);
    %% 伴随模式
    [J,Jn,Jk] = MODEL_adjoint(u);
    f = J;
    g = [Jn';Jk'];
end

