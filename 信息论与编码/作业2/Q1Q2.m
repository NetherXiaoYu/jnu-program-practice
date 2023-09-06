clc;
clear;
symbols_input = input("请输入离散信源的符号（用,隔开）：", "s");
chances_input = input("请按顺序输入分布概率（用,隔开）：", "s");
symbols = strsplit(symbols_input, ',');
chances = str2double(strsplit(chances_input, ','));

if length(symbols) ~= length(chances)
    disp("请输入对等数量的符号与概率！")
else
    % 检查离散信源概率分布，去除信源中概率为 0 的符号
    n = length(symbols);
    new_symbols = [];
    new_chances = [];
    for i = 1:n
        if chances(i) ~= 0
            new_symbols = [new_symbols symbols(i)];
            new_chances = [new_chances chances(i)];
        end
    end
    disp(["去除信源中概率为 0 的符号之后的符号列表为：", new_symbols]);
    symbols = new_symbols;
    chances = new_chances;
    n = length(chances);

    % 计算信源熵
    source_entropy = 0;
    for i = 1:n
        source_entropy = source_entropy - chances(i) * (log(chances(i)) / log(2));
    end
    disp(append("信源熵为：", num2str(source_entropy)));


end
