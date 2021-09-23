clc;clear all
ts=0:0.1:15; 
x0=[25,2] ;
[t,x]=ode45('shayu',ts,x0) ;
figure(1)
%plot(t,x(:,1),'*');
plot(t,x(:,1),t,x(:,2),'*');
xlabel('时间');
ylabel('数量');
hold on
grid on
figure(2);
plot(x(:,1),x(:,2),'r-');
xlabel ('食物数量');
ylabel ('捕食者数量' ) ;
grid on
