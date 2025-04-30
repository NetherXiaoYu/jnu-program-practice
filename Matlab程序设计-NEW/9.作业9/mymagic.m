function A = mymagic(n)
    M = (n - 2) / 4;
    A = zeros(n / 2, n / 2);
    B = zeros(n / 2, n / 2);
    C = zeros(n / 2, n / 2);
    D = zeros(n / 2, n / 2);
    %奇数阶的卢贝尔算法
     n_old=n/2;
     A(1,(n_old+1)/2)=1;
     B(1,(n_old+1)/2)=26;
     C(1,(n_old+1)/2)=51;
     D(1,(n_old+1)/2)=76;
     i=1;j=(n_old+1)/2;
     for m=2:n_old^2 
        k=i-1;p=j+1;
        if k==0
            k=k+n_old;
        end
        if p>n_old
            p=p-n_old;
        end
        if A(k,p)==0
            A(k,p)=m;
            B(k,p)=m+25;
            C(k,p)=m+50;
            D(k,p)=m+75;
            i=k;j=p;
        else
            i=i+1;
            A(i,j)=m;
            B(i,j)=m+25;
            C(i,j)=m+50;
            D(i,j)=m+75;
        end
     end
    c = (n_old + 1)/2;
    for k = 1:n_old
        if k ~= c
            tmp = D(k, 1:M);
            D(k, 1:M) = A(k, 1:M);
            A(k, 1:M) = tmp;
        else
            tmp = D(k, 1:M-1);
            D(k, 1:M-1) = A(k, 1:M-1);
            A(k, 1:M-1) = tmp;
        end
        tmp = C(k, n_old - M + 2:end);
        C(k, n_old - M + 2:end) = B(k, n_old - M + 2:end);
        B(k, n_old - M + 2:end) = tmp;
    end
    tmp = A(c, c);
    A(c, c) = D(c, c);
    D(c, c) = tmp;

    A = [A C; D B];
end