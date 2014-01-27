function sixteen_Ecv()
        train=load('hw5_14_train.dat');
    X= train(:,1:10);
    X = [ones(size(X,1),1) X];
    y= train(:,11);
    m=size(X,1);
    lambdas=[0.001 1 1000];
    sigmas=[0.125 0.5 2];
    Ecv= zeros(3,3);
    chunk=size(X,1)/5;
        
    for i=1:3
        sigma=sigmas(i);
         
        for j=1:3
            lambda=lambdas(j);
            for k=1:5
                if(k==1)
                    Xtest=X(1:chunk,:);
                    ytest=y(1:chunk);
                    Xtrain=X(((chunk+1):size(X,1)),:);
                    ytrain=y(((chunk+1):size(X,1)));
                elseif(k==5)
                    Xtest=X(((4*chunk+1):size(X,1)),:);
                    ytest=y((4*chunk+1):size(X,1));
                    Xtrain=X((1:(4*chunk)),:);
                    ytrain=y(1:(4*chunk));
                else
                    Xtest=X( ((k-1)*chunk+1) : k*chunk , : );
                    ytest=y( ( (k-1)*chunk+1) : k*chunk );
                    Xtrain = [ X((1:(k-1)*chunk) ,:) ;
                               X((k*chunk+1):size(X,1),:)
                            ];
                    ytrain=[ y((1:(k-1)*chunk));
                             y((k*chunk+1):size(X,1))];
                end
                K=kernel(Xtrain,sigma);     % it is also my training part
                B=pinv(lambda*eye(4*chunk)+K)*ytrain;          % it is my training
                Ecv(i,j)=Ecv(i,j)+LSSVRtesting(B,Xtrain,Xtest,sigma,ytest);
            end
            Ecv(i,j)=Ecv(i,j)/5;
        end
    end
    dlmwrite('Ecv_sixteen.txt',Ecv);
end