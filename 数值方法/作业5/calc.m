function [px, dpx, intp] = calc(A, X, C)
    [~, n] = size(A);
    [~, m] = size(X);
    X = X';
    B = zeros(m, n);
    D = zeros(m, n);
    I = zeros(m, n+1);
    D(:, n-1) = n * A(n);
    I(:, n+1) = A(n) / (n + 1);
    B(:, n) = A(n);
    for k = n-1:-1:1
        B(:, k) = A(k) + B(:, k+1).*X;
        if k >= 2
            D(:, k-1) = k * A(k) + D(:, k) .* X;
            I(:, k) = A(k - 1)/k + I(:, k + 1) .* X;
        end
    end
    I(:, 1) = I(:, 2) .* X + C;
    px = B(:, 1);
    dpx = D(:, 1);
    intp = I(:, 1);
end