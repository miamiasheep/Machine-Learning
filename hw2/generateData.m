function [x,y]=generateData()
    x=rand(20,1)*2-1;
    for i=1:size(x,1)
        temp=rand(1,1);
        if(x(i)>0)
            if(temp<0.2)
                temp_y(i,1)=-1;
            else
                temp_y(i,1)=1;
            end
        else
            if(temp<0.2)
                temp_y(i,1)=1;
            else
                temp_y(i,1)=-1;
            end
        end
    end
   [x,perm]=sort(x);
   for i=1:20
        y(i,1)=temp_y(perm(i));
   end
end