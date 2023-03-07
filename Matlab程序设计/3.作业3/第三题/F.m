function f = F()

Y = input("Input Year:");

G = mod(Y, 19) + 1;
C = floor(Y / 100) + 1;
X = floor(3 * C / 4) - 12;
Z = floor((8 * C + 5) / 25) - 5;
D = floor(5 * Y / 4) - X - 10;
E = mod((11 * G + 20 + Z - X), 30);
if E == 24 || (E == 25 && G > 11)
    E = E + 1;
end

N = 44 - E;
if N < 21
    N = N + 30;
end

N = N + 7 - mod((D + N),7);

if N > 31
    N = N - 31;
    disp(strcat('4/', string(N)));
else
    disp(strcat('3/', string(N)));
end

end
