function Ein=fifteen_Ein()
    train=load('hw5_14_train.dat');
    X= train(:,1:10);
    y= train(:,11);
    costs=[0.001 1 1000];
    sigmas=[0.125 0.5 2];
    Ein= zeros(3,3);
    %%%% Ein and the number of support vectors%%%%
    for i = 1:3
        for j=1:3
            sigma=sigmas(i);
            C=costs(j);
            fprintf('======================\n');
            fprintf('sigma=%f\n',sigma);
            fprintf('C=%f\n',C);
            gamma=1/(2*sigma^2);
            str=sprintf('-s 3 -c %f -g %f',C,gamma);
            model = svmtrain(y, X, str);
            [predict_label, accuracy, dec_values] = svmpredict(y, X, model);
            error=0;

            for k=1:size(X,1)
                guess=sign(predict_label(k));
                if(guess~=y(k))
                    error = error + 1;
                end
            end
            fprintf('======================\n');
            Ein(i,j)= error/size(X,1);
        end
    end
    dlmwrite('Ein_fifteen.txt',Ein);
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
end