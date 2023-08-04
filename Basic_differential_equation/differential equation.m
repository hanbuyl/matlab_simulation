% You can solve differential equation with these methods.

% problem 1 -a: analytical method

x_1a = linspace(0,1,100);

y_1a = x_1a.^4./4 - 1.5.*x_1a;

% plot(x_1a,y_1a)

% problem 1 -b: Euler method 

dydx = @(y,x) (1+4*x)*sqrt(y);

y_b1 =[1];
h1 = 0.5;
n1 = 2/h1;
for i = 1:n1
    y_b1(1, i+1) = y_b1(1,i) +  h1*dydt(y_b1(1,i),i*h1);
end

y_b2 =[1];
h2 = 0.25;
n2 = 2/h2;
for i = 1:n2
    y_b2(1, i+1) = y_b2(1,i) +  h2*dydt(y_b2(1,i),i*h2);
end

x1 = 0:0.5:2 ;
x2 = 0:0.25:2;

% problem 1 -c: midpoint method 
h3 = 0.5 ;
y_c1 =[1];
k1 = [dydt(1,0)];
k2 = [dydt(1+k1*h3,h3)];
n3 = 2/h3;


for i = 1:n3

    y_c1(1, i+1) = y_c1(1,i) +  h3*((k1(1,i)+k2(1,i))/2) ;
    k1(1, i+1) = dydt(y_c1(1,i+1),h3*i);
    k2(1, i+1) = dydt(y_c1(1,i+1)+k1(1,i+1)*h3,h3*(i+1));

end

% problem 1 -d: RK4 method

h4 = 0.5;
y_d1 = [1];
k1 = [dydt(1,0)];
k2 = [dydt(1+k1*h4,0.5*h4)];
k3 = [dydt(1+k2*h4,0.5*h4)];
k4 = [dydt(1+k3*h4,h4)];
n4 = 2/h4;

for i = 1:n4
    y_d1(1,i+1) = y_d1(1,i) + h4*(k1(1,i)+2*k2(1,i)+2*k3(1,i)+k4(1,i))/6;
    k1(1,i+1) = dydt(y_d1(1,i+1),h4*i);
    k2(1,i+1) = dydt(y_d1(1,i+1)+0.5*k1(1,i+1)*h4,h4*i+0.5*h4);
    k3(1,i+1) = dydt(y_d1(1,i+1)+0.5*k2(1,i+1)*h4,h4*i+0.5*h4);
    k4(1,i+1) = dydt(y_d1(1,i+1)+h4*k3(1,i+1),h4*i+h4);
end

% plots graphs

nexttile
plot(x1,y_b1)
title 'Euler method 1'
nexttile
plot(x2,y_b2)
title 'Euler method 2'
nexttile
plot(x1,y_c1)
title midpoint_method
nexttile
plot(x1,y_d1)
title RK4 method
