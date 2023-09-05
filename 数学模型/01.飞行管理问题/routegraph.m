% 读入数据
planes = [[150, 140]; [85, 85]; [150, 155]; [145, 50]; [130, 150]; [0, 0]];
degrees = [243; 236; 220.5; 159; 230; 52];

for i = 1:6
    xs = [];
    ys = [];
    ts = [];
    x = planes(i, 1);
    y = planes(i, 2);
    t = 0;
    theta = deg2rad(degrees(i));
    while x < 160 && x >= 0 && y < 160 && y >= 0
        xs = [xs x];
        ys = [ys y];
        ts = [ts t];
        t = t + 1;
        x = x + 2 * cos(theta);
        y = y + 2 * sin(theta);
    end
    plot3(xs, ys, ts);
    hold on
end
xlabel("X");
ylabel("Y");
zlabel("时刻 t");
legend(["飞机1", "飞机2", "飞机3", "飞机4", "飞机5", "飞机6"]);
hold on