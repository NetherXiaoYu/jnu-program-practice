function [c, err, yc] = bisect(f, a, b, delta)
    ya = feval(f, a);
    yb = feval(f, b);
    if ya * yb > 0, end

    max1 = 1 + round(log(b - a) - log(delta)) / log(2);
    for k = 1:max1
        c = (a + b) / 2;
        yc = feval(f, c);
        disp([k-1, a, c, b, yc]);
        if yc == 0
            a = c;
            b = c;
        elseif yb*yc > 0
            b = c;
            yb = yc;
        else
            ya = yc;
            a = c;
        end
        if b - a < delta, break;end
    end
    c = (a + b) / 2;
    err = abs(b - a);
    yc = feval(f, c);
end