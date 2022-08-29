function [opt2] = RMSE(x,y)
projected_g = x-y;
opt2 = sqrt(mean(projected_g.^2));
end

