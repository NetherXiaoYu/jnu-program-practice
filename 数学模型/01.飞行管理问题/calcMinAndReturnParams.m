function [x, y, min] = calcMinAndReturnParams(f, x_low, x_up, y_low, y_up)
    x = x_up;
    y = y_up;
    min = f(x, y);
    for i = x_low:0.01:x_up
        for j = y_low:0.01:y_up
            val = double(f(i, j));
            if val < min
                x = i;
                y = j;
                min = val;
            end
        end
    end
end
