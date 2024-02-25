function [v] = f(vmax, d, x)
    if x <= 0
        v = 0;
    elseif x >= d
        v = vmax;
    else
        v = x/3;
    end