function [x0] = Q5(a, b)
% 用于求解 x^3-2x-5=0 在 [a, b] 的零点，采用二分法+递归，近似值精度误差取 Matlab 中自带之 eps 常数
% 输入 双精度浮点数 a, b
% 输出 双精度浮点数 x0
% Example: x0 = Q4(-9, 9)

    if abs(a - b) < 1e-3
        x0 = (a + b) / 2;
        return
    end

    if a > b
        x1 = b;
        x2 = a;
    else
        x1 = a;
        x2 = b;
    end

    mid = (x1 + x2) / 2;
    eq = @(x) x^3-2*x-5;
    x0 = 0;

    if eq(mid) ~= 0
        mid = (x1 + x2) / 2;
        if eq(x1)*eq(mid) < 0
            x2 = mid;
        end
        if eq(mid)*eq(x2) < 0
            x1 = mid;
        end
        x0 = Q4(x1, x2);
    end

    return ;
end