function [A, dP] = ex_6_2_6_1(X, Y, m)

[A, df, x0] = diffnew(X, Y);
fprintf("x0 = %f", x0);
n = length(X);
X_new = zeros(1, n+1);
X_new(1) = X(m);
X_new(2) = x0
X_new(3:m+2) = X(1:m-1);
X_new(m+3:end) = X(m+1:end);
[A, dP, x0_new] = diffnew(X_new, Y);

end