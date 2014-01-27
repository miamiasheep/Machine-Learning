function myPlot(x1,x2,y,W)
    m=size(x1,1);
    for i=1:m
        if(y(i)==1)
            scatter(x1(i),x2(i),'r');
            hold on;
        end
        if(y(i)==-1)
            scatter(x1(i),x2(i),'b');
            hold on;
        end
    end
    %x=linspace(-1,1);
    %y=(-W(1)-W(2)*x)/W(3);
    %plot(x,y);
    
    hold off;
end