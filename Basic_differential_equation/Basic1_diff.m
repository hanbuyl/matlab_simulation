% This show you velocity and acceleration in approximation.

x=[0 1 2 3 4 5 6 7 8 9 10];
y=[1.4 2.1 3.3 4.8 6.8 6.6 8.6 7.5 8.9 10.9 10];


prompt = "Enter the x value that you want to know the approximation of the first and second derivatives. ";
i = input(prompt);

dy_1_ = diff(y)./diff(x);
dy_1 = (dy_1_(i)+ dy_1_(i+1))./2;

dy_2_ = diff(dy_1_);
dy_2 = dy_2_(i);

dy_1
dy_2

