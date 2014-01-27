function HwPlot(s,theta,dim,weight)
    data = load('hw6_train.dat');
    X = data(:,1:2);
    y = data(:,3);
    [temp, perm] = sort(weight);
    for i = 1:size(X,1)
        if(y(i) == -1)
            if(weight(i)>=temp(91))
                scatter(X(i,1),X(i,2),300,'k*');
                hold on;
                continue;
            end
            scatter(X(i,1),X(i,2),'r*');
            hold on;
        else
            if(weight(i)>=temp(91))
                scatter(X(i,1),X(i,2),300,'k');
                hold on;
                continue;
            end
            scatter(X(i,1),X(i,2),'b');
            hold on;
        end
        
       
    end
    if(dim==1)
        y=linspace(0,1,1000);
        x=theta;
        plot(x,y);
        hold on;
    elseif(dim==2)
        x= linspace(0,1,100);
        y=theta;
        plot(x,y);
        hold on;
    else
        fprintf('error! parameter dim must be 1 or two \n');
        pause;
    end
    hold off;
end