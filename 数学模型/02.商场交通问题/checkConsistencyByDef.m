function result = checkConsistencyByDef(M)
    result = true;
    [m, n] = size(M);
    for i = 1:n
        for j = 1:m
            for k = 1:n
                if M(i, j) * M(j, k) ~= M(i, k)
                    result = false;
                    return ;
                end
            end
        end
    end
end