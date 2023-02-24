clear;
clc;
x = 3;
y = 4;
disp((x^2 * y ^ 3) / (x - y) ^ 2)

s = 0;
for m = 1:10
    for n = 1:10
        s = s + (m * n - 1);
    end
end
disp(s)

for x = 0:0.0001:(pi/2)
    if round(x, 4) == round(cos(x), 4)
        disp(x)
        break;
    end
end

x = 0;
while x <= (pi/2)
    if round(x, 4) == round(cos(x), 4)
        disp(x)
        break;
    end

    x = x + 0.0001;
end

p_x = 0:0.0001:pi/2;
p_y = cos(p_x);

figure
hold on
plot(p_x, p_y);
plot(p_x, p_x);
legend(["y=cos(x)", "y=x"])
hold off;
