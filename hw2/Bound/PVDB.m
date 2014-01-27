function a=PVDB(N,d,delta,add)
    ep=add;
    temp=10;
    iter=(1/add)*100;
    for i=1:iter
        temp=sqrt((1/N)*(2*ep+log((6*Mh(2*N,d))/delta)));
        if(ep>temp)
            a=ep;
            break;
        end
        ep=ep+add;
    end
end