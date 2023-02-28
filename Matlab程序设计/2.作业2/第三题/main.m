steps = zeros(10, 1);
steps(1) = 1;
steps(2) = 2;
steps(3) = 4;

% 递归函数计算第 5 步
disp(calc(5));

% 递推 for 循环计算第 5 步
for i = 4:10
    steps(i) = steps(i - 1) + steps(i - 2) + steps(i - 3);
end
disp(steps(5));
