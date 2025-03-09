a = 1;
b = 1;
c = 2;
for m = 3:50
    c = a + b;
    a = b;
    b = c;
end
disp(c)