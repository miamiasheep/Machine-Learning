function [Ein,bestPos,bestS]=multiDS(dim)
    Ein=0;
    %Eout=0;
    data=load('hw2_train.dat');
    iteration=1;
    %for iter=1:iteration
    m=size(data,1);
    x=data(:,dim);
    temp_y=data(:,10);
    [x,perm]=sort(x);
    for i=1:m
        y(i,1)=temp_y(perm(i));
    end
    %[x y]
    bestS=1;
    tempTheta=(x(1)-10)/2;
    errCount=0;
    s=1;
    for i=1:m
        tempAns=s*sign(x(i)-tempTheta);
        if(tempAns~=y(i))
            errCount=errCount+1;
        end
    end
    bestCount=errCount;
    bestPos=(x(1)-1)/2;
    tieCounter=1;
    for i=1:m
        if(i==m)
            tempTheta=(x(i)+1)/2;
        else
            tempTheta=(x(i)+x(i+1))/2;
        end
        if(y(i)==1)
            errCount=errCount+1;
        else%y(i)==-1
            errCount=errCount-1;
            if(errCount<bestCount)   %The first one substitute the bestCount
                bestCount=errCount;
                bestPos=tempTheta;
                tieCounter=1;
            end
            if(errCount==bestCount)  % Tied , I should choose the median
                tieCounter=tieCounter+1;        %counter for tied
                bestPos=(bestPos*(tieCounter-1)+tempTheta)/tieCounter;
            end
        end
    end
        %%%%%%%%%%%%s=-1
    errCount=0;
    s=-1;
    tempTheta=(x(1)-10)/2;
    for i=1:m
        tempAns=s*sign(x(i)-tempTheta);
        if(tempAns~=y(i))
            errCount=errCount+1;
        end
    end
    %bestCount=errCount;
    %bestPos=(x(1)-1)/2;
    tieCounter=1;
    for i=1:m
        if(i==m)
            tempTheta=(x(i)+1)/2;
        else
            tempTheta=(x(i)+x(i+1))/2;
        end
        if(y(i)==-1)
            errCount=errCount+1;
        else%y(i)==-1
            errCount=errCount-1;
            if(errCount<bestCount)   %The first one substitute the bestCount
                bestCount=errCount;
                bestPos=tempTheta;
                tieCounter=1;
                bestS=-1;
        end
        if(errCount==bestCount)  % Tied , I should choose the median
            tieCounter=tieCounter+1;        %counter for tied
            bestPos=(bestPos*(tieCounter-1)+tempTheta)/tieCounter;
        end
        end
    end
   %{
    scatter(x,y);
    hold on;
    plot([bestPos bestPos],[-1 1]);
    hold off;
    %}
    Ein=Ein+bestCount/m;
end