function plotBoundary(X,y,line)
    plotData(X,y); 
    hold on;
    ya=linspace(-5,5);
    yb=(-line(2)*ya-line(1))/line(3);
    plot(ya,yb,'-b');
end