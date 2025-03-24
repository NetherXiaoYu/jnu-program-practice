f = @(t) 9600*(1-exp(-t/15)) - 480*t;
df = @(t) (640)*exp(-t/15) - 480;
ddf = @(t) -(640/15) * exp(-t / 15);
r = @(t) 2400*(1-exp(-t/15));

[p0, err, k, y] = ex2_4_8_5(f, df, 7.17, 1e-11, 1e-11, 10000, 1);
fprintf("撞击地面时间为%.11f\n", p0)
fprintf("飞行距离为%.11f\n", feval(r, p0));

x = 0:0.01:10;
plot(x, f(x), 'b.');
xlabel('x');
ylabel('f(x)');
title('飞行高度');