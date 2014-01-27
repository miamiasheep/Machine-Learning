function Wlin=LinearRegression2(x1,x2,y)
    m=size(x1,1);
    X=[ones(m,1) x1 x2 x1.*x2 x1.^2 x2.^2];
    Wlin=pinv(X)*y;
end