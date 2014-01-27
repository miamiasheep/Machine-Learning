function error = testing(dim,s,theta,alpha,X,y)
    error = 0;
    for i= 1 : size(X,1)
        pred = voting(dim,s,theta,alpha,X(i,:));
        if(pred ~= y(i))
            error = error + 1;
        end
    end
    error = error/size(X,1);
end