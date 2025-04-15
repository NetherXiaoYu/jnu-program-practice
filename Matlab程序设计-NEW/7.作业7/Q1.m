data = readcell("test.xlsx");
[num, ~] = size(data);
new_data = data;
new_data(1, 10) = cellstr("总成绩");
for n = 2:num
    row = cell2mat(data(n, 2:end));
    result = row(1) * 0.3 / 13 + 0.7 * (sum(row(2:end))) / 7;
    new_data(n, 10) = num2cell(result);
end
writecell(new_data, 'test.xlsx');