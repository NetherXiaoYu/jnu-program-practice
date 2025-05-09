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
            b = exp(x);
        case 2 % f(x) = sin(x)
            b = sin(x);
        case 3 % f(x) = (x+1)^(x+1)
            b = (x + 1).^(x + 1);
    end
    
    % 解线性方程组 A * a = b
    a = A \ b;
    
    % 显示结果
    fprintf('函数 %d 的系数 a₀ 到 a₅：\n', func_choice);
    disp(a');
    fprintf('\n');
end