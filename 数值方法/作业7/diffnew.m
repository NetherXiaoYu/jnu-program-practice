function [A, df, x0] = diffnew(X, Y)

A = Y;
N = length(X);
for j=2:N
    for k=N:-1:j
        A(k)=(A(k)-A(k-1))/(X(k)-X(k - j + 1));
    end
end

x0 = X(1);
df = A(2);
prod = 1;
n1 = length(A) - 1;
for k = 2:n1
    prod=prod*(x0-X(k));
    df = df+prod*A(k+1);
end

end