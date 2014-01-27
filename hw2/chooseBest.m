function chooseBest()
best=1;
    for i=1:9
        [Ein,bestPos,bestS]=multiDS(i);
        if(Ein<best)
            best=Ein;
            bestLine=bestPos;
            bestSign=bestS;
            bestDim=i;
        end
    end
    fprintf('%f\n %f\n %f\n %f\n',best,bestLine,bestSign,bestDim);
end