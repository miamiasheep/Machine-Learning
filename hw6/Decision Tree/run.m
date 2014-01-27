function complete_tree = run()
    data = load('hw6_train.dat');
    tree(1).theta = 0;
    tree(1).dim = 1;
    tree(1).exist = 0;
    complete_tree = DecisionTree(data,1,tree);
    
end