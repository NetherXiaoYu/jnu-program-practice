clear;
clc;

x = -5:0.1:5;
[X, Y] = meshgrid(x, x);
Z = sin(X.^2 + Y.^2);
surf(X, Y, Z);
title("Z = sin(X^2 + Y^2)");
xlabel('X');
ylabel('Y');
zlabel("Z");