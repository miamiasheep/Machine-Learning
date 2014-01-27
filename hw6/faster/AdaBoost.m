function AdaBoost(iteration)
    data = load('hw6_train.dat');
    m = size(data,1);
    n = size(data,2);
   
    % sorting in only one time
    X = data(:,1:n-1);
    Y = data(:,n);
    y = zeros(m,n-1);
    perm = zeros(m,n-1);
    for i=1:(n-1)
        [X(:,i) perm(:,i)] = sort(X(:,i));
        y(:,i) = Y(perm(:,i));
    end
    weight = ones(m,1);
    
    
    dim = zeros(iteration,1);
    theta = zeros(iteration,1);
    s = zeros(iteration,1);
    alpha = zeros(iteration, 1);
    
    
    for iter=1:iteration
        [dim(iter),s(iter),theta(iter),best_count] = decisionStump(X,y,weight,perm);
        eps = best_count / sum(weight); 
        update_factor = sqrt( (1-eps) / eps);
        %reweighting
        for i = 1:size(data,1)
           if( ( s(iter) * sign( X (i,dim(iter) ) - theta( iter ) ) ) ~= y(i,dim(iter)) )
               weight(perm(i,dim(iter))) = weight(perm(i,dim(iter))) * update_factor;
           else
               weight(perm(i,dim(iter))) = weight(perm(i,dim(iter))) / update_factor;
           end
        end
        %calulate the alpha
        alpha(iter) = log(update_factor);
    end %iter end
    
    %testing
    %error = testing(dim,s,theta,alpha,X,y)
    train_error = testing(dim,s,theta,alpha,X,y);
    fprintf('training error is : %f \n', train_error);
    %test = load('hw6_test.dat');
    %X_test = test(:,1:(size(data,2)-1));
    %y_test = test(:,size(data,2));
    %test_error = testing(dim,s,theta,alpha,X_test,y_test);
    %fprintf('testing error is : %f \n',test_error);
end % function end