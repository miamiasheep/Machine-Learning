function a=RPB(N,d,delta)
    a=sqrt((2*log(2*N*Mh(N,d)))/N)+sqrt((2/N)*log(1/delta))+1/N;
end