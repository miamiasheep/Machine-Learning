function plotTest()
    train=load('hw4_test.dat');
    m=size(train,1);
    n=size(train,2);
    X=train(:,1:n-1);
    y=train(:,n);
    for i=1:m
        if(y(i)==1)
            scatter(X(i,1),X(i,2),'b');
            hold on;
        else
             scatter(X(i,1),X(i,2),'r');
             hold on;
        end
    end
end