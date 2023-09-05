clear
clc
% 读入数据
planes = [[150, 140]; [85, 85]; [150, 155]; [145, 50]; [130, 150]; [0, 0]];
degrees = [243; 236; 220.5; 159; 230; 52];
degrees_original = [243; 236; 220.5; 159; 230; 52];

detectQueue = SimpleQueue();
detectQueue = push(detectQueue, 6);

while empty(detectQueue) ~= true
    [target, detectQueue] = pop(detectQueue);

    x6 = planes(target, 1);
    y6 = planes(target, 2);
    theta2 = deg2rad(degrees(target));
    flag = false;
    for i = 1:6
        if i == target
            continue
        end

        x = planes(i, 1);
        y = planes(i, 2);
        theta1 = deg2rad(degrees(i));
        
        t = -((x - x6)*(4*cos(theta1) - 4*cos(theta2)) + (y - y6)*(4*sin(theta1) - 4*sin(theta2)))/((2*sin(theta1) - 2*sin(theta2))*(4*sin(theta1) - 4*sin(theta2)) + (2*cos(theta1) - 2*cos(theta2))*(4*cos(theta1) - 4*cos(theta2)));
        d = ((x - x6 + 2*t*cos(theta1) - 2*t*cos(theta2))^2 + (y - y6 + 2*t*sin(theta1) - 2*t*sin(theta2))^2)^(1/2);
        if d <= 8
            disp(append("飞机 ", num2str(i), " 与新加入飞机将会在时刻 ", num2str(t), " 相撞，距离为 ", num2str(d), " km"))
            syms f(theta1, theta2)
            f(theta1, theta2) = ((x - x6 - (2*cos(theta1)*((x - x6)*(4*cos(theta1) - 4*cos(theta2)) + (y - y6)*(4*sin(theta1) - 4*sin(theta2))))/((2*sin(theta1) - 2*sin(theta2))*(4*sin(theta1) - 4*sin(theta2)) + (2*cos(theta1) - 2*cos(theta2))*(4*cos(theta1) - 4*cos(theta2))) + (2*cos(theta2)*((x - x6)*(4*cos(theta1) - 4*cos(theta2)) + (y - y6)*(4*sin(theta1) - 4*sin(theta2))))/((2*sin(theta1) - 2*sin(theta2))*(4*sin(theta1) - 4*sin(theta2)) + (2*cos(theta1) - 2*cos(theta2))*(4*cos(theta1) - 4*cos(theta2))))^2 + (y - y6 - (2*sin(theta1)*((x - x6)*(4*cos(theta1) - 4*cos(theta2)) + (y - y6)*(4*sin(theta1) - 4*sin(theta2))))/((2*sin(theta1) - 2*sin(theta2))*(4*sin(theta1) - 4*sin(theta2)) + (2*cos(theta1) - 2*cos(theta2))*(4*cos(theta1) - 4*cos(theta2))) + (2*sin(theta2)*((x - x6)*(4*cos(theta1) - 4*cos(theta2)) + (y - y6)*(4*sin(theta1) - 4*sin(theta2))))/((2*sin(theta1) - 2*sin(theta2))*(4*sin(theta1) - 4*sin(theta2)) + (2*cos(theta1) - 2*cos(theta2))*(4*cos(theta1) - 4*cos(theta2))))^2)^(1/2);
            degrees_delta = sum(abs(degrees_original - degrees));
            usable_degree = (pi / 6) - deg2rad(degrees_delta);
            [new_theta1, new_theta2, max_d] = newCalcMaxAndReturnParams(f, deg2rad(degrees(i)), deg2rad(degrees(target)), usable_degree);
            if max_d <= 8
                disp("没救了")
                flag = true;
                break;
            else
                degrees(i) = rad2deg(new_theta1);
                degrees(6) = rad2deg(new_theta2);
                disp(append("将飞机 ", num2str(i), "的飞行角度改为 ", num2str(degrees(i)), " ( ", num2str(new_theta1), " )度并且将检测飞机飞行角度改为 ", num2str(degrees(6)), " ( ", num2str(new_theta2), " )度，并且开始重新检测"))
                detectQueue = push(detectQueue, target);
                detectQueue = push(detectQueue, i);
                theta2 = y;
                break;
            end
        else
            disp(append("飞机 ", num2str(i), " 与新加入飞机并无相撞"))
        end
    end
    if flag
        break
    end
end
