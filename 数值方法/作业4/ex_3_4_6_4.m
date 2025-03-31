function X = ex_3_4_6_4(A, B)

    [~, N] = size(A);
    X = zeros(N, 1);
    C = zeros(1, N+1);
    Aug = [A B];
    disp(Aug);
    for p = 1:N-1
        max_ratio = 0;
        pivot_row = 0;
        for k = p:N
            current_row = Aug(k, p:end);
            max_in_row = max(abs(current_row));
            if max_in_row == 0
                ratio = 0;
            else
                ratio = abs(Aug(k,p)) / max_in_row;
            end
            
            if ratio > max_ratio || (ratio == max_ratio && k < pivot_row)
                max_ratio = ratio;
                pivot_row = k;
            end
        end
        
        if pivot_row ~= p
            Aug([p, pivot_row], :) = Aug([pivot_row, p], :);
        end
        
        if Aug(p, p) == 0
            break;
        end

        for k = p+1:N
            m = Aug(k, p) / Aug(p, p);
            Aug(k, p:N+1) = Aug(k,p:N+1) - m * Aug(p,p:N+1);
        end

    end
    disp(Aug);
    X = backsub(Aug(1:N, 1:N), Aug(1:N, N+1));
end