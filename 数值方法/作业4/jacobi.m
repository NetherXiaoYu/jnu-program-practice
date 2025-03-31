function X=jacobi(A, B, P, delta, maxl)

    N = length(B);
    for k = 1:maxl
        for j = 1:N
            X(j) = (B(j)-A(j, [1:j-1,j+1:N])*P([1:j-1,j+1:N]))/A(j, j);
        end
        err = abs(norm(X'-P));
        relerr = err/(norm(X)+eps);
        P = X';
        if(err<delta)|(relerr<delta)
            break
        end
    end
    X = X';
end