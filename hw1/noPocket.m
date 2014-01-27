%implement randPLA(perceptron Learning Algorithm)
data=load('hw1_18_train.dat');
X=data(:,1:4);
y=data(:,5);
%fprintf('loading the data...\n');
m=size(X,2);
total=0;
num_of_iterations=2000;
for iter=1:num_of_iterations
line=zeros(m+1,1);
count_out=0;
temp_perm=randperm(size(X,1));
    while(1==1)
        count=0;
        for i=1:size(X,1)
            X_temp=[ones(size(X,1),1) X];
            temp=X_temp(temp_perm(i),:)*line;
            if(y(temp_perm(i))==1 && temp<=0)
                line=line+X_temp(temp_perm(i),:)';
                count=count+1;
                count_out=count_out+1;
            elseif(y(temp_perm(i))==-1 && temp>=0)
                line=line-X_temp(temp_perm(i),:)';
                count=count+1;
                count_out=count_out+1;
            end
            if(count_out==50) 
                break;
            end
        end% for
        if((count==0)||(count_out==50))
            %outputline(line,m);
            %fprintf('The number of updating is %d\n',count_out);
            cc=faults(line);
            total=total+cc;
            %pause;
            break;
        end
    
    end     %while
end% for 2000 times
fprintf('the average faults:%f\n',total/num_of_iterations);