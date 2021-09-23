function rhotaxint
data=xlsread('G:\代码\MATLAB\2019C308\飞机密度0.1插值中.xlsx');
rhoplane=data(:,2);
time=data (:,1);
totaltraveller =7405.42*10*4;
totalplane =504972;
planeratio= totaltraveller / totalplane ;
taxiratio=103406/57238;
n=length(rhoplane(:,1));
rhotaxi=zeros( size (rhoplane));
people=zeros( size (rhoplane));
for i=1:n
    timei=time(i);
    if(timei>=0)&&(timei<= 5)
        k=0.45;
    elseif (timei>=23)
        k=0.45;
    else
        k=0.15;
    end
    rhotaxi(i)=rhoplane(i)* planeratio *k/ taxiratio ;
end
j=0;
Time=(0:0.1:26) ;
for i=1:231
j=j+1;
idxs=(i:i+16)';
time1=Time(idxs);
rhotaxi1=rhotaxi(idxs);
intrho(j)= trapz(time1,rhotaxi1);
end
time2 =0:0.1:23;
plot(time2, intrho,'g-')
hold on

