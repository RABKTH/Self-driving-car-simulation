%Uppgift 3
clear
d = 90;
vmax = 30;
M = 10;
t_tot = 60;
h = 0.1;
n_tot = t_tot/h;
%Bestämmer startfördelningen x
x = zeros(1,M);
for i = 1:M
    x(1,i) = d*i;
end

for n = 1:(n_tot-1)
    x(n+1,:) = inbromsning(x(n,:), M, h, vmax, n, d);
end


for n=1:n_tot
    plot(x(n,:), zeros(1,M), 'r*');
    axis([0 1000 -1 1])
    drawnow
    pause(h)
end

%Skapar inbromsningsfunktionen
function y = inbromsning(x, M, h, vmax, n, d)
    y = zeros(1,M);
    for i = 1:M
        if i == M
            y(1,i) = x(1,i) + h*vmax*exp(-n*h); %n*h = t
        else
            y(1,i) = x(1,i) + h*f(vmax, d, x(1,i+1) - x(1,i));
        end
    end
end

%Skapar accelerationsfunktionen
function y = acceleration(x, M, h, vmax, n, d)
    y = zeros(1,M);
    for i = 1:M
        if i == M
            y(1,i) = x(1,i) + h*vmax;
        else
            y(1,i) = x(1,i) + h*f(vmax, d, x(1,i+1) - x(1,i));
        end
    end
end