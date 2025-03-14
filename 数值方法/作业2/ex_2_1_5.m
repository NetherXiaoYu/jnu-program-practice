clear;
clc;

g1 = @(x) x.^5-3*x.^3-2*x.^2+2;
g2 = @(x) cos(sin(x));
g3 = @(x) x.^2 - sin(x + 0.15);
g4 = @(x) real(x.^(x - cos(x)));

X = -3:0.001:3;
X1 = -2:0.0001:2;
GX1 = g1(X1);
GX2 = g2(X);
GX3 = g3(X);
GX4 = g4(X);

P1 = [];
P2 = [];
P3 = [];
P4 = [];

X_small = -3:0.01:3;
tol = 1e-12;
P1 =  [];
last_fix_pt = 0;
for i = X_small
    [k, p, err, P] = fixpt(g1, i, tol, 100000);
    if k ~= 100000 && abs(last_fix_pt - p) > 1e-3
        last_fix_pt = p;
        P1 = [P1, p];
    end
end

P2 =  [];
last_fix_pt = 0;
for i = X_small
    [k, p, err, P] = fixpt(g2, i, tol, 100000);
    if k ~= 100000 && abs(last_fix_pt - p) > 1e-3
        last_fix_pt = p;
        P2 = [P2, p];
    end
end

P3 =  [];
last_fix_pt = 0;
for i = X_small
    [k, p, err, P] = fixpt(g3, i, tol, 100000);
    if k ~= 100000 && abs(last_fix_pt - p) > 1e-3
        last_fix_pt = p;
        P3 = [P3, p];
    end
end

P4 =  [];
last_fix_pt = 0;
for i = X_small
    [k, p, err, P] = fixpt(g4, i, tol, 100000);
    if k ~= 100000 && abs(last_fix_pt - p) > 1e-3
        last_fix_pt = p;
        P4 = [P4, p];
    end
end

hold on;

subplot(2, 2, 1);
plot(X1, X1, 'b-');
hold on;
plot(X1, GX1, 'r-');
plot(P1, P1, 'go');
title("G1");

subplot(2, 2, 2);
plot(X, X, 'b-')
hold on;
plot(X, GX2, 'r-');
plot(P2, P2, 'go');
title("G2");

subplot(2, 2, 3);
plot(X, X, 'b-');
hold on;
plot(X, GX3, 'r-');
plot(P3, P3, 'go');
title("G3");

subplot(2, 2, 4);
plot(X, X, 'b-')
hold on;
plot(X, GX4, 'r-');
plot(P4, P4, 'go');
title("G4");