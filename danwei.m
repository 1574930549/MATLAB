num1=[1];
den1=[36 12 1];
G1=tf(num1,den1);
figure(1);
step(G1);
xlabel('ʱ��(sec)');
ylabel('�����Ӧ');
title('����ϵͳ��λ��Ծ��Ӧ');
step(G1,100);
