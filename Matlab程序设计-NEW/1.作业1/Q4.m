x = 1;
while abs(x - ((1/2)*sqrt(1 + x))) >= 1e-6
    x = (1/2)*sqrt(1 + x);
end
disp(x);