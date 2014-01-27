function [error1,error2]=RLR(lambda)
    train=load('hw4_train.dat');
    m=size(train,1);
    n=size(train,2);
    Z=train(:,1:(n-1));
    Z=[ones(m,1) Z];
    y=train(:,n);
    W=Wreg(Z,y,lambda);
    error1=Ein(W);
    error2=Eout(W);
end