function a=Der(N,d,delta,add)
    ep=add;
    a=1;
    temp=10;
    iter=(1/add)*10;
    for i=1:iter
        temp=sqrt((1/(2*N))*(4*ep*(1+ep)+log(4/delta)+2*d*log(N)));
        if(ep>temp)
            a=ep;
            break;
        end
        ep=ep+add;
    end
end