function y = bakeuler(x, M, h, vmax, tn, d, k, typ)
    y = x;
    
    %k är antalet fixpunktsiterationer
    for j = 1:k
        y = x + h*fixpunkt(y, M, vmax, tn, d, typ);
    end
end