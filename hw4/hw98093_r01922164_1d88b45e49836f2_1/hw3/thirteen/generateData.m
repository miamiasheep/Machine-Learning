function [x1,x2,y]=generateData(number)
    x1=2*rand(number,1)-1;
    x2=2*rand(number,1)-1;
    y=sign(x1.^2+x2.^2-0.6);
    for i=1:number
        change=rand(1,1);
        if(change>0.9)
            y(i)=-y(i);
        end
    end
end