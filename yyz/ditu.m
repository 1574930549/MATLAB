
num = xlsread('G:\代码\Python\杨宇铮\2021MCMProblemC_DataSet(1).xlsx');
x=num(:,5);
y=num(:,6);
geoshow(x,y)
ax = worldmap('World');   
setm(ax, 'Origin', [0 0]);
land = shaperead('landareas', 'UseGeoCoords', true); 
geoshow(ax, land, 'FaceColor', [0.5 0.7 0.5]);
%按照经纬度绘制点位
scatterm(x,y,10,'filled')  %经纬度可以是单个点的，也可以是若干个点的
%plotm(lat,lon,'Marker','.')   %使用scatterm和plotm均可绘制点位