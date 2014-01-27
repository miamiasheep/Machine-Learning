function [deltaU,deltaV]=deltaE(u,v)
    deltaU=exp(u)+v*exp(u*v)+2*u-2*v-3;
    deltaV=2*exp(2*v)+u*exp(u*v)-2*u+4*v-2;
end