clc;clear all
ts=0: 15;
x0=[25 2] ;
[t,x]=ode45('shier1',ts,x0);
plot(t,x(:,2)./(x(:,1)+x(:,2)),'r-')
title('�˹���������������Ӱ��');
xlabel ('ʱ��(t)');ylabel("����ı���");
grid on
hold on .
[t, x]=ode45('shier2',ts,x0);
plot(t,x(:,2)./(x(:,1)+x(:,2)))
legend('prewar', 'combat');
