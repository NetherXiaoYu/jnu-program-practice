function S = csfit_extrapolation(X, Y)
    N = length(X) - 1;
    n = N + 1;

    if N < 2
        error('At least 3 points are required for spline interpolation.');
    end

    H = diff(X);                % 区间长度
    D = diff(Y) ./ H;           % 一阶差商
    U = 6 * diff(D);            % 三对角方程右侧向量

    % 初始化系数矩阵 A 和右侧向量 b
    A = zeros(n, n);
    b = zeros(n, 1);

    % -------------------
    % 非扭结条件（Not-a-Knot）边界条件
    % -------------------

    % 第一个非扭结条件：前两个区间三阶导数相等
    A(1, 1:3) = [H(2), -(H(1)+H(2)), H(1)];
    b(1) = 0;

    % 中间节点方程（2 到 n-1）：标准三次样条方程
    for k = 2:n-1
        i = k;
        A(k, i-1:i+1) = [H(i-1), 2*(H(i-1) + H(i)), H(i)];
        b(k) = U(i-1);  % U 的索引对应中间节点
    end

    % 第二个非扭结条件：最后两个区间三阶导数相等
    A(n, n-2:n) = [-H(N), H(N-1)+H(N), -H(N-1)];
    b(n) = 0;

    % 求解线性系统
    M = A \ b;

    % 构造每个区间的样条系数
    S = zeros(N, 4);
    for k = 1:N
        h = H(k);
        mk = M(k);
        mk1 = M(k+1);

        S(k, 1) = (mk1 - mk) / (6 * h);                % a_k
        S(k, 2) = mk / 2;                                % b_k
        S(k, 3) = D(k) - h * (2 * mk + mk1) / 6;        % c_k
        S(k, 4) = Y(k);                                  % d_k
    end
end