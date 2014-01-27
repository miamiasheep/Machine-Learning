function K=kernel(X,sigma)
    m=size(X,1);
    K=zeros(m,m);
    for i=1:m
        for j=1:m
            K(i,j)=exp( (-(X(i,:)-X(j,:)) * (X(i,:)-X(j,:))') / (2*sigma^2) );
        end
    end
end