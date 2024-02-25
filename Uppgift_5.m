%Uppgift 2
clear
hold on

%Konstanter
d = 90;
vmax = 30;
M = 10;
t_tot = 60;
h_varden = [0.075 0.15 0.3 0.6];

maximal_error_vektor = [];
for h = h_varden
    n_tot = t_tot/h;
    
    %Bestämmer startfördelningarna x1 (euler) och x2 (ode45)
    x1 = zeros(1,M);
    x2 = zeros(M,1);
    for i = 1:M
        x1(1,i) = d*i;
        x2(i,1) = d*i;
    end
    
    %Skapar ett gemensamt tidsspann för euler och ode45
    tspan = (0:n_tot)*h;

    %Löser med euler-framåt
    for n = 1:n_tot
        x1(n+1,:) = inbromsning(x1(n,:), M, h, vmax, tspan(n), d);
    end
    
    %Löser med ode45
    options = odeset('RelTol',1e-8,'AbsTol',1e-9);
    ode = @(t,x) odefun(t, x, vmax, M, d);
    [t,y] = ode45(ode, tspan, x2, options);
    
    %Plottar 5i
    error_vektor=abs(y(:,1)-x1(:,1));
    plot(tspan, error_vektor)

    maximal_error_vektor = horzcat(maximal_error_vektor, max(error_vektor));
end

%Beräknar nu noggrannhetsordningen empiriskt
for k = 1:length(h_varden)-1
    p = (log(maximal_error_vektor(k+1)/maximal_error_vektor(k)))/log(2);
    disp(['Noggrannhetsordning ≈ ',num2str(p)])
end