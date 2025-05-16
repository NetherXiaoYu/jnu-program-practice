X = 0:6;
Y = [0 4 8 9 9 8 6];
S1 = csfit(X, Y, 1, -2);
S2 = csfit_natural(X, Y);
S3 = csfit_extrapolation(X, Y);
S4 = csfit_parabolic_runout(X, Y);
S5 = csfit_curvature_adjusted(X, Y, 1, -1);

figure;
hold on;

for k=1:6
    x = k-1:0.001:k;
    y1 = polyval(S1(k,:), x-X(k));
    y2 = polyval(S2(k,:), x-X(k));
    y3 = polyval(S3(k,:), x-X(k));
    y4 = polyval(S4(k,:), x-X(k));
    y5 = polyval(S5(k,:), x-X(k));
    plot(x, y1, 'r.');
    plot(x, y2, 'b.');
    plot(x, y3, 'g.');
    plot(x, y4, 'y.');
    plot(x, y5, '.', 'Color','cyan');
end