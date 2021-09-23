clc
clear
R=6371.393;
z=(30*180)/(pi*R);
E=48.980994;
N=-122.688503;

syms x y;

%b=sqrt(30-(((a-N)*pi*R/180)*((a-N)*pi*R/180))*180/(pi*R))+E;
%b1=solve(b,a);
%((a-N)*pi*R/180)^2+(((b-E)*pi*R/180)^2=30;
%c=solve(test,N);
%[x,y]=solve('9*x+8*y=10','13*x+14*y=12','x','y')
%[x,y]=solve('sqrt(30-(((b-E)*pi*R/180)*((b-E)*pi*R/180))*180/(pi*R))+N','sqrt(30-(((a-N)*pi*R/180)*((a-N)*pi*R/180))*180/(pi*R))+E','a','b')
f = @(x,y) (((x-N)*pi*R/180).^2) + ((y-E)*pi*R/180).^2-30;
%fimplicit(f,[-180,180,-90,90],'r')
%fimplicit(@(x,y) y.*sin(x) + x.*cos(y) - 1)
fimplicit(@(x,y) 30-R*arccos(sin(N)*sin(y)+cos(N)*cos(y)*cos(E-x)) )


