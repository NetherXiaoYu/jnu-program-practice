clear;
clc;

t = linspace(-9, 9, 100);
y = zeros(1, 100);
for i = 1:length(t)
    if t(i) < 0
        y(i) = 3 * t(i)^2 + 5;
    else
        y(i) = -3 * t(i)^2 + 5;
    end
end
plot(y);