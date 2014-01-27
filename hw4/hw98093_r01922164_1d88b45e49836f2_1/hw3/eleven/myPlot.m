function myPlot(number,a,b,c,d,e,f)
    x=[1 1 -1 -1 0 1];
    y=[1 -1 -1 1 0 0];
    x=x(1:number);
    y=y(1:number);
    scatter(x,y);
    hold on;
    ezplot('x^2+6*x*y+3*y^2+2*x+2*y = 1.2');
    axis([-3,3,-3,3]);
    hold off;
end