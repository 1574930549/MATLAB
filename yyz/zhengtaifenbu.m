x=[-100:0.01:100];
y=normpdf(x,0,1);%正态分布函数。
figure;
axes1=axes('Pos',[0.1 0.1 0.85 0.85]);
plot(x,y);
set(axes1,'YLim',[-0.01 0.43],'XLim',[-30 30]);