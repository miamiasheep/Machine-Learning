function K=kernel_matrix(X)
    m=size(X,1);
    K=zeros(m,m);
    for i=1:m
        for j=1:m
            K(i,j) = -2*(X(i,:)*X(j,:)')^2+3*(X(i,:)*X(j,:)');
        end
    end
end