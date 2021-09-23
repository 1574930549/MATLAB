function dx=shayu(t,x)
a=1;b=0.1;
c=0.5;d=0.02;
dx=zeros(2,1) ;
dx(1)=x(1)*(a-b*x(2));
dx(2)=x(2)*(-c+d*x(1));
end
