x = [1 0; 0 1; 0 -1; -1 0; 0 2; 0 -2; -2 0];
y = [-1; -1; -1; 1; 1; 1; 1];
z = zeros(7, 2);
for i = 1:7
    z(i, :) = [x(i,2)^2-2*x(i,1)-2 x(i,1)^2-2*x(i,2)+3];
end
K = ((x*x')+2).^2;% Kernel by K(x, x') = (2 + x'x)^2
H = y*y'.*K;% the quarprog H matrix
f = -1*ones(7, 1);
A = -1*eye(7);
b = zeros(7,1);
Aeq = y';
Beq = 0;
lb = zeros(7, 1);
ub = ones(7,1);
%opts = optimoptions('quadprog','Algorithm','active-set','Display','off');

[x,fval,exitflag,output,lambda] = quadprog(H,f,A,b,Aeq,Beq);
x