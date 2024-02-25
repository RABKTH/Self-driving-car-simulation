function y = exakt_inbromsning(x, M, h, vmax, tn)
    y = zeros(1, M);
    
    for i = M:-1:1
        if i == M
            y(1,i) = x(1,i) + h*vmax*(exp(-tn));
        else
            y(1,i) = (((h/3)*y(1,i+1)) + x(1,i))/(1 + (h/3));
            if abs(y(1,i+1)-y(1,i)) > 90
                y(1,i) = x(1,i) + h*vmax;
            end
            if abs(y(1,i+1)-y(1,i)) < 0
                y(1,i) = x(1,i);
            end
        end
    end
end