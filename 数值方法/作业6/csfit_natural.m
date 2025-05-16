function S = csfit_natural(X, Y)
    N = length(X) - 1;
    if N < 2
        error('At least 3 points are required for spline interpolation.');
    end

    H = diff(X);                % 各区间的宽度
    D = diff(Y) ./ H;           % 一阶差商
    U = 6 * diff(D);            % 右端向量

    % 三对角矩阵系数
    B = 2 * (H(1:N-1) + H(2:N)); % 主对角线
    C = H(2:N);                  % 上对角线（右上）
    A = H(2:N-1);                % 下对角线（左下）

    n_eq = N - 1;                % 方程数量
    C_prime = zeros(n_eq, 1);
    U_prime = zeros(n_eq, 1);

    % 追赶法：向前消元
    C_prime(1) = C(1) / B(1);
    U_prime(1) = U(1) / B(1);
    
    for i = 2:n_eq
        denom = B(i) - A(i-1) * C_prime(i-1);
        C_prime(i) = C(i) / denom;
        U_prime(i) = (U(i) - A(i-1) * U_prime(i-1)) / denom;
    end

    % 回代求解
    M_mid = zeros(n_eq, 1);
    M_mid(n_eq) = U_prime(n_eq);
    for i = n_eq-1:-1:1
        M_mid(i) = U_prime(i) - C_prime(i) * M_mid(i+1);
    end

    % 构造完整的 M 向量（包含边界条件 M(1)=M(end)=0）
    M = zeros(N+1, 1);
    M(2:end-1) = M_mid;

    % 计算每个区间的系数矩阵 S
    S = zeros(N, 4);
    for k = 0:N-1
        h = H(k+1);
        mk = M(k+1);
        mk1 = M(k+2);
        
        S(k+1, 1) = (mk1 - mk) / (6 * h);                % a_k
        S(k+1, 2) = mk / 2;                              % b_k
        S(k+1, 3) = D(k+1) - h * (2 * mk + mk1) / 6;     % c_k
        S(k+1, 4) = Y(k+1);                              % d_k
    end
end