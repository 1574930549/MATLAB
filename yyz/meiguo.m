u0=0.423971351972483;
u1=0.543806706992129;
u2=0.56177984909689;
u3=0.40889945240719;
u4=0.456259087776505;
u5=0.410461938178949;
u6=0.51247003332693;
u7=0.464450700164067;
u8=0.509878826575138;
u9=0.58880674523372;
x=(u0+u1+u2+u3+u4+u5+u6+u7+u8+u9)/10;
S=sqrt((((u0-x)^2)+((u1-x)^2)+((u2-x)^2)+((u3-x)^2)+((u4-x)^2)+((u5-x)^2)+((u6-x)^2)+((u7-x)^2)+((u8-x)^2)+((u9-x)^2))/9);
p=[0:0.01:1];
y=normpdf(p,x,S);%��̬�ֲ�������
figure;
plot(p,y);
