function w=hardMarginSVM(Z,y)
   rowZero=zeros(size(Z,2),1);
   colZero=zeros(1,size(Z,2));
   H=[0         colZero;
      rowZero   eye(size(Z,2))];    %OK
  f=zeros(size(Z,2)+1,1);
  A=zeros(size(Z,1),size(Z,2)+1);
  for i = 1:size(Z,1)
      A(i,:)=(-1)*y(i).*[1 Z(i,:)];   
  end
  b=-1*ones(size(Z,1),1);
  %options=optimset('quadprog');
  %optimoptions('quadprog','Algorithm','active-set');
  w=quadprog(H,f,A,b);   %w(1)=b   w(2)=w1   w(3)=w2
  %still have some bugs to solve QAQ
end