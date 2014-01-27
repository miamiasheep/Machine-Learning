function Ecv=fourteen_CV()
    data=load('hw5_14_train.dat');
    X= data(:,1:10);
    y= data(:,11);
    costs=[0.001 1 1000];
    sigmas=[0.125 0.5 2];
    chunk = size(X,1)/5;

    Ecv = zeros(3,3);
    %sapling
        for i = 1:3
            for j=1:3
                sigma=sigmas(i);
                C=costs(j);
                fprintf('======================\n');
                fprintf('sigma=%f\n',sigma);
                fprintf('C=%f\n',C);
                gamma=1/(2*sigma^2);
                str=sprintf('-c %f -g %f',C,gamma);
                for k=1:5
                    if(k==1)
                        Xtest=X(1:chunk,:);
                        ytest=y(1:chunk);
                        Xtrain=X(((chunk+1):size(X,1)),:);
                        ytrain=y(((chunk+1):size(X,1)));
                    elseif(k==5)
                        Xtest=X(((4*chunk+1):size(X,1)),:);
                        ytest=y((4*chunk+1):size(X,1));
                        Xtrain=X((1:(4*chunk)),:);
                        ytrain=y(1:(4*chunk));
                    else
                        Xtest=X( ((k-1)*chunk+1) : k*chunk , : );
                        ytest=y( ( (k-1)*chunk+1) : k*chunk );
                        Xtrain = [ X((1:(k-1)*chunk) ,:) ;
                                   X((k*chunk+1):size(X,1),:)
                                ];
                        ytrain=[ y((1:(k-1)*chunk));
                                 y((k*chunk+1):size(X,1))];
                    end
                    model = svmtrain(ytrain, Xtrain, str);
                    [predict_label, accuracy, dec_values] = svmpredict(ytest, Xtest, model);
                    Ecv(i,j) = Ecv(i,j)+100-accuracy(1);
                    fprintf('======================\n');
                end
            end
        end
        
        fprintf('========================================================================\n');
        fprintf('result\n');
        for i=1:3
            for j=1:3
                Ecv(i,j)=Ecv(i,j)/500;
                fprintf('sigma is : %f \n',sigmas(i));
                fprintf('cost is : %f \n',costs(j));
                fprintf('Ecv is : %f \n',Ecv(i,j));
                fprintf('=========================================================\n')
            end
        end
        dlmwrite('Ecv_fourteen.txt',Ecv);
end