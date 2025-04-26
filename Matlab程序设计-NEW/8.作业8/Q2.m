theta = pi/2 : (2*pi)/5 : (2*pi)*4/5 + pi/2;
points = exp(1j * theta);

indices = [1, 3, 5, 2, 4, 1];

plot(real(points(indices)), imag(points(indices)), 'r', 'LineWidth', 2);
axis equal;
title('红色五角星');