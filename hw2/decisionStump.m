function [Ein,Eout,bestPosArray,bestSArray,EinArray]=decisionStump(iteration)
    Ein=0;
    Eout=0;
    count=1;
    for iter=1:iteration
        bestS=1;
        [x,y]=generateData();% I have already sort the data
        tempTheta=(x(1)-1)/2;
        errCount=0;
        s=1;
        for i=1:20
            tempAns=s*sign(x(i)-tempTheta);
            if(tempAns~=y(i))
                errCount=errCount+1;
            end
        end
        bestCount=errCount;
        bestPos=(x(1)-1)/2;
        tieCounter=1;
        for i=1:20
            if(i==20)
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
        tieCounter=0;
        %%%%%%%%%%%%s=-1
        errCount=0;
        s=-1;
        tempTheta=(x(1)-1)/2;
        for i=1:20
            tempAns=s*sign(x(i)-tempTheta);
            if(tempAns~=y(i))
                errCount=errCount+1;
            end
        end
        %bestCount=errCount;
        %bestPos=(x(1)-1)/2;
        tieCounter=1;
        for i=1:20
            if(i==20)
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
        %%%%%%%%%%%%%s=-1
        Ein=Ein+bestCount/20;
        Eout=Eout+((-(bestS-1)+bestS*abs(bestPos))/2);
        bestSArray(count)=bestS;
        bestPosArray(count)=bestPos;
        tie(count)=tieCounter;
         EinArray(count)=Ein;
        count=count+1;
        tieCounter=0;
        %{
        bestCount/20
        ((-(bestS-1)+bestS*abs(bestPos))/2)
        Ein
        Eout
        scatter(x,y);
        hold on;
        plot([bestPos bestPos],[-1 1]);
        bestS
        pause;
        hold off;
        %}
    end
    Ein=Ein/iteration;
    Eout=Eout/iteration;
    % How about s=-1??
    
end