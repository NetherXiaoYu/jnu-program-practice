function [x, y, max] = calcMaxAndReturnParams(f, x_low, x_up, y_low, y_up)
    x = x_up;
    y = y_up;
    max = f(x, y);
    for i = x_low:0.01:x_up
        for j = y_low:0.01:y_up
            val = double(f(i, j));
            if val > max
                x = i;
                y = j;
                max = val;
            end
        end
    end
end
