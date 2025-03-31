function X = gseid(A, B, P, delta, maxl)

    N = length(B);
    for k = 1:maxl
        for j = 1:N
            if j == 1
                X(1) = (B(1)-A(1, 2:N)*P(2:N))/A(1, 1);
            elseif j == N
                X(N) = (B(N)-A(N, 1:N-1)*(X(1:N-1))')/A(N, N);
            else
                X(j) = (B(j)-A(j, 1:j-1)*(X(1:j-1))' - A(j,j+1:N)*P(j+1:N)) / A(j, j);
            end
        end
        err = abs(norm(X'-P));
        relerr = err / (norm(X) + eps);
        P = X';
        if (err<delta) || (relerr<delta)
            break
        end
    end
    X = X';
end