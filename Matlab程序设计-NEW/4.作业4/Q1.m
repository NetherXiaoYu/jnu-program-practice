function [B] = Q1(A)
    B = A;
    B(:, [1 end]) = B(:, [end 1]);
end