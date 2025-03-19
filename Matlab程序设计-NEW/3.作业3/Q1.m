clear;
clc;
income = input("请输入您的年收入（元）：");

t = 0;
if income <= 20000
    t = 0;
elseif income > 20000 && income <= 50000
    t = 0.1 * (income - 20000);
else
    t = 3000 + 0.2 * (income - 50000);
end

fprintf("你的税费金额为 %f\n", t);