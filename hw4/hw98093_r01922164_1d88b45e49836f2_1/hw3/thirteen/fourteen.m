function Wlin=fourteen()
    [x1,x2,y]=generateData(1000);
    Wlin=LinearRegression2(x1,x2,y);
end