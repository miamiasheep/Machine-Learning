function error=thirteen(iteration,debug)
    error=0;
    for i=1:iteration
        [x1,x2,y]=generateData(1000);
        Wlin=LinearRegression(x1,x2,y);
        error=error+Ein(Wlin,x1,x2,y);
        if(debug==1)
            myPlot(x1,x2,y,Wlin);
            Ein(Wlin,x1,x2,y)
            pause;
        end
    end
    error=error/iteration;
end