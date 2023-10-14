function result = checkConsistencyByEig(M)
    [m, n] = size(M);
    lambda = real(eigs(M));
    % 这里因为系统精度问题，所以直接判断相等的话会有几率出现错误的结果
    % 所以这里使用两个值之间的差值是否小于 epsilon 进行判断
    if abs(max(lambda) - n) <= eps * 100
        result = true;
    else
        result = false;
    end
end