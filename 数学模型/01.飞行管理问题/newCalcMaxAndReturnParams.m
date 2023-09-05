function [x, y, max] = newCalcMaxAndReturnParams(f, x0, y0, d)
    max = f(x0, y0);
    x = x0;
    y = y0;
    for k = 0.01:0.01:d
        xs = [(x0 - k), (x0 + k)];
        ys = [(y0 - (d - k)), (y0 + (d - k))];
        for i = 1:2
            for j = 1:2
                val = double(f(xs(i), ys(j)));
                if val > max
                    x = xs(i);
                    y = ys(j);
                    max = val;
                end
            end
        end
    end
end
