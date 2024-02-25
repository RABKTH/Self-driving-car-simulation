function y = odefun(t, x, vmax, M, d)
    y = zeros(M,1);
    for i = 1:M
        if i == M
            y(i) = vmax*exp(-t);
        else
            y(i) = f(vmax, d, x(i+1) - x(i));
        end
    end
end