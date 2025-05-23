clear;
clc;

theta = 0:0.01:pi;
phi = 0:0.01:2*pi;
[theta, phi] = meshgrid(theta, phi);
r = @(theta, phi) sqrt((0.5)*(cos(2.*phi)-1).*(cos(4.*theta) - 1) + (0.8));

x = r(theta, phi).*sin(theta).*cos(phi);
y = r(theta, phi).*sin(theta).*sin(phi);
z = r(theta, phi).*cos(theta);

plot3(x, y, z);