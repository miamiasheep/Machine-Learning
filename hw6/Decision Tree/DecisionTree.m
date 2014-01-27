function tree = DecisionTree(data,cur,tree)
    %要回傳的樹有兩個Field分別是theta還有dim
    min_index = 0;               %資料的最小index 
    max_index = 1;
    num_of_labels = 2; % 1 and -1
    count = zeros(2,num_of_labels);   %1是左2是右
    best_score = 1 * size(data,1);   %最爛的gini_index是1，所以我把它當起始值
    
    for i = 1:(size(data,2)-1)
        X = data(:,i);
        temp_y = data(:,size(data,2));
        [X perm] = sort(X);
        y = temp_y(perm);
        
        count(1,1) = 0;
        count(1,2) = 0;
        count(2,1) = size(find(y == 1),1);
        count(2,2) = size(find(y == -1),1);
        score = gini_index(count);
        if(score<best_score)
            best_score = score;
            tree(cur).theta = (min_index+X(1))/2; 
            best_count = count;
            tree(cur).dim = i;
        end
        for j=1:(size(data,1)-1);
            if(y(j) == 1)
                count(1,1)=count(1,1)+1;
                count(2,1)=count(2,1)-1;
                score = gini_index(count);
                if(score<best_score)
                    best_score = score;
                    tree(cur).theta = (X(j)+X(j+1))/2; 
                    best_count = count;
                    tree(cur).dim = i;
                end
            else
                count(1,2)=count(1,2)+1;
                count(2,2)=count(2,2)-1;
                score = gini_index(count);
                if(score<best_score)
                    best_score = score;
                    tree(cur).theta = (X(j)+X(j+1))/2; 
                    tree(cur).dim = i;
                    best_count =count;
                end
            end
        end % for j : every node
    end % for i : dimension
    tree(cur).exist = 1;
    if(best_score == 0)
        fprintf('complete!!!!\n');
        tree(cur).best_count = best_count;
    else
        data1 = data(data(:,tree(cur).dim)<tree(cur).theta,:);
        data2 = data(data(:,tree(cur).dim)>tree(cur).theta,:);
        
        tree = DecisionTree(data1,2*cur,tree);
        tree = DecisionTree(data2,2*cur+1,tree);
    end
end