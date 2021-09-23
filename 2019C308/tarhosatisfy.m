
function tarhosatisfy
syms delTa bn
fai =-6.8*7.4/100;
tadr=50/60;
tAtotal =delTa+tadr;
Pa=155;
Xa=45.8;
Ca=Xa*fai;
Ea=Pa;
deltaEa=Ea-Ca;

delTb=30/60;
otherTb=20/60;
tBtotal =delTb+bn*otherTb;
Pb=0.9*bn*29.3;
Xb=26+bn*9.12;
Cb=Xb*fai;
Eb=Pb;
deltaEb=Eb- Cb;
[a,b]=vpasolve([tAtotal-tBtotal,deltaEa-deltaEb],[delTa,bn]);
a
b
