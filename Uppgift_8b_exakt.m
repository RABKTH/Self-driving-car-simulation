%Uppgift 8b
clear

d = 90;
vmax = 30;
M = 10;
t_tot = 60;
h = 0.6;
n_tot = t_tot/h;

%Bestämmer startfördelningen x
x1 = zeros(1,M);
for i = 1:M
    x1(1,i) = d*i;
end

tspan = (1:n_tot)*h;

for n = 1:n_tot
    x1(n+1,:) = exakt_inbromsning(x1(n,:), M, h, vmax, tspan(n));
end