function [string] = decode_string(code)
len = strlength(code);
code = char(code);
string = "";
i = 1;
flag = true;
while i < len
    sub_code = "";

    if code(i) == ' '
        if flag == false
            flag = true;
            string = string + ' ';
        end
        i = i + 1;
        continue
    end

    while code(i) ~= ' ' && i < len
        % disp(i)
        % disp(code(i))
        sub_code = sub_code + code(i);
        i = i + 1;
    end

    while strlength(sub_code) < 4
        sub_code = sub_code + ' ';
    end

    i = i + 1;
    % disp(sub_code)

    string = string + decode(char(sub_code));
    flag = false;
end
end
