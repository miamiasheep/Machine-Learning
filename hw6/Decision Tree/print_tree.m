function print_tree(tree)
    for i=1:23
        fprintf('%d-tree   dim: %f  theta:   %f\n',i,tree(i).dim,tree(i).theta);
    end
end