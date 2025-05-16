function S = csfit_parabolic_runout(X, Y)
    N = length(X) - 1;

    if N < 2
        error('At least 3 data points are required for cubic spline interpolation.');
    end

    H = diff(X);                % 各区间的宽度
    D = diff(Y) ./ H;           % 一阶差商
    U = 6 * diff(D);            % 构造方程的右侧向量

    n = N + 1;                  % 未知数个数：M(1) 到 M(n)
    A = zeros(n, n);            % 系数矩阵初始化
    b = zeros(n, 1);            % 右侧向量初始化

    % -------------------
    % 边界条件：抛物线终结（M(1) = M(2), M(n) = M(n-1)）
    % -------------------

    % 第一个边界条件：M(1) = M(2)
    A(1, 1) = 1;
    A(1, 2) = -1;
    b(1) = 0;

    % 中间节点方程（2 到 n-1）：标准三次样条方程
    for k = 2:n-1
        A(k, k-1) = H(k-1);
        A(k, k)   = 2 * (H(k-1) + H(k));
        A(k, k+1) = H(k);
        b(k)      = U(k-1);
    end

    % 最后一个边界条件：M(n) = M(n-1)
    A(n, n-1) = -1;
    A(n, n)   = 1;
    b(n)      = 0;

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