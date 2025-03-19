clear;
clc;

Y = input("请输入要查询的年份：");
G = mod(Y, 19) + 1;
C = floor(Y / 100) + 1;
X = floor(3*C/4) - 12;
Z = floor((8*C + 5) / 25) - 5;
D = floor(5 * Y / 4) - X - 10;
E = mod(11 * G + 20 + Z - X, 30);

if (E == 25 && G > 11) || (E == 24)
    E = E + 1;
end

N = 44 - E;

if N < 21
    N = N + 30;
end
N = N + 7 - mod((D + N), 7);

if N > 31
    fprintf("复活节日期为：%d年%d月%d日\n", Y, 4, N - 31);
else
    fprintf("复活节日期为：%d年%d月%d日\n", Y, 3, N);
end