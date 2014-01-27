function [Eout,margin]=thirteen(iterations)
    train=load('hw5_13_train.dat');
    X=train(:,1:2);
    y=train(:,3);
    m=size(X,1);
    Eout=zeros(100,1);
    margin=zeros(100,1);
    for i=1:iterations
        tempSample=randsample(m,0.8*m);
        X_sample=X(tempSample,:);
        y_sample=y(tempSample);
        w=hardMarginSVM(X_sample,y_sample);
        myPlot(X,y,0,1); 
        x_plot=linspace(0,1);
        y_plot=(-w(2)*x_plot-w(1))/w(3);
        plot(x_plot,y_plot);
        hold off;
        Eout(i)=testSetError(w);
        margin(i)=1/sqrt(w(2)^2+w(3)^2);
    end
    scatter(margin,Eout,'b');
end