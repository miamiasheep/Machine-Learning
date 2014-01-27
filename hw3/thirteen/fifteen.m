function error=fifteen(iteration)
    error=0;
    for i=1:iteration
        [x1 x2 y]=generateData(1000);    %generate training data
        Wlin=LinearRegression2(x1,x2,y); %training
        [x1 x2 y]=generateData(1000);    %generate testing data
        error=error+Eout(Wlin,x1,x2,y);  %testing
    end
    error=error/iteration;
end