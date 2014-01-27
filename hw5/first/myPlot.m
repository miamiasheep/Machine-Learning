function myPlot(X,y,option,holdOpt)
    for i=1:size(X,1)
       if(y(i)==-1)
            scatter(X(i,1),X(i,2),'r');
            hold on;
       else
           scatter(X(i,1),X(i,2),'b');
           hold on;
       end
       if(option==1)
        pause;
       end
   end
   if(holdOpt==1)
       hold on;
   else
       hold off;
   end
   

end