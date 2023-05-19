function [code] = encode_bfs_string(str)
code = "";
str = char(upper(str));
len = strlength(str);
for i = 1:len
    if str(i) >= 'A' && str(i) <= 'Z'
        code = code + encode_bfs(str(i));
    else
        code = code + " ";
    end
    code = code + " ";
end
end
