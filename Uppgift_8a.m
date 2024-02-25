%Uppgift 8a
clear

d = 90;
vmax = 30;
M = 2;
t_tot = 60;
h = 0.6;
k = 20;
typ = 3; %1 är inbromsning, 2 är acceleration, 3 är motorstopp
n_tot = t_tot/h;

%Bestämmer startfördelningen x
x = zeros(1,M);
for i = 1:M
    x(1,i) = d*i;
end

tspan = (0:n_tot)*h;

for n = 1:n_tot
    x(n+1,:) = bakeuler(x(n,:), M, h, vmax, tspan(n), d, k, typ);
end