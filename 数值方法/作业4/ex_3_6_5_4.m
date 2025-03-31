clear;
clc;

A = zeros(50);
for k = 1:50
    A(k, k) = 12;
    if(k <= 49)
        A(k, k + 1) = -2;
        A(k + 1, k) = -2;
    end
    if(k <= 48)
        A(k, k + 2) = 1;
        A(k + 2, k) = 1;
    end
end
B = ones(50, 1) * 5;
X = gseid(A, B, B, 1e-13, 10000)
disp(A*X - B);