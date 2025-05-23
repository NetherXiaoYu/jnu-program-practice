function [f] = iterfcn(func, iter)

    f = @(x) x;
    for n = 1:iter
        f = @(x) func(f(x));
    end

end