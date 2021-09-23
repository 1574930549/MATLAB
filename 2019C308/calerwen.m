function calerwen
x1=6*10^- 3;
x2= -20*10*- 3;
p=(x2-x1);
while (p* 10*3>0.001)
x=x1+0.5*p;
%a=skinTerwen(x);
a=x;
a=a(1);
if a>44
xl=x;
elseif a<44
x2=x;
else
break
end
p=x2-xl;
end
x3=x1+0.002
x4= x2+0.002
