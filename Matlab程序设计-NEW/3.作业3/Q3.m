clear;
clc;

result = zeros(1, 7);
for yr = 1:400
    [num, name] = weekday(datetime(yr, 5, 1));
    result(num) = result(num) + 1;
end
bar(["Sun", "Mon", "Tue", "Wed", "Thur", "Fri", "Sat"], result);