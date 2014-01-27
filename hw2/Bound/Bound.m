function equal=Bound(N,d,TolerateErr,ep)
    equal=4*((2*N)^d)*exp((-1/8)*(ep^2)*N)-TolerateErr
end