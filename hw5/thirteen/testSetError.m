function err=testSetError(w)
    test=load('hw5_13_test.dat');
    X=test(:,1:2);
    y=test(:,3);
    m=size(X,1);
    err=0;
    b=w(1);
    w1=w(2);
    w2=w(3);
    for i=1:m
        temp_ans=sign(w2*X(i,2)+w1*X(i,1)+b);
        if(temp_ans ~= y(i))
            err=err+1;
        end
    end
    err=err/m;
end