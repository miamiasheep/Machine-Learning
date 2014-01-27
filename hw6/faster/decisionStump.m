function [dim,s,theta,best_count]=decisionStump(X,y,weight,perm)
     %在各個decision stump 裡找 Ein最小的
     m = size(X,1);
     n = size(X,2);
     %{
     dim =1;
     s=1;
     theta =0;
     %}
     
     best_count = 100*m;          %起始最小錯誤數(Reasonable?)
     min_index = 0;               %資料的最小index 
    
     for i = 1:n
         %{
        X = data(:, i);              %對第i維做decision stump
        [X,perm] = sort(X);          %對第i維的data做sorting;
        temp_y = data(:, size(data,2)); %OK 
        y= zeros(size(data,1),1);   
        for j = 1:size(data,1)
            y(j,1)=temp_y(perm(j));         %把y軸作排列
            weight(j) = no_change_weight(perm(j)); % 對weight作排列
        end
        %}

        % for  s=1 
        err_count = 0;
        for j=1:m
            if( y(j,i) == -1 )
                err_count = err_count + weight(perm(j,i));
            end
        end
        
        if(err_count<best_count)
            best_count = err_count;
            s=1;
            dim = i;
            theta = (min_index + X(1,i))/2;
        end

        for j= 1:size(X,1)
            if(y(j)==1)
                err_count = err_count + weight(perm(j,i));
            else
                err_count = err_count - weight(perm(j,i));
                if(err_count<best_count)
                    best_count = err_count;
                    s=1;
                    dim = i;
                    theta = (X(j,i) + X((j+1),i)) / 2;
                end
            end

        end
        
        
        % for  s=-1
        err_count = 0;
        for j=1:m
            if(y(j)==1)
                err_count = err_count+weight(perm(j,i));
            end
        end
        
        if(err_count<best_count)
            best_count = err_count;
            s=-1;
            dim = i;
            theta = (min_index + X(1,i))/2;
        end
        for j= 1:size(X,1)
            if(y(j)==-1)
                err_count = err_count + weight(perm(j,i));
            else
                err_count = err_count - weight(perm(j,i));
                if(err_count<best_count)
                    best_count = err_count;
                    s=-1;
                    dim = i;
                    theta = (X(j,i) + X((j+1),i)) / 2;

                end
            end
        end
       
    end % for i
    
    
    %complete one usual decision stump

    %s
   % myPlot(s,theta,dim,10*temp_weight);
   % pause;
    
end