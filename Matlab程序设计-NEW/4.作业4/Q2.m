function M = Q2(n)
    M = zeros(2 * n + 1, 2 * n + 1);
    n = 2*n;
    for k = 0:n
        M(n - k + 1, :) = linspace(-k, n - k, n + 1);
    end
end