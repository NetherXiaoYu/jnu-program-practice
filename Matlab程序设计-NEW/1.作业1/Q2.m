s = 0;
for m = 1:10
    for n = 1:10
      s = s + (m * sqrt(n) - 1);  
    end
end
disp(s)