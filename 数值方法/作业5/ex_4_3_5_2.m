X = 1:6;
Y = [66 66 65 64 63 63];
[C, L] = lagran(X, Y);
C = flip(C);
fprintf("计算结果为：\n");
disp(C);
fprintf("Lagrange逼近系数矩阵为：\n")
disp(L);
[px, ~, intp] = calc(C, 1:6, 0);
fprintf("平均温度为：%f\n", (intp(end) - intp(1)) / 6);
hold on;
plot(X, Y);
plot(X, px);
legend('原数据', 'P(x)数据')