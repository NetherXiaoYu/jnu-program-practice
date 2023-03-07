function f = F()

cnt = zeros(7, 1);

for y = 1:1000
        n = datenum(y, 10, 1);
        [d, w] = weekday(n);
        cnt(d) = cnt(d) + 1;
end
n = sum(cnt);

bar(cnt);
set(gca, 'xtickLabel', {'Sun', 'Mon', 'Tue', 'Wed', 'Thur', 'Fri', 'Sat'})

end
