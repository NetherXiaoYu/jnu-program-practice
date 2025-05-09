function [A, C, D] = newploy(X, Y)
    n = length(X);
    D = zeros(n, n);
    A = zeros(size(Y));
    for k = 1:n
        A(k) = Y(k);
    end
    for j = 2:n
        for k = n:-1:j
            A(k) = (A(k) - A(k-1)) / (X(k) - X(k - j + 1));
        end
    end
    D(:, 1) = Y';
    for j = 2:n
        for k = j:n
            D(k, j) = (D(k, j - 1) - D(k - 1, j - 1)) / (X(k) - X(k - j + 1));
        end
    end
    C = D(n, n);
    for k = (n-1):-1:1
        C = conv(C, poly(X(k)));
        m = length(C);
        C(m) = C(m)+D(k, k);
    end
end