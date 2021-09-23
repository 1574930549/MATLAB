num1=[1];
den1=[36 12 1];
G1=tf(num1,den1);
figure(1);
step(G1);
xlabel('时间(sec)');
ylabel('输出响应');
title('二阶系统单位阶跃响应');
step(G1,100);
