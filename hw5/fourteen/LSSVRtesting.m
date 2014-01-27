function err=LSSVRtesting(B,X_train,X_test,sigma,y)
    err = 0;
    for i=1:size(X_test,1)
        guess=0;
        for j=1:size(X_train,1)
            guess=guess+B(j)*kernel_pair(X_train(j,:),X_test(i,:),sigma);
        end
        guess=sign(guess);
        if(y(i)~=guess)
            err=err+1;
        end
    end
    err=err/size(X_test,1);
end