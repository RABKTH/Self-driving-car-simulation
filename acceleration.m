function y = acceleration(x, M, h, vmax, tn, d)
    y = zeros(1,M);
    for i = 1:M
        if i == M
            y(1,i) = x(1,i) + h*vmax;
        else
            y(1,i) = x(1,i) + h*f(vmax, d, x(1,i+1) - x(1,i));
        end
    end
end