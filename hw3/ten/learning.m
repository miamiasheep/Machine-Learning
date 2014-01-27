function [a,b,ans]=learning(u,v,iterations)
    for i=1:iterations
        [deltaU,deltaV]=deltaE(u,v);
        u=u-0.01*deltaU;
        v=v-0.01*deltaV;
    end
    a=u;b=v;
    ans=E(a,b);
 end