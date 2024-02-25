function y = fixpunkt(x, M, vmax, tn, d, typ)
    y = zeros(1, M);
    for i = 1:M
        if i == M
            if typ == 1 %Inbromsning
                y(1,i) = vmax*exp(-tn);
            elseif typ == 2 %Acceleration
                y(1,i) = vmax;
            elseif typ == 3 %Motorstopp
                y(1,i) = 0;
            end
        else
            y(1,i) = f(vmax, d, x(1,i+1) - x(1,i));
        end
    end
end