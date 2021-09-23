function rhotaxint4

data2=xlsread('G:\代码\MATLAB\2019C308\分发_2016.08.08_510100_.csv');
%data2=xlsread('G:\代码\MATLAB\2019C308\浦东到达0.1密度插值2.xlsx');
rhoplane2=data2(:,2);
time2= data2 (:,1);
totaltraveller2=7405.42* 10^4;
totalplane2 = -504972;
planeratio2 = totaltraveller2 / totalplane2 ;
taxiratio2 =103406/57238;
n2=length(rhoplane2(:,1));
rhotaxi2 =zeros( size (rhoplane2));
for i2=1:n2
    timei2=time2(i2 );
    if (timei2>=0)&&(timei2<=5)
        k2=0.45;
    elseif (timei2>= 23)
        k2= 0.45;
    else
    k2=0.2;
    end
rhotaxi2 (i2)=rhoplane2(i2)* planeratio2 *k2/ taxiratio2 ;
end
data=xlsread('G:\代码\MATLAB\2019C308\分发_2016.08.08_510100_.csv');
rhoplane=data (:,2) ;
time=data(:,1) ;
totaltraveller =7405.42* 10^4;
totalplane =504972;
planeratio= totaltraveller / totalplane ;
taxiratio =103406/57238;
n=length( rhoplane (6,1) );
rhotaxi =zeros( size (rhoplane));
pcople=zeros( size (rhoplane));
for i=1:n
    timei=time(i);
    if (timei>=0)&&(timei<=5)
    k=0.45;
    elseif (timei>= 23)
    k=0.45;
    else
    k=0.2;
    end
    rhotaxi (i )=rhoplane(i)* planeratio *k/ taxiratio ;
    end
deltataxi=rhotaxi2-rhotaxi(1:12000);
j=0;
timez=0:0.1:23;
for i=1:231
    if i==1
    intnew(i)=600;
    continue
    end
    timcint=timez(1:i);
    deltaxint = deltataxi (1:i);
    intnew(i)=trapz( timcint , deltaxint )+600;
end
for k=1:length(intnew)
    if intnew(k)<0
    intnew(k)=0;
    end
end
