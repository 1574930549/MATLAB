function maxvalfind
f=zeros(size (2:2:100));
j=0;
for i=2:2:100
    j=1;
    f(j)=myfun();
end
x=22:100;
f=3600.*f,
plot(x,f,'x.')
hold on
xlswrite('G:\´úÂë\MATLAB\2019C308\·Ö·¢_2016.08.08_510100_.csv');
end
function f=myfun(x)
k=2;
for m=1:1500
for i=1:x
mu=(30+x*2.5);
ar(i)=expmd(mu);
end
r=max(ar);
t(m)=+2.*(x .*5/(10/3.6)./k+1.*(x-1));
end
f=1500*x/sum(t);
end