figure;
num = xlsread('G:\代码\Python\杨宇铮\2021MCMProblemC_DataSet(1).xlsx');
x=num(:,5);
y=num(:,6);
ax = worldmap('USA');
load coast
geoshow(ax, lat, long,'DisplayType', 'polygon', 'FaceColor', [.45 .60 .30])
states = shaperead('usastatelo', 'UseGeoCoords', true);
scatterm(x,y,10,'filled')
title('美国地图','FontSize',14,'FontWeight','Bold');