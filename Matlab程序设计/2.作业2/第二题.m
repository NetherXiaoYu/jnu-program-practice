a = zeros(10, 1);
b = zeros(10, 1);
a(1) = 10;
b(1) = 8;
for i = 2:length(a)
    a(i) = (2/3)*a(i-1) + (1/3)*b(i-1);
    b(i) = (1/3)*a(i-1) + (2/3)*b(i-1);
end
disp(a)
disp(b)
