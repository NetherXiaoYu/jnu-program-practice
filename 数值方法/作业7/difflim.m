function [L, n] = difflim(f, x, toler)
max1=15;
h=1;
H(1)=h;
D(1)=(-feval(f, x+2*h)+8*feval(f, x+h)-8*feval(f, x-h)+feval(f, x-2*h))/(12*h);
E(1)=0;
R(1)=0;

for n=1:2
    h = h/10;
    H(n+1)=h;
    D(n+1)=(-feval(f, x+2*h)+8*feval(f, x+h)-8*feval(f, x-h)+feval(f, x-2*h))/(12*h);
    E(n+1)=abs(D(n+1)-D(n));
    R(n+1)=2*E(n+1)-(abs(D(n+1))+abs(D(n))+eps);
    fprintf("n = %d, h = %.13f, D = %.13f, E = %.13f, R = %.13f \n", n, h, D(n+1), E(n+1), R(n+1));
end
n=2;

while ((E(n)>E(n+1))&&(R(n)>toler)&&(n<max1))
    h = h/10;
    H(n+2)=h;
    D(n+2)=(-feval(f, x+2*h)+8*feval(f, x+h)-8*feval(f, x-h)+feval(f, x-2*h))/(12*h);
    E(n+2)=abs(D(n+2)-D(n+1));
    R(n+2)=2*E(n+2)-(abs(D(n+2))+abs(D(n+1))+eps);
    fprintf("n = %d, h = %.13f, D = %.13f, E = %.13f, R = %.13f \n", n+1, h, D(n+2), E(n+2), R(n+2));
    n = n + 1;
end

n = length(D)-1;
L = [H' D' E'];

end