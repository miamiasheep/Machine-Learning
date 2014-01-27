function [a,b,ans]=NewtonDirection(u,v,iteration)
    for i=1:iteration
        [deltaU,deltaV]=NewtonUpdate(u,v);
        u=u-deltaU;
        v=v-deltaV;
    end
    a=u;b=v; 
    ans=E(a,b);
end