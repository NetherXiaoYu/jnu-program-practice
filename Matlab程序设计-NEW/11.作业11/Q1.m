clear;
clc;

x=linspace(-2,1,1000);% x=linspace(-0.82,-0.72,1000)
y=linspace(-1.5,1.5,1000);% y=linspace(-0.18,-0.08,1000);
[X,Y]=meshgrid(x,y);
Y=flipud(Y);
Z0=X+1i*Y;
C1 = -0.123+0.745i;
C2 = -0.391-0.587i;
C3 = -0.75;
m=length(x);n=length(y);
K=zeros(m,n);
K1=zeros(m,n);
K2=zeros(m,n);
K3=zeros(m,n);
Z=Z0;
Z1=Z0;
Z2=Z0;
Z3=Z0;
for k=1:200
Z=Z.^2+Z0;
Z1=Z1.^2+C1;
Z2=Z2.^2+C2;
Z3=Z3.^2+C3;
K1(abs(Z1)<2)=k;
K2(abs(Z2)<2)=k;
K3(abs(Z3)<2)=k;
end
subplot(1, 3, 1);
title('C=-0.123+0.745i');
image(K1);
colormap(flipud(jet(32)));
subplot(1, 3, 2);
title('C=-0.391-0.587i');
image(K2);
colormap(flipud(jet(32)));
subplot(1, 3, 3);
title('C=-0.75');
image(K3);
colormap(flipud(jet(32)));