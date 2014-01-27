function ans=myAns()
    x=[1 1 -1 -1 0 1];
    y=[1 -1 -1 1 0 0];
    X=zeros(6,6);
    for i=1:6
        X(i,:)=[ x(i)^2 x(i)*y(i) y(i)^2 x(i) y(i) 1];
    end
   %{
    X=[1    1   1   1   1   1;
       1    -1  1   1   -1  1;
       1    1   1   -1  -1  1;
       1    -1  1   -1  1   1;
       0    0   0   0   0   1;
       1    0   0   1   0   1;]
    %}
    ans=det(X);
end