hxs = [];
xs = [];
for p  = 0.0001:0.0001:0.9999
    h = - p * (log(p)/log(2)) - (1-p) * (log(1-p) / log(2));
    hxs = [hxs h];
    xs = [xs p];
end
plot(xs, hxs);
xlabel("p（概率）");
ylabel("H（p）熵函数");
hold on;
