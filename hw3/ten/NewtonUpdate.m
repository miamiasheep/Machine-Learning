function [a,b]=NewtonUpdate(u,v)
    [deltaU,deltaV]=deltaE(u,v);
    deltaE_Matrix=[deltaU;deltaV];
    H=[exp(u)+(v^2)*exp(u*v)+2,      v*u*exp(u*v)-2;
       v*u*exp(u*v)-2,            4*exp(2*v)+(u^2)*exp(u*v)+4 ];
   ans=pinv(H)*deltaE_Matrix;
   a=ans(1);
   b=ans(2);
end