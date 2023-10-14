function result = checkConsistency(M)
    result = true;
    if checkConsistencyByDef(M)
        return;
    end
    [m, n] = size(M);
    RI = [0, 0.00001, 0.58, 0.90, 1.12, 1.24, 1.32, 1.41, 1.45];
    lambda = real(eig(M));
    CI = (max(lambda) - n) / (n - 1);
    if (CI / RI(n)) >= 0.10
        result = false;
    else
        result = true;
end