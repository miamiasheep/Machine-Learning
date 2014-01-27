function [dim,s,theta,best_count]=decisionStump(data,weight)
     %�b�U��decision stump �̧� Ein�̤p��
     dim =1;
     s=1;
     theta =0;
     best_count = sum(weight);    %�_�l�̤p���~��
     min_index = 0;               %��ƪ��̤pindex 
     no_change_weight =weight;
    for i = 1:(size(data,2)-1)
        X = data(:, i);              %���i����decision stump
        [X,perm] = sort(X);          %���i����data��sorting;
        temp_y = data(:, size(data,2)); %OK 
        y= zeros(size(data,1),1);   
        for j = 1:size(data,1)
            y(j,1)=temp_y(perm(j));         %��y�b�@�ƦC
            weight(j) = no_change_weight(perm(j)); % ��weight�@�ƦC
        end


        % for  s=1 
        err_count = 0;
        for j=1:size(data,1)
            if( y(j) == -1 )
                err_count = err_count + weight(j);
            end
        end
        
        if(err_count<best_count)
            best_count = err_count;
            s=1;
            dim = i;
            theta = (min_index + X(1))/2;
        end

        for j= 1:size(X,1)
            if(y(j)==1)
                err_count = err_count + weight(j);
            else
                err_count = err_count - weight(j);
                if(err_count<best_count)
                    best_count = err_count;
                    s=1;
                    dim = i;
                    theta = (X(j) + X(j+1)) / 2;
                end
            end

        end
        
        
        % for  s=-1
        err_count = 0;
        for j=1:size(data,1)
            if(y(j)==1)
                err_count = err_count+weight(j);
            end
        end
        
        if(err_count<best_count)
            best_count = err_count;
            s=-1;
            dim = i;
            theta = (min_index + X(1))/2;
        end
        for j= 1:size(X,1)
            if(y(j)==-1)
                err_count = err_count + weight(j);
            else
                err_count = err_count - weight(j);
                if(err_count<best_count)
                    best_count = err_count;
                    s=-1;
                    dim = i;
                    theta = (X(j) + X(j+1)) / 2;

                end
            end
        end
       
    end % for i
    
    
    %complete one usual decision stump

    %s
   % myPlot(s,theta,dim,10*temp_weight);
   % pause;
    
end