function b=validation(X,y,X_temp,line)
    for i=1:size(X,1)
        temp=X_temp(i,:)*line;
        if(temp<=0)
            a(i)=-1;
        else
            a(i)=1;
        end
    end
  %  b=ones(size(X,1),1);
    b=1;
    for i=1:size(X,1)
        if(a(i)~=y(i))
            b=-1;
        end
    end
end