function ans = gini_index(count)
    %在ML作業我設定count(1,:)是左邊，count(2,:)是右邊
    %count(:,1)是正，count(:,2)是負
    ans = 0;
    %N = sum(count(1,:))+sum(count(2,:));
    for i=1:size(count,1)
        temp_add =0;
        for j= 1:size(count,2)
            temp_add = temp_add + ( count(i,j)/ sum(count(i,:)))^2;  
        end
        gini = 1- temp_add;
        ans = ans + sum(count(i,:)) * gini ;
    end
end