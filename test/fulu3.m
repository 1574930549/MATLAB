clear,clc
%%
[num1]=xlsread('D:\QQ\1574930549\FileRecv\��һ���ƽ�\A-2019����\����1-͹�ֱ�Ե����.xlsx');
x2=num1(:,[1]);
y2=num1(:,[2]);
figure(1)%��ͼ��
plot(x2,y2,'r');
title('͹�ֱ�Ե����')
xlabel('���ǣ�rad��')
ylabel('������mm��')
hold on;
%%
[num2]=xlsread('D:\QQ\1574930549\FileRecv\��һ���ƽ�\A-2019����\����2-�뷧�˶�����.xlsx');
x2=num2(:,[1]);
y2=num2(:,[2]);
x22=num2(:,[4]);
y22=num2(:,[5]);
figure(2)%��ͼ��
plot(x2,y2,'r');
hold on;
plot(x22,y22,'r');
title('�뷧�˶�����')
xlabel('ʱ��(ms)')
ylabel('����(mm)')
hold on;
%%
[num3]=xlsread('D:\QQ\1574930549\FileRecv\��һ���ƽ�\A-2019����\����3-����ģ����ѹ��.xlsx');
x2=num3(:,[1]);
y2=num3(:,[2]);
figure(3)%��ͼ��
plot(x2,y2,'r');
title('����ģ����ѹ��')
xlabel('ѹ��(MPa)')
ylabel('����ģ��(MPa)')
hold on;
