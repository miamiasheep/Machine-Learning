function AdaBoost(iteration)
    data = load('hw6_train.dat');
    X = data(:,1:(size(data,2)-1));
    y = data(:,size(data,2));
    weight = ones(size(data,1),1);
    
    dim = zeros(iteration,1);
    theta = zeros(iteration,1);
    s = zeros(iteration,1);
    alpha = zeros(iteration, 1);
    
    for iter=1:iteration
        [dim(iter),s(iter),theta(iter),best_count] = decisionStump(data,weight);
        eps = best_count / sum(weight); 
        update_factor = sqrt( (1-eps) / eps);
        %reweighting
        for i = 1:size(data,1)
           if( ( s(iter) * sign( X (i,dim(iter) ) - theta( iter ) ) ) ~= y(i) )
               weight(i) = weight(i) * update_factor;
           else
               weight(i) = weight(i) / update_factor;
           end
        end
        %calulate the alpha
        alpha(iter) = log(update_factor);
    end %iter end
    HwPlot(s(iteration),theta(iteration),dim(iteration),weight);
    %testing
    %error = testing(dim,s,theta,alpha,X,y)
    train_error = testing(dim,s,theta,alpha,X,y);
    fprintf('training error is : %f \n', train_error);
    test = load('hw6_test.dat');
    X_test = test(:,1:(size(data,2)-1));
    y_test = test(:,size(data,2));
    test_error = testing(dim,s,theta,alpha,X_test,y_test);
    fprintf('testing error is : %f \n',test_error);
    U = sum(weight);
    fprintf('U is :%f \n',U);
    
end % function end