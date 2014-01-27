function alpha=DualSVM(X,y)
    % Construct the H matrix
    H=zeros(size(X,1),size(X,1));
    for n = 1:size(X,1)
        for  m = 1:size(X,1)
            H(n,m) = y(n)*y(m)*(2+X(n,:)*X(m,:)')^2;
        end
    end
    
    % construct the f vector
    f = -1 * ones(size(X,1),1);
    
    % construct the A matrix
    A = -1*eye(size(X,1),size(X,1));
    
    
    % construct b vector
    b = zeros(size(X,1),1);

    
    %construct Aeq
    Aeq = zeros(1,size(X,1));
    for i=1:size(X,1)
        Aeq(i) = y(i);
    end
    
    %construct beq
    beq=0;
    
    %quadratic programming

    alpha=quadprog(H,f,A,b,Aeq,beq);
end