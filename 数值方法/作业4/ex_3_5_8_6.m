clear;
clc;

A = rand(10, 10);
B = [1 2 3 4 5 6 7 8 9 10]';
while det(A) == 0
    A = rand(10, 10);
end
X = lufact(A, B);
disp(A*X-B);
C = zeros(20);
while det(C) == 0
    C = rand(20, 20);
end
D = [1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20]';
X2 = lufact(C, D);
disp(C*X2 - D);