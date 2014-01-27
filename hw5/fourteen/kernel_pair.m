function a=kernel_pair(x1,x2,sigma)
    a=exp(-((x1-x2)*(x1-x2)')/(2*sigma^2));
end