function weight = calcWeight(M)
% 归一化处理
[m, n] = size(M);
weight = zeros(1, n);
for i = 1:n
    mw = M(:, i)';
    mw = mw / max(mw);
    mw = mw / sum(mw);
    weight = weight + mw;
end
weight = weight / n;
end