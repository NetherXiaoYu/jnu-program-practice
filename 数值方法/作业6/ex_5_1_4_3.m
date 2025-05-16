clear;
clc;

M = 1.5;
X = [57.59 108.11 149.57 227.84 778.14 1427 2870.3 4499.9 5909];
Y = [87.99 224.70 365.26 686.98 4332.4 10759 30684 60188 90710];
X_small = X(1:4);
Y_small = Y(1:4);
A = sum((X.^M).*Y)./sum(X.^(2*M));
A_small = sum((X_small.^M).*Y_small)./sum(X_small.^(2*M));

fprintf("A = %f\n", A);
fprintf("A_small = %f\n", A_small);

disp(A*(X.^M));
disp(Y);