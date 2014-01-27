function choose()
    %candidate=-10:2;
    count=1;
    for i=-10:2
        [Ein,Eout]=RLR(10^i);
        record_Ein(count)=Ein;
        record_Eout(count)=Eout;
        count=count+1;
    end
    [m,index]=min(record_Ein);
    fprintf('The minimum Ein is %f\n',m);
    fprintf('The correspoding Eout is %f\n',record_Eout(index));
    fprintf('index is %d\n',index);
    [m,index]=min(record_Eout);
    fprintf('The minimum Eout is %f\n',m);
    fprintf('The correspoding Ein is %f\n',record_Ein(index));
    fprintf('index is %d\n',index);
    plot(-10:2,record_Ein);
   % title('Ein');
    hold on;
    plot(-10:2,record_Eout,'r');
    %title('Eout');
    hold off;
end