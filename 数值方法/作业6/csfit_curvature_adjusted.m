function S = csfit_curvature_adjusted(X, Y, k0, kn)
    N = length(X) - 1;
    if N < 2
        error('At least 3 data points are required for cubic spline interpolation.');
    end

    % 区间宽度
    H = diff(X);
    % 一阶差商
    D = diff(Y) ./ H;
    % 构造方程右侧向量
    U = 6 * diff(D);  % 长度为 N-1

    % 系统维数：M(1) 到 M(N+1)
    n = N + 1;
    A = zeros(n, n);
    b = zeros(n, 1);

    % -------------------
    % 边界条件：端点曲率调整
    % -------------------

    % M(1) = k0
    A(1, 1) = 1;
    b(1) = k0;

    % M(n) = kn
    A(n, n) = 1;
    b(n) = kn;

    % -------------------
    % 中间节点方程（2 到 n-1）
    % -------------------

    for i = 2:n-1
        A(i, i-1) = H(i-1);
        A(i, i)   = 2 * (H(i-1) + H(i));
        A(i, i+1) = H(i);
        b(i)      = U(i-1);
    end

    % 求解线性系统
    M = A \ b;

    % -------------------
    % 构造每个区间的样条系数 [a, b, c, d]
    % -------------------

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