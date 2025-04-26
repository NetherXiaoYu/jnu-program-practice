clear;
clc;

x=0:0.01:pi/2;
m=length(x);
s=ones(1,m);
term=ones(1,m);
n=0;
while max(abs(term))>eps
    n=n+1;
    if n == 1
        term = x;
        s = term;
    else
        term = (-1/(n*(n+1))) * (x.^2) .* term;
        s = s+term;
    end
end
plot(x,s,'r');
hold on;
plot(x,sin(x),'--');