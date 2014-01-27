function SGD(iteration,learningRate)
    train=load('hw3_train.dat');
     X=train(:,1:20);
     m=size(X,1);
     X=[ones(m,1) X];
     y=train(:,21);
     m=size(X,1);
     Wreg=zeros(21,1);
     for t=1:iteration
         for i=1:m
            v=((y(i)*X(i,:))/(1+exp(y(i)*X(i,:)*Wreg)));
            Wreg=Wreg+learningRate.*v';
         end
         
        %fprintf('Ein is %f\n',Ein(X,y,Wreg));
        %fprintf('Eout is %f\n',Eout(Wreg)); 
        %pause;
     end
     %fprintf('Ein is %f\n',Ein(X,y,Wreg));
     fprintf('Eout is %f\n',Eout(Wreg)); 
end