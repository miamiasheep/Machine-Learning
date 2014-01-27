function decision = voting(dim,s,theta,alpha,x)
    %voting for one instance x
    m = size(dim,1);
    %all models voting
    positive_vote = 0;
    negative_vote = 0;

    for i=1:m
        if((s(i)*sign(x(dim(i))-theta(i))) == 1)      % vote yes
            positive_vote = positive_vote + alpha(i);
        else
            negative_vote = negative_vote + alpha(i);  %vote no
        end
    end
    
    if(positive_vote>=negative_vote)       % 比較得票數
        decision =  1;
    else
        decision = -1;
    end
end