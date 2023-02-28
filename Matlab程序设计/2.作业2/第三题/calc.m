function f = calc(n, steps)

if n <= 0
    f = 0
    return;
elseif n == 1
    f = 1;
    return;
elseif n == 2
    f = 2;
    return;
elseif n == 3
    f = 4;
    return;
else
    f = calc(n - 1) + calc(n - 2) + calc(n - 3);
    return;
end
end
