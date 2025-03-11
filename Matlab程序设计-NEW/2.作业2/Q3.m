function [result] = Q3(x)
% 用于判断向量（或数组）是否严格单调递增
% 输入：向量 x
% 输出：0 或 1（bool）
% Example: Q3([1, 2, 3]) 输出 1
% Example: Q3([2, 2, 2]) 输出 0
% Example: Q3([3, 2, 1]) 输出 0

    for i = 2:length(x)
        if x(i) > x(i - 1)
            continue;
        else
            result = 0;
            return;
        end
    end
    result = 1;
end