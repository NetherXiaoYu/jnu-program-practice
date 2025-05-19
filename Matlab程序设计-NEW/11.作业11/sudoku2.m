function sudoku2(m,X)
 %对数独初始矩阵X，填第m个格子
i=ceil(m/9);
 j=m-9*(i-1);
 if m>81
    disp(X);
    return;
 elseif X(i,j)~=0
    sudoku2(m+1,X)
 else
    X1=X(3*(ceil(i/3)-1)+(1:3),3*(ceil(j/3)-1)+(1:3));%i,j位于的宫格
    for k=1:9
        flag = 1;
        if i == j
            for n = 1:9
                if X(n, n) == k
                    flag = 0;
                end
            end
        end
        if i == 9-j+1
            for n = 1:9
                if X(n, 9-n+1) == k
                    flag = 0;
                end
            end
        end
        if ~any(X(i,:)==k)&&~any(X(:,j)==k)&&~any(X1(:)==k)&&flag==1
            X(i,j)=k;
            sudoku2(m+1,X);
        end
    end
 end
 end