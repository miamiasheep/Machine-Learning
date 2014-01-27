function error=Eout(Wreg)
    test=load('hw3_test.dat');
    X=test(:,1:20);
    m=size(X,1);
    X=[ones(m,1) X];
    y=test(:,21);
    m=size(X,1);
    error=0;
    for i=1:m
        guess=sigmoid(X(i,:)*Wreg);
        if(guess>=0.5)
           if(y(i)==-1)
              error=error+1;
           end
        else
            if(y(i)==1)
              error=error+1;
           end
        end
    end
    error=error/m;
end