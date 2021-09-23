clear,clc
%%
[num1]=xlsread('D:\QQ\1574930549\FileRecv\第一次破解\A-2019中文\附件1-凸轮边缘曲线.xlsx');
x2=num1(:,[1]);
y2=num1(:,[2]);
figure(1)%打开图表
plot(x2,y2,'r');
title('凸轮边缘曲线')
xlabel('极角（rad）')
ylabel('极径（mm）')
hold on;
%%
[num2]=xlsread('D:\QQ\1574930549\FileRecv\第一次破解\A-2019中文\附件2-针阀运动曲线.xlsx');
x2=num2(:,[1]);
y2=num2(:,[2]);
x22=num2(:,[4]);
y22=num2(:,[5]);
figure(2)%打开图表
plot(x2,y2,'r');
hold on;
plot(x22,y22,'r');
title('针阀运动曲线')
xlabel('时间(ms)')
ylabel('距离(mm)')
hold on;
%%
[num3]=xlsread('D:\QQ\1574930549\FileRecv\第一次破解\A-2019中文\附件3-弹性模量与压力.xlsx');
x2=num3(:,[1]);
y2=num3(:,[2]);
figure(3)%打开图表
plot(x2,y2,'r');
title('弹性模量与压力')
xlabel('压力(MPa)')
ylabel('弹性模量(MPa)')
hold on;
