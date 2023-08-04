% This is simle example that using Euler method and RK3 method in diffential equation.

x1 = linspace(0,1,100);
x2 = linspace(0,1,5);
y_a2 = ((x1+2.*x1.^2+2).^2)./4;

dydx = @(y,x) (1+4*x)*sqrt(y);

% 2-b Euler method
y_b2 = [1];
h1 = 0.25;
n1 = 1/h1;
for i= 1:n1
    y_b2(1,i+1)=y_b2(1,i)+h1*dydx(y_b2(1,i),i*h1);
end

% 2-c RK4 Method
h4 = 0.25;
y_2e = [1];
k1 = [dydx(1,0)];
k2 = [dydx(1+0.5*k1*h4,0.5*h4)];
k3 = [dydx(1+0.5*k2*h4,0.5*h4)];
k4 = [dydx(1+k3*h4,h4)];
n4 = 1/h4;
for i = 1:n4
    y_2e(1,i+1) = y_2e(1,i) + h4*(k1(1,i)+2*k2(1,i)+2*k3(1,i)+k4(1,i))/6;
    k1(1,i+1) = dydx(y_2e(1,i+1),h4*i);
    k2(1,i+1) = dydx(y_2e(1,i+1)+0.5*k1(1,i+1)*h4,h4*i+0.5*h4);
    k3(1,i+1) = dydx(y_2e(1,i+1)+0.5*k2(1,i+1)*h4,h4*i+0.5*h4);
    k4(1,i+1) = dydx(y_2e(1,i+1)+h4*k3(1,i+1),h4*i+h4);
end

plot(x1,y_a2,'b',x2,y_b2,'k',x2,y_2e,'ro')
