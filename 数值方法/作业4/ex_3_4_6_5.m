N = 11;
A = zeros(N);
B = zeros(N, 1);
for m = 1:N
    for n = 1:N
        A(m, n) = m^(n - 1);
    end
end
B(1, 1) = N;
for k = 2:N
    B(k, 1) = (k^N - 1) / (k - 1);
end
ex_3_4_6_4(A, B)