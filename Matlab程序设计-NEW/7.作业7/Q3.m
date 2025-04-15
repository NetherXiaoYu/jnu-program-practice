function [S] = Q3(varargin)
    [~, nargin] = size(varargin);
    n = 20;
    if nargin ~= 0
        n = cell2mat(varargin(1));
    end
    a = 1;
    b = 2;
    c = 3;
    S = 0;
    for t = 1:n
        S = S + b / a;
        a = b;
        b = c;
        c = a + b;
    end
end