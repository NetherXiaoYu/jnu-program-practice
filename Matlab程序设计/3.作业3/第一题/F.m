function f = F()

x = input('Input X:');
y = input('Input Y:');

if x >= 0 && y >= 0
    f = x + y;
elseif x >= 0 && y < 0
    f = x + y * y;
elseif x < 0 && y >= 0
    f = x * x + y;
else
    f = x * x + y * y;
end

disp(f)

end
