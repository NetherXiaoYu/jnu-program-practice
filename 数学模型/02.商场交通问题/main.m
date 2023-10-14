clear;
clc;
%% 读入数据

A = [1, 2, 3, 7; 1/2, 1, 2, 4; 1/3, 1/2, 1, 2; 1/7, 1/4, 1/2, 1];

B1 = [1, 2, 3; 1/2, 1, 2; 1/3, 1/2, 1];
B2 = [1, 1, 3; 1, 1, 3; 1/3, 1/3, 1];
B3 = [1, 1/3, 1; 3, 1, 1/3; 1, 3, 1];
B4 = [1, 1/4, 1/3; 4, 1, 2; 3, 1/2, 1];

%% 根据一致性矩阵定义进行检验
disp(["矩阵 A  的一致性检验结果：", checkConsistency(A)]);
disp(["矩阵 B1 的一致性检验结果：", checkConsistency(B1)]);
disp(["矩阵 B2 的一致性检验结果：", checkConsistency(B2)]);
disp(["矩阵 B3 的一致性检验结果：", checkConsistency(B3)]);
disp(["矩阵 B4 的一致性检验结果：", checkConsistency(B4)]);

%% 修改 B3 矩阵
B3 = [1, 1/3, 1/5; 3, 1, 1/3; 5, 3, 1];

%% AHP 层次分析法
AWeight = calcWeight(A);
B1Weight = calcWeight(B1);
B2Weight = calcWeight(B2);
B3Weight = calcWeight(B3);
B4Weight = calcWeight(B4);

score = AWeight(1) * B1Weight + AWeight(2) * B2Weight + AWeight(3) * B3Weight + AWeight(4) * B4Weight;
disp(score);