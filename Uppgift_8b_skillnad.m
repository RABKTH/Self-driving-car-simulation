%Uppgift 8b skillnad
clear
hold on

d = 90;
vmax = 30;
M = 10;
t_tot = 60;
h = 0.6;
n_tot = t_tot/h;

%Bestämmer startfördelningen x
x1 = zeros(1,M);
x2 = zeros(1,M);
for i = 1:M
    x1(1,i) = d*i;
    x2(1,i) = d*i;
end

tspan = (1:n_tot)*h;

%Beräknar fördelningen med exakt euler bakåt
for n = 1:n_tot
    x1(n+1,:) = exakt_inbromsning(x1(n,:), M, h, vmax, tspan(n));
end

%Beräknar fördelningen med fixpunkt och euler bekåt
kmax = 20;
skillnad_vektor = [];
k_vektor = [];
for k = 3:kmax
    typ = 1; %1 är inbromsning, 2 är acceleration, 3 är motorstopp
    for n = 1:n_tot
        x2(n+1,:) = bakeuler(x2(n,:), M, h, vmax, tspan(n), d, k, typ);
    end
    skillnad_vektor = horzcat(skillnad_vektor, abs(x1(end,1) - x2(end,1)));
    k_vektor = horzcat(k_vektor, k);
end
plot(k_vektor,skillnad_vektor)
set(gca, 'YScale', 'log');