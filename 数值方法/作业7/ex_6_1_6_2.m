clear;
clc;

f1 = @(x) 60*x^45-32*x^33+233*x^5-47*x^2-77;
f2 = @(x) tan(cos((sqrt(5)+sin(x))/(1+x^2)));
f3 = @(x) sin(cos(1/x));
f4 = @(x) sin(x^3-7*x^2+6*x+8);
f5 = @(x) x^x^x;

fprintf("第1个函数：\n");
difflim(f1, 1/sqrt(3), 1e-13);
fprintf("第2个函数：\n");
difflim(f2, (1+sqrt(5))/3, 1e-13);
fprintf("第3个函数：\n");
difflim(f3, 1/sqrt(2), 1e-13);
fprintf("第4个函数：\n");
difflim(f4, (1-sqrt(5))/2, 1e-13);
fprintf("第5个函数：\n");
difflim(f5, 0.0001, 1e-13);