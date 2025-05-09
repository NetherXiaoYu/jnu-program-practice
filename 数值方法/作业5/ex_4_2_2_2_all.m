clear;
clc;

% 定义插值点 x_j = (j-1)/5, j=1,...,6
x_j = 0:0.2:1;
x = x_j'; % 转换为列向量

% 构造范德蒙矩阵 A (6x6)
A = [ones(6,1), x, x.^2, x.^3, x.^4, x.^5];

% 分别处理每个函数
for func_choice = 1:3
    % 计算对应的函数值 b
    switch func_choice
        case 1 % f(x) = e^x
            f = @(x) exp(x);
        case 2 % f(x) = sin(x)
            f = @(x) sin(x);
        case 3 % f(x) = (x+1)^(x+1)
            f = @(x) (x + 1).^(x + 1);
    end
    b = f(x);
    
    % 解线性方程组 A * a = b
    a = A \ b;
    
    % 显示结果
    fprintf('函数 %d 的系数 a₀ 到 a₅：\n', func_choice);
    a = a';
    disp(a);
    fprintf('\n');

    % 第二小题
    X = [0.3, 0.4, 0.5];
    [px, ~, ~] = calc(a, X, 0);

    fprintf("对比P([0.3, 0.4, 0.5]) 与 f([0.3, 0.4, 0.5])\n");
    disp(px');
    disp(f(X));

    % 第三小题
    X = [-0.1, 1,1];
    [px, ~, ~] = calc(a, X, 0);

    fprintf("对比P([-0.1, 1.1]) 与 f([-0.1, 1.1])\n");
    disp(px');
    disp(f(X));

    % 第四小题
    intf = integral(f, 0, 1);
    [~, ~, intp] = calc(a, [0, 1], 0);
    intpx = intp(2) - intp(1);

    fprintf("在 [0, 1] 上 f(x) 的积分值为 %f,  P(x) 的积分值为 %f\n", intf, intpx);
    % 绘制曲线
    subplot(1, 3, func_choice);
    X = 0:0.001:1;
    fx = f(X);
    [px, ~, ~] = calc(a, X, 0);
    plot(X, fx, 'b-');
    hold on;
    plot(X, px, 'r-');
    legend('F(x)', 'P(x)');

    % 第五小题
    X = 0:100;
    X = X / 100;
    fx = f(X)';
    [px, ~, ~] = calc(a, X, 0);
    E = fx - px;
    fprintf("E = f(x) - P(x)\n");
    disp(E);
end