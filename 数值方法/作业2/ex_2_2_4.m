clear;
clc;

f = @(x) tan(x);
r = [];
errs = [];

for k = 1:3
    [c, err, yc] = bisect(f, 0 + (k - 1)*pi + eps, pi + (k-1)*pi - eps, 1e-12);
    r = [r, c];
    errs = [errs, err];
end

disp(r);