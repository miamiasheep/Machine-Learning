function [w,b]=three()
    X=[1    0 ;    %x1
       0    1 ;    %x2
       0    -1;    %x3
      -1    0 ;    %x4
       0    2 ;    %x5
       0    -2 ;   %x6
       -2   0     %x7
       ];

   y=[-1;     %x1
       -1;    %x2
       -1;    %x3
       1;     %x4
       1;     %x5
       1;     %x6
       1     %x7 
      ];
   
  
   %Z = [2 2x1 2x2 x1x2 x1^2 x2^2]
   N=6;
   alpha=DualSVM(X,y);
   alpha
   Z=zeros(size(X,1),N);
   for i=1:size(Z,1)
      Z(i,:) = [2 2*X(i,1) 2*X(i,2) sqrt(2)*X(i,1)*X(i,2) X(i,1)^2 X(i,2)^2 ];
   end
    Z 
    pause;
   w=zeros(N,1);
   for i=1:size(X,1)
       w=w+alpha(i)*y(i)*Z(i,:)';    % Z space!!!
   end

   for i=1:size(Z,1)
       if(alpha(i)>0)
           b=y(i)-w'*Z(i,:)';
           break;
       end
   end
   myPlot(X,y,0,1);  % 1 is for holding
   str = sprintf('(%f)+(%f*x)+(%f*y)+((%f)*x*y)+(%f*x^2)+(%f*y^2)=0',2*w(1)+b,2*w(2),2*w(3),sqrt(2)*w(4),w(5),w(6));
   str
   ezplot(str,[-10,10,-10,10]);
   hold on;
   str = sprintf('(%f)+(%f*x)+(%f*y)+((%f)*x*y)+(%f*x^2)+(%f*y^2)=1',2*w(1)+b,2*w(2),2*w(3),sqrt(2)*w(4),w(5),w(6));
   ezplot(str,[-10,10,-10,10]);
   hold on;
   str = sprintf('(%f)+(%f*x)+(%f*y)+((%f)*x*y)+(%f*x^2)+(%f*y^2)=-1',2*w(1)+b,2*w(2),2*w(3),sqrt(2)*w(4),w(5),w(6));
   ezplot(str,[-10,10,-10,10]);
   hold off;
end