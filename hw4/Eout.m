function error=Eout(Wreg)
    error=0;
    test=load('hw4_test.dat');
    m=size(test,1);
    n=size(test,2);
    Z=test(:,1:(n-1));
    Z=[ones(m,1) Z];
    y=test(:,n);
   for i=1:m
       temp=sign(Z(i,:)*Wreg);
       if(temp~=y(i))
            error=error+1;
       end
   end
   error=error/m;
end