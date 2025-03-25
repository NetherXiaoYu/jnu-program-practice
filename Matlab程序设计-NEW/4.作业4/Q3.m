function [result] = Q3(A)
    result = A(1, :);
    [rows, ~] = size(A);
    for k = 2:rows
        result = intersect(result, A(k, :));
    end
    result = sort(result);
end