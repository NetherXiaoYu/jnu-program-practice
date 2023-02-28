t = -9:0.1:9;
y = zeros(size(t));
for i=1:length(t)
    if t(i) < 0
        y(i) = 3 * t(i) ^ 2 + 5;
    else
        y(i) = -3 * t(i) ^ 2 + 5;
    end
end
plot(t, y);
