function error = testing(dim,s,theta,alpha,X,y)
    error = 0;
    m = size(X,1);
    for i= 1 : m
        pred = voting(dim,s,theta,alpha,X(i,:));
        if(pred ~= y(i,dim))
            error = error + 1;
        end
    end
    error = error/m;
end