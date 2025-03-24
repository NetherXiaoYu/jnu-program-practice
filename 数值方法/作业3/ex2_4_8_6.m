function [p0, err, k, y] = ex2_4_8_6(f, df, ddf, p0, delta, epsilon, maxl)

    y = 0;
    err = 0;
    for k = 1:maxl
        % fprintf("Start epoch %d, p0 = %d, err = %d, y = %d\n", k, p0, err, y);
        % fprintf("feval(f, p0) = %f, feval(df, p0) = %f", feval(f, p0), feval(df, p0))
        p1 = p0 - feval(f, p0) / feval(df, p0) * (1 - (feval(f, p0) * feval(ddf, p0)) / (2 * (feval(df, p0) ^ 2)))^(-1);
        % disp(p1);
        err = abs(p1 - p0);
        relerr = 2 * err / (abs(p1) + delta);
        p0 = p1;
        % disp(p0);
        y = feval(f, p0);
        % fprintf("End epoch %d, p0 = %d, err = %d, y = %d\n", k, p0, err, y);
        if (err < delta) || (relerr < delta) || (abs(y) < epsilon) break,end
    end

end