function eleven()
    X=[1 1; -1 -1];
    K=kernel_matrix(X);
    s=[1 1];
    ans = s*K*s';
    ans
end