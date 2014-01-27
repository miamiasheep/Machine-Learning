function error=Ein(X,y,Wreg)
    m=size(X,1);
    error=0;
    for i=1:m
        error=error+log(1+exp(-y(i)*X(i,:)*Wreg));
    end
    error=error/m;
end