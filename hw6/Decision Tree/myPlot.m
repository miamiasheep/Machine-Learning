function myPlot(tree)
    data = load('hw6_train.dat');
    X = data(:,1:2);
    y = data(:,3);
    for i = 1:size(X,1)
        if(y(i) == -1)
            scatter(X(i,1),X(i,2),'r*');
            hold on;
        else
            scatter(X(i,1),X(i,2),'b');
            hold on;
        end
        
    end
    
    for i = 1:23
        if(tree(i).exist==1)
            if(tree(i).dim==1)
                y=linspace(0,1,1000);
                x=tree(i).theta;
                plot(x,y);
                hold on;
            elseif(tree(i).dim==2)
                x= linspace(0,1,100);
                y= tree(i).theta;
                plot(x,y);
                hold on;
                
            else
                fprintf('error! parameter dim must be 1 or two \n');
                pause;
            end
            i
            pause;
        end
        
    end
    hold off;
end