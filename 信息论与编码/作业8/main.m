% 绘制二元信道的率失真函数曲线
clear;
clc;
% P(X) 以及 d
px = [0.5, 0.5];
d = [0, 1; 1, 0];

% D_max 和 D_min
D_min = px * min(d)';
D_max = min(px * d);
D = D_min:0.001:D_max;

% R(D)
R = 1 + (D.*log(D) + (1-D).*log(1-D))/log(2);

plot(D,R)
