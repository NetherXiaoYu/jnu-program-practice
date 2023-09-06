% 绘制二元单符号离散信源熵的变化曲线
clear;
clc;
entropy_sequence = [];
x_sequence = [];

for i = 0.001:0.001:0.999
    x_chance = i;
    y_chance = 1 - i;
    x_sequence = [x_sequence i];
    source_entropy = -(x_chance * (log(x_chance) / log(2))) - (y_chance * (log(y_chance) / log(2)));
    entropy_sequence = [entropy_sequence source_entropy];
end

plot(x_sequence, entropy_sequence);
hold on;
xlabel("符号 1 概率 x，符号 2 概率为(1 - x)");
ylabel("信源熵");
legend("信源熵");
hold on
