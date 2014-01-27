function outputline(line,m)
    fprintf('line...\n');
    for i=1:m+1
        fprintf('%f\n',line(i,1));
    end
end