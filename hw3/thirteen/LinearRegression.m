function Wlin=LinearRegression(x1,x2,y)
    m=size(x1,1);
    X=[ones(m,1) x1 x2];
    Wlin=pinv(X)*y;
end