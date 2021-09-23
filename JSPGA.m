function [Zp,Y1p,Y2p,Y3p,Xp,LC1,LC2]=JSPGA(M,N,Pm,T,P)
%--------------------------------------------------------------------------
% JSPGA.m
% 车间作业调度问题遗传算法
%--------------------------------------------------------------------------
% 输入参数列表
% M       遗传进化迭代次数
% N       种群规模(取偶数)
% Pm      变异概率
% T       m×n的矩阵，存储m个工件n个工序的加工时间
% P       1×n的向量，n个工序中，每一个工序所具有的机床数目
% 输出参数列表
% Zp      最优的Makespan值
% Y1p     最优方案中，各工件各工序的开始时刻，可根据它绘出甘特图
% Y2p     最优方案中，各工件各工序的结束时刻，可根据它绘出甘特图
% Y3p     最优方案中，各工件各工序使用的机器编号
% Xp      最优决策变量的值，决策变量是一个实数编码的m×n矩阵
% LC1     收敛曲线1，各代最优个体适应值的记录
% LC2     收敛曲线2，各代群体平均适应值的记录
% 最后，程序还将绘出三副图片：两条收敛曲线图和甘特图（各工件的调度时序图）

%第一步：变量初始化
[m,n]=size(T);%m是总工件数，n是总工序数
Xp=zeros(m,n);%最优决策变量
LC1=zeros(1,M);%收敛曲线1
LC2=zeros(1,N);%收敛曲线2

%第二步：随机产生初始种群
farm=cell(1,N);%采用细胞结构存储种群
for k=1:N
    X=zeros(m,n);
    for j=1:n
        for i=1:m
            X(i,j)=1+(P(j)-eps)*rand;
        end
    end
    farm{k}=X;
end

counter=0;%设置迭代计数器
while counter
   
    %第三步：交叉
    newfarm=cell(1,N);%交叉产生的新种群存在其中
    Ser=randperm(N);
    for i=1:2:(N-1)
        A=farm{Ser(i)};%父代个体
        B=farm{Ser(i+1)};
        Manner=unidrnd(2);%随机选择交叉方式
        if Manner==1
            cp=unidrnd(m-1);%随机选择交叉点
            %双亲双子单点交叉
            a=[A(1:cp,:);B((cp+1):m,:)];%子代个体
            b=[B(1:cp,:);A((cp+1):m,:)];
        else
            cp=unidrnd(n-1);%随机选择交叉点
            a=[A(:,1:cp),B(:,(cp+1):n)];%双亲双子单点交叉
            b=[B(:,1:cp),A(:,(cp+1):n)];
        end
        newfarm{i}=a;%交叉后的子代存入newfarm
        newfarm{i+1}=b;
    end
    %新旧种群合并
    FARM=[farm,newfarm];
   
    %第四步：选择复制
    FITNESS=zeros(1,2*N);
    fitness=zeros(1,N);
    plotif=0;
    for i=1:(2*N)
        X=FARM{i};
        Z=COST(X,T,P,plotif);%调用计算费用的子函数
        FITNESS(i)=Z;
    end
    %选择复制采取两两随机配对竞争的方式，具有保留最优个体的能力
    Ser=randperm(2*N);
    for i=1:N
        f1=FITNESS(Ser(2*i-1));
        f2=FITNESS(Ser(2*i));
        if f1<=f2
            farm{i}=FARM{Ser(2*i-1)};
            fitness(i)=FITNESS(Ser(2*i-1));
        else
            farm{i}=FARM{Ser(2*i)};
            fitness(i)=FITNESS(Ser(2*i));
        end
    end
    %记录最佳个体和收敛曲线
    minfitness=min(fitness)
    meanfitness=mean(fitness)
    LC1(counter+1)=minfitness;%收敛曲线1，各代最优个体适应值的记录
    LC2(counter+1)=meanfitness;%收敛曲线2，各代群体平均适应值的记录
    pos=find(fitness==minfitness);
    Xp=farm{pos(1)};
   
    %第五步：变异
    for i=1:N
        if Pm>rand;%变异概率为Pm
            X=farm{i};
            I=unidrnd(m);
            J=unidrnd(n);
            X(I,J)=1+(P(J)-eps)*rand;
            farm{i}=X;
        end
    end
    farm{pos(1)}=Xp;
   
    counter=counter+1
end

%输出结果并绘图
figure(1);
plotif=1;
X=Xp;
[Zp,Y1p,Y2p,Y3p]=COST(X,T,P,plotif);
figure(2);
plot(LC1);
figure(3);
plot(LC2);