function [p, Q] = steff(f, df, p0, delta, epsilon, maxl)

    p = 0;
    Q = 0;
    R = zeros(maxl, 3);
    R(1, 1) = p0;
    for k = 1:maxl
        for j = 2:3
            nrdenom = feval(df, R(k, j - 1));
            if nrdenom == 0
                fprintf("Division by zero in Newton-Raphson method");
                break;
            else
                R(k, j) = R(k, j - 1) - feval(f, R(k, j - 1)) / nrdenom;
            end
            
            aadenom = R(k, 3) - 2*R(k, 2) + R(k, 1);
            if aadenom == 0
                fprintf("Division by zero in Aitken's Acceleration");
                break;
            else
                R(k + 1, 1) = R(k, 1) - (R(k, 2) - R(k, 1))^2 / aadenom;
            end
        end
        if (nrdenom == 0) || (aadenom == 0)
            break
        end

        err = abs(R(k, 1) - R(k+1, 1));
        relerr = err / (abs(R(k+1, 1)+delta));
        y = feval(f, R(k + 1, 1));
        if (err<delta) || (relerr<delta) || (y < epsilon)
            p = R(k + 1, 1);
            Q = R(1:k+1, :);
            break;
        end
    end

end