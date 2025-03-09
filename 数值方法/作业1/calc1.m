function [x1, x2] = calc1(a, b, c)
    % 这个函数用于求一元二次方程的解
    % 对 ax^2+bx+c 来说，计算通过传入 a, b, c 求解
    % 输出 x1, x2 为方程的两个根，可能为复根
    % Example: [x1, x2] = calc1(1, 2, -3)
    % x1 = 1
    % x2 = -3
    delta = b^2 - 4*a*c;
    if abs(abs(b) - delta) < 1e-10
        % 要小心处理
    end
    if a == 0
        if b == 0
            x1 = 0;
            x2 = 0;
        else
            x1 = -c / b;
            x2 = -c / b;
        end
        return;
    end
    if b == 0
        x1 = sqrt(-c);
        x2 = -sqrt(-c);
        return;
    end
    if b > 0
        x1 = -2*c / (b + sqrt(delta));
        x2 = (-b - sqrt(delta)) / (2 * a);
        return;
    end
    if b < 0
        x1 = (-b + sqrt(delta)) / (2 * a);
        x2 = -2*c / (b - sqrt(delta));
    end
end
