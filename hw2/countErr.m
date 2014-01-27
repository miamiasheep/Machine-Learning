function error=countErr(pos,s,dim,tr)
    if(tr==0)
        data=load('hw2_test.dat');
    else
        data=load('hw2_train.dat');
    end
    x=data(:,dim);
    y=data(:,10);
    m=size(data,1);
    error=0;
    if(s==1)
        for i=1:m
            if(x(i,1)<pos)
                if(y(i)==1)
                    error=error+1;
                end
            else%x(i,1)>pos
                if(y(i)==-1)
                    error=error+1;
                end
            end
        end 
    end
    if(s==-1)
        for i=1:m
            if(x(i,1)<pos)
                if(y(i,1)==-1)
                    error=error+1;
                   
                end
            else%x(i,1)>pos
                if(y(i,1)==1)
                    error=error+1;
                end
            end
        end 
    end
    error=error/m;
end