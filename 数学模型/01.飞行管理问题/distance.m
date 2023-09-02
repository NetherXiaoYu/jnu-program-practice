% 读入数据
planes = [[150, 140]; [85, 85]; [150, 155]; [145, 50]; [130, 150]; [0, 0]];
degrees = [243; 236; 220.5; 159; 230; 52];
degrees_new = [243; 236; 250.5; 159; 230; 52];

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

    % new things
    x6_new = planes(6, 1);
    y6_new = planes(6, 2);
    x_new = planes(i, 1);
    y_new = planes(i, 2);
    degree6_new = deg2rad(degrees_new(6));
    degree_new = deg2rad(degrees_new(i));
    d_new = sqrt((x_new - x6_new)^2 + (y_new - y6_new)^2);
    ds_new = [];

    while x < 160 && x >= 0 && y < 160 && y >= 0 && x6 < 160 && x6 >= 0 && y6 < 160 && y6 >= 0
        ts = [ts t];
        ds = [ds d];
        xs = [xs 8];

        ds_new = [ds_new d_new];

        x = x + 2 * cos(degree);
        y = y + 2 * sin(degree);
        x6 = x6 + 2 * cos(degree6);
        y6 = y6 + 2 * sin(degree6);

        x_new = x_new + 2 * cos(degree_new);
        y_new = y_new + 2 * sin(degree_new);
        x6_new = x6_new + 2 * cos(degree6_new);
        y6_new = y6_new + 2 * sin(degree6_new);

        d = sqrt((x - x6)^2 + (y - y6)^2);
        d_new = sqrt((x_new - x6_new)^2 + (y_new - y6_new)^2);
        t = t + 1;
    end
    subplot(2, 3, i)
    plot(ts, ds);
    hold on
    plot(ts, ds_new)
    hold on
    plot(ts, xs);
    hold on
    title(append(append("飞机 ", int2str(i)), " 与目标飞机距离"))
    legend("距离", "调整后距离", "基准(8km)")
    xlabel("时刻t")
    ylabel("距离d (km)")
    hold on
end
