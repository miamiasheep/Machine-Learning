function equal=Bound2(N,d,delta,ep)
    equal=N-(8/(ep)^2)*log(4*((2*N)^d)/delta);
end