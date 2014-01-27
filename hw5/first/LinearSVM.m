function LinearSVM(train,test,C)
    %Xtrain
    n=size(train,2);
	Xtrain=train(:,1:(n-1));
    ytrain=train(:,n);
	model = svmTrain(Xtrain, ytrain, C, @linearKernel);
	fid = fopen('result.txt', 'w');
	length(model.w);
	for i=1:length(model.w)
		fprintf(fid,'%.20f ',model.w(i)); % The weight of the model
	end
	fprintf(fid,'%f',model.b);   % The bias of the model
	fclose(fid);
    
    
    fid=fopen('train_error_index.txt','w');
    p = svmPredict(model, Xtrain);
    fprintf(fid,'wrong point in the train....\n');
    for i=1:size(train,1)
        if(p(i)~=ytrain(i))
            fprintf(fid,'%d\n',i);
        end
    end
    fprintf(fid,'Traing Accuracy: %f\n', mean(double(p == ytrain)) * 100);
    fclose(fid);
    
    
    fid=fopen('test_error_index.txt','w');
    Xtest=test(:,1:(n-1));
    ytest=test(:,n);
    p = svmPredict(model, Xtest);
    fprintf(fid,'wrong point in the test....\n');
    for i=1:size(test,1)
        if(p(i)~=ytest(i))
            fprintf(fid,'%d\n',i);
        end
    end
    fprintf(fid,'Testing Accuracy: %f\n', mean(double(p == ytest)) * 100);
	fclose(fid);
end