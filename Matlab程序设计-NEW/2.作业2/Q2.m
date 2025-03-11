clear;
clc;

a = zeros(1, 10);
b = zeros(1, 10);
a(1) = 10;
b(1) = 8;
for i = 2:10
    a(i) = (2/3) * a(i - 1) + (1/3) * b(i - 1);
    b(i) = (1/3) * a(i - 1) + (2/3) * b(i - 1);
end

disp(a);
disp(b);