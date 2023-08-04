% This will solve the differential equation numerically and show that in the picture.
% Each picture will be saved in your file then you can file them with the program.
% then it will seem like an animation.


% create arrays for global variables
global vy_0 vx_0 t y_text

% create arrays for positions and velocities of all balls
num_balls = 5;

position = zeros([num_balls, 200, 2]);  % 3-d array
velocity = zeros([num_balls, 200, 2]);

% create arrays for initial velocities and angles of all balls
theta = [1./4.*pi, 1./6.*pi, 1./8.*pi, 1./5.*pi, 1./12.*pi];
v0 = [3, 3, 4, 4, 5];
vx_0 = v0 .* cos(theta);
vy_0 = v0 .* sin(theta);

t = zeros([num_balls, 1]);

% set initial positions of all balls
x = 0;
y = 5;
y_text = 0;
for ball = 1:num_balls
    position(ball, 1, :) = [x, y];
end

% set boundary conditions
c = 0.7;
x_min = 0;
x_max = 19.5;
y_min = 0.0001; % Avoid zero to prevent divide-by-zero errors
y_max = 20;
a_y = 3;
R = [0.3, 0.5, 0.5, 0.8, 1];


for i = 1:199 
    for ball = 1:num_balls
        % update position of ball based on equation
        t(ball) = t(ball) + 1;

        x_new = position(ball,1,1) + vx_0(ball).*(t(ball)./10);
        y_new = position(ball,1,2) + vy_0(ball).*(t(ball)./10) -1./2.*a_y.*(t(ball)./10).^2;
        
        position(ball,i+1,1) = x_new ;
        position(ball,i+1,2) = y_new ;

        % update velocity of ball based on positions
        velocity(ball, i+1, 2) = position(ball, i+1, 2) - position(ball, i, 2);
        velocity(ball, i+1, 1) = position(ball, i+1, 1) - position(ball, i, 1);

        % check boundary conditions
        if y_new <= y_min || y_new >= y_max 
            vy_0(ball) = -10 .* c .* velocity(ball, i, 2); 
            t(ball) = 0;
            position(ball, 1, 1) = position(ball, i, 1);
            position(ball, 1, 2) = position(ball, i, 2);
        end

        if x_new <= x_min || x_new >= x_max 
            vx_0(ball) = -10 .* c .* velocity(ball, i, 1); 
            t(ball) = 0;
            position(ball, 1, 1) = position(ball, i, 1);
            position(ball, 1, 2) = position(ball, i, 2);

        end

        theta = linspace(0,2*pi,100);

        circle_x = R(ball).*cos(theta) + x_new ;
        circle_y = R(ball).*sin(theta) + y_new;
        plot(circle_x,circle_y);
        yline(-1,'LineWidth',10,'Color','[0.4660, 0.6740, 0.1880]');
        hold on
       
        axis([-1 20 -2 20]);
        x_print = sprintf('%12.2f',x_new);
        y_print = sprintf('%12.2f',y_new);
         
        text(9 ,19-ball,{strcat('x', num2str(ball),'value : ',num2str(x_print),'    y',num2str(ball) ,'value : ',num2str(y_print))} );
        
        xlabel ('X - axis')
        ylabel ('Y - axis')
       
    end

    ax = gca;

    exportgraphics(ax,strcat('myplots_',num2str(i),'.jpg'));

    hold off

end
