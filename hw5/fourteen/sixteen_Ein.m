function [kernel_count,Ein]=sixteen_Ein()
    train=load('hw5_14_train.dat');
    X= train(:,1:10);
    X = [ones(size(X,1),1) X];
    y= train(:,11);
    m=size(X,1);
    lambdas=[0.001 1 1000];
    sigmas=[0.125 0.5 2];
    kernel_count=zeros(3,3);
    Ein= zeros(3,3);
        
    for i=1:3
        sigma=sigmas(i);
         K=kernel(X,sigma);
        for j=1:3
            lambda=lambdas(j);
            B=pinv(lambda*eye(m)+K)*y;
            kernel_count(i,j)=size(find(abs(B)>(10^(-10))),1)/m; % calculate number of support vectors
            Ein(i,j)=LSSVRtesting(B,X,X,sigma,y);
        end
    end
    dlmwrite('Ein_sixteen.txt',Ein);
    dlmwrite('Ein_kernels.txt',kernel_count);
end
