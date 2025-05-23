clear;
clc;

function dydt = logistic_ode(P, t)
    r = 0.1;
    K = 1000;
    dydt = r * P * (1 - P/K);
end

a = 0;
b = 100;
P0 = 10;

[t, P] = solve_ode(@logistic_ode, [a, b], P0);

figure;
plot(t, P, 'b-', 'LineWidth', 2);
xlabel('时间 t');
ylabel('人口数量 P(t)');
title('Logistic 人口增长模型');
grid on;

clc;
clear;

function dydt = predator_prey(y, t)
    alpha = 1.5;
    beta = 1.0;
    delta = 0.8;
    gamma = 3.0;
    x = y(1);
    y_pop = y(2);

    dxdt = alpha .* x - beta .* x .* y_pop;
    dydt = delta .* x .* y_pop - gamma .* y_pop;

    dydt = [dxdt; dydt]';
end

a = 0;
b = 15;
initial = [10; 5];

[pops, t] = solve_ode(@predator_prey, [a, b], initial);

x = pops(:, 1);
y = pops(:, 2);

figure;
plot(t, x, 'b-', t, y, 'r--', 'LineWidth', 2);
legend('猎物', '捕食者');
xlabel('时间 t');
ylabel('种群数量');
title('Lotka-Volterra 捕猎者-猎物模型');
grid on;