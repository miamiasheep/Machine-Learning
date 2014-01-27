function error=Ein(Wlin,x1,x2,y)
    m=size(y,1);
    error=0;
    for i=1:m
        guess=Wlin(1)+Wlin(2)*x1(i)+Wlin(3)*x2(i);
        guess=sign(guess);
        if(guess~=y(i))
            error=error+1;
        end
    end
    error=error/m;
end