function Num=check(N1,N2,d,delta,ep)
    for i=N1:N2
        if(Bound2(i,d,delta,ep)>0)
            Num=i;
            break;
        end
    end
end