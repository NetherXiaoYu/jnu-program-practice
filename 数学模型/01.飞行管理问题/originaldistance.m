% 读入数据
planes = [[150, 140]; [85, 85]; [150, 155]; [145, 50]; [130, 150]; [0, 0]];
degrees = [243; 236; 220.5; 159; 230; 52];

for i = 1:5
    x6 = planes(6, 1);
    y6 = planes(6, 2);
    degree6 = deg2rad(degrees(6));
    t = 0;
    x = planes(i, 1);
    y = planes(i, 2);
    d = sqrt((x - x6)^2 + (y - y6)^2);
    degree = deg2rad(degrees(i));
    ts = [];
    ds = [];
    xs = [];

    while x < 160 && x >= 0 && y < 160 && y >= 0 && x6 < 160 && x6 >= 0 && y6 < 160 && y6 >= 0
        ts = [ts t];
        ds = [ds d];
        xs = [xs 8];

        x = x + 2 * cos(degree);
        y = y + 2 * sin(degree);
        x6 = x6 + 2 * cos(degree6);
        y6 = y6 + 2 * sin(degree6);

        d = sqrt((x - x6)^2 + (y - y6)^2);
        t = t + 1;
    end
    subplot(2, 3, i)
    plot(ts, ds);
    hold on
    plot(ts, xs);
    hold on
    title(append(append("飞机 ", int2str(i)), " 与目标飞机距离"))
    legend("距离", "基准(8km)")
    xlabel("时刻t")
    ylabel("距离d (km)")
    hold on
end