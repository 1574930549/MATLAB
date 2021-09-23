function [Zp,Y1p,Y2p,Y3p,Xp,LC1,LC2]=JSPGA(M,N,Pm,T,P)
%--------------------------------------------------------------------------
% JSPGA.m
% ������ҵ���������Ŵ��㷨
%--------------------------------------------------------------------------
% ��������б�
% M       �Ŵ�������������
% N       ��Ⱥ��ģ(ȡż��)
% Pm      �������
% T       m��n�ľ��󣬴洢m������n������ļӹ�ʱ��
% P       1��n��������n�������У�ÿһ�����������еĻ�����Ŀ
% ��������б�
% Zp      ���ŵ�Makespanֵ
% Y1p     ���ŷ����У�������������Ŀ�ʼʱ�̣��ɸ������������ͼ
% Y2p     ���ŷ����У�������������Ľ���ʱ�̣��ɸ������������ͼ
% Y3p     ���ŷ����У�������������ʹ�õĻ������
% Xp      ���ž��߱�����ֵ�����߱�����һ��ʵ�������m��n����
% LC1     ��������1���������Ÿ�����Ӧֵ�ļ�¼
% LC2     ��������2������Ⱥ��ƽ����Ӧֵ�ļ�¼
% ��󣬳��򻹽��������ͼƬ��������������ͼ�͸���ͼ���������ĵ���ʱ��ͼ��

%��һ����������ʼ��
[m,n]=size(T);%m���ܹ�������n���ܹ�����
Xp=zeros(m,n);%���ž��߱���
LC1=zeros(1,M);%��������1
LC2=zeros(1,N);%��������2

%�ڶ��������������ʼ��Ⱥ
farm=cell(1,N);%����ϸ���ṹ�洢��Ⱥ
for k=1:N
    X=zeros(m,n);
    for j=1:n
        for i=1:m
            X(i,j)=1+(P(j)-eps)*rand;
        end
    end
    farm{k}=X;
end

counter=0;%���õ���������
while counter
   
    %������������
    newfarm=cell(1,N);%�������������Ⱥ��������
    Ser=randperm(N);
    for i=1:2:(N-1)
        A=farm{Ser(i)};%��������
        B=farm{Ser(i+1)};
        Manner=unidrnd(2);%���ѡ�񽻲淽ʽ
        if Manner==1
            cp=unidrnd(m-1);%���ѡ�񽻲��
            %˫��˫�ӵ��㽻��
            a=[A(1:cp,:);B((cp+1):m,:)];%�Ӵ�����
            b=[B(1:cp,:);A((cp+1):m,:)];
        else
            cp=unidrnd(n-1);%���ѡ�񽻲��
            a=[A(:,1:cp),B(:,(cp+1):n)];%˫��˫�ӵ��㽻��
            b=[B(:,1:cp),A(:,(cp+1):n)];
        end
        newfarm{i}=a;%�������Ӵ�����newfarm
        newfarm{i+1}=b;
    end
    %�¾���Ⱥ�ϲ�
    FARM=[farm,newfarm];
   
    %���Ĳ���ѡ����
    FITNESS=zeros(1,2*N);
    fitness=zeros(1,N);
    plotif=0;
    for i=1:(2*N)
        X=FARM{i};
        Z=COST(X,T,P,plotif);%���ü�����õ��Ӻ���
        FITNESS(i)=Z;
    end
    %ѡ���Ʋ�ȡ���������Ծ����ķ�ʽ�����б������Ÿ��������
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
    %��¼��Ѹ������������
    minfitness=min(fitness)
    meanfitness=mean(fitness)
    LC1(counter+1)=minfitness;%��������1���������Ÿ�����Ӧֵ�ļ�¼
    LC2(counter+1)=meanfitness;%��������2������Ⱥ��ƽ����Ӧֵ�ļ�¼
    pos=find(fitness==minfitness);
    Xp=farm{pos(1)};
   
    %���岽������
    for i=1:N
        if Pm>rand;%�������ΪPm
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

%����������ͼ
figure(1);
plotif=1;
X=Xp;
[Zp,Y1p,Y2p,Y3p]=COST(X,T,P,plotif);
figure(2);
plot(LC1);
figure(3);
plot(LC2);