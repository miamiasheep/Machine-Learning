function ans=Wreg(Z,y,lambda)
    m=size(Z,1);
    n=size(Z,2);
    ans=(inv((Z'*Z)+(lambda*eye(n)))*Z')*y;
end