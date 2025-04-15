n = 6;
out = [1 1 2 2 3 4 5 6];
in = [2 3 3 4 4 1 6 5];
G = sparse(out, in, 1, n, n);

p = 0.85;
c = sum(G,1);
k = find(c);
D = sparse(k,k,1./c(k),n,n);
e = ones(n,1);
z = (1-p)/6*(c~=0)+1/n*(c==0);
A = p * G * D + e * z;

I = speye(n);
x = (I-p*G*D)\e;
x = x/sum(x);
bar(x)

U = {'www.alpha.com','www.beta.com','www.gamma.com','www.delta.com','www.rho.com','www.sigma.com'};
R = cell(7,3);
R(1,:) = {'Rank' 'PR值' 'url'};
R(2:7,1) = num2cell(1:6)';
R(2:7,2) = num2cell(x);
R(2:7,3) = U;
R(2:7,2:3) = sortrows(R(2:7,2:3),1,'descend');
disp(R)