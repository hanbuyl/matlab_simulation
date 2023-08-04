% This is basic skill to solve the simple diffential eqation numerically.


clear all

dt = 0.5;

[df(2) cd(2, dt) fd(2, dt) bd(2, dt)]


dx = 0.01;
x = 1.5:dx:2.5;

plot(x,df(x),'rx',x,cd(x,dx),'ko',x,fd(x,dx),'g',x,bd(x,dx),'bx')


function fx = fx(x)
    fx = exp(-2*x) - x;
end

function df = df(x)
    df = -2*exp(-2*x)-1;
end


function cd = cd(t, dt)
    cd = ( -fx(t+2.*dt) + 8.*fx(t+dt) - 8.*fx(t-dt)+ fx(t-2.*dt) )/ (12*dt) ;
end

function fd = fd(t,dt)
    fd = (-fx(t+2*dt)+4*fx(t+dt)-3*fx(t))/(2*dt);
end

function bd = bd(t,dt)
    bd = (fx(t-2*dt)-4*fx(t-dt)+3*fx(t))/(2*dt);
end
