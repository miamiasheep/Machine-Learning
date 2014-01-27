function error=Ein(Wreg)
    error=0;
    train=load('hw4_train.dat');
    m=size(train,1);
    n=size(train,2);
    Z=train(:,1:(n-1));
    Z=[ones(m,1) Z];
    y=train(:,n);
   for i=1:m
       temp=sign(Z(i,:)*Wreg);
       if(temp~=y(i))
            error=error+1;
       end
   end
   error=error/m;
end