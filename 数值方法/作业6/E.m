function z = E(u)
A = u(1);
B = u(2);
C = u(3);
D = u(4);
F = u(5);
r = @(A, B, C, D, F, x) A*cos(B*x)+C*sin(D*x)+F;
z = (r(A, B, C, D, F, 1) - 2.3134)^2 + (r(A, B, C, D, F, 2) - 3.4826)^2 + (r(A, B, C, D, F, 3)-8.7202)^2 + (r(A, B, C, D, F, 4)-1.8569)^2 + (r(A, B, C, D, F, 5)-3.6853)^2;
end