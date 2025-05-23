function [y, t] = solve_ode(f, tspan, c)

h = 0.01;
t = tspan(1):0.01:tspan(2);
t = t';

f1 = @(x, t) f(x, t);
f2 = @(x, t) f(x + (1/2)*h*f1(x, t), t + (1/2)*h);
f3 = @(x, t) f(x + (1/2)*h*f2(x, t), t + (1/2)*h);
f4 = @(x, t) f(x + h*f3(x, t), t + h);

n = length(t);
m = length(c);
y = zeros(n, m);
y(1, :) = c;
for k = 1:n-1
    y(k+1, :) = y(k, :) + (h/6).*(f1(y(k, :), t(k)) + 2.*f2(y(k, :), t(k)) + 2.*f3(y(k, :), t(k)) + f4(y(k, :), t(k)));
end

end