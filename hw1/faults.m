function count=faults(line)
    count=0;
    data=load('hw1_18_test.dat');
    X=data(:,1:4);
    y=data(:,5);
    X_temp=[ones(size(X,1),1) X];
    for i=1:size(X,1)
        temp=X_temp(i,:)*line;
        if((temp<=0)&&(y(i)==1))
            count=count+1;
        elseif((temp>=0)&&(y(i)==-1))
            count=count+1;
        end
    end
end