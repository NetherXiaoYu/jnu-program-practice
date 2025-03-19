clear;
clc;
figure;
hold on;

square_x = [-1, 1, 1, -1, -1];
square_y = [-1, -1, 1, 1, -1];
plot(square_x, square_y, 'b--');

theta = linspace(0, 2*pi, 100);
circle_x = cos(theta);
circle_y = sin(theta);
plot(circle_x, circle_y, 'r-');

plot(0, 0, 'y*', 'MarkerSize', 15);

axis([-2 2 -2 2]);
xlabel('x');
ylabel('y');
title('Figure');
axis equal;

legend('square', 'circle', 'center', 'Location', 'northeast');