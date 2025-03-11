function [x0] = Q4(a, b)
% 用于求解 x^3-2x-5=0 在 [a, b] 的零点，采用二分法，近似值精度误差取 1e-3
% 输入 双精度浮点数 a, b
% 输出 双精度浮点数 x0
% Example: x0 = Q4(-9, 9)

    if a > b
        x1 = b;
        x2 = a;
    else
        x1 = a;
        x2 = b;
    end
    
    mid = (a + b) / 2;
    eq = @(x) x^3-2*x-5;
    
    if eq(a) == 0
        x0 = a;
        return ;
    end
    
    if eq(b) == 0
        x0 = b;
        return ;
    end
    
    while eq(mid) ~= 0
        mid = (x1 + x2) / 2;
        if eq(x1)*eq(mid) < 0
            x2 = mid;
        end
        if eq(mid)*eq(x2) < 0
            x1 = mid;
        end
        if abs(x1 - x2) < 1e-3
            x0 = mid;
            return ;
        end
    end
    
    x0 = 0;
    return ;

end