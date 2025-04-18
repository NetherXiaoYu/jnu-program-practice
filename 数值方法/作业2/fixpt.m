function [k, p, err, P] = fixpt(g, p0, tol, max1)
    P(1) = p0;
    for k = 2:max1
        P(k) = feval(g, P(k - 1));
        err = abs(P(k) - P(k-1));
        relerr = err / (abs(P(k)) + eps);
        p = P(k);
        if(err < tol) | (relerr < tol), break;end
    end
    if k == max1
        disp('maximum number of iterations exceeded');
    end
    P = P';
end