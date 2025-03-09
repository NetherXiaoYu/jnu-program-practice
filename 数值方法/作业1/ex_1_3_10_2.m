clear;
clc;

% 初始化变量设定以及函数
r0=0.994;
r_next = @(rn) 1/2*rn;
p0 = 1;
p1 = 0.497;
p_next = @(pn, pn_1) 3/2*pn-1/2*pn_1;
q0 = 1;
q1 = 0.497;
q_next = @(qn, qn_1) 5/2*qn-qn_1;

% 初始化结果矩阵
r_result = zeros(1, 10);
p_result = zeros(1, 10);
q_result = zeros(1, 10);
x_result = zeros(1, 10);
x_result(1) = 1;
r_result(1) = r0;
p_result(1) = p0;
p_result(2) = p1;
q_result(1) = q0;
q_result(2) = q1;

% 运行并且画图
for i = 2:10
    r_result(i) = r_next(r_result(i - 1));
    x_result(i) = 1/2*x_result(i - 1);
    if i >= 3
        p_result(i) = p_next(p_result(i - 1), p_result(i - 2));
        q_result(i) = q_next(q_result(i - 1), q_result(i - 2));
    end
end

disp("序列{x_n} = {1/3^n}以及近似值{r_n}, {p_n}和{q_n}");
disp([x_result; r_result; p_result; q_result]');
disp("误差序列 {x_n - r_n}, {x_n - p_n} 和 {x_n - q_n}");
disp([x_result - r_result; x_result - p_result; x_result - q_result]');

subplot(3, 1, 1);
plot(x_result - r_result, '*');
title("稳定递减的误差序列 {x_n - r_n}");
xlabel("n");
ylabel("{x_n - r_n}");

subplot(3, 1, 2);
plot(x_result - p_result, '*');
title("稳定的误差序列 {x_n - p_n}");
xlabel("n");
ylabel("{x_n - p_n}");

subplot(3, 1, 3);
plot(x_result - q_result, '*');
title("不稳定的误差序列 {x_n - q_n}")
xlabel("n");
ylabel("{x_n - q_n}");
