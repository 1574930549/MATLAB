clc;clear all
ts=0: 15;
x0=[25 2] ;
[t,x]=ode45('shier1',ts,x0);
plot(t,x(:,2)./(x(:,1)+x(:,2)),'r-')
title('人工捕获对鲨鱼比例的影响');
xlabel ('时间(t)');ylabel("鲨鱼的比例");
grid on
hold on .
[t, x]=ode45('shier2',ts,x0);
plot(t,x(:,2)./(x(:,1)+x(:,2)))
legend('prewar', 'combat');
