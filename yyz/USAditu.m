figure;
num = xlsread('G:\����\Python\�����\2021MCMProblemC_DataSet(1).xlsx');
x=num(:,5);
y=num(:,6);
ax = worldmap('USA');
load coast
geoshow(ax, lat, long,'DisplayType', 'polygon', 'FaceColor', [.45 .60 .30])
states = shaperead('usastatelo', 'UseGeoCoords', true);
scatterm(x,y,10,'filled')
title('������ͼ','FontSize',14,'FontWeight','Bold');