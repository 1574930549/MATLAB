%ax=worldmap('World') ;
%ax=worldmap('United States of America');
num = xlsread('G:\代码\Python\杨宇铮\坐标\2007.xlsx');
x=num(:,1);
y=num(:,2);
figure(1)
ax=worldmap([45 50],[-125 -116]);
%setm(ax, 'Origin', [49 -122 0]);  %设置坐标轴属性，[0,0,0]表示地图中心的经纬度高度
land = shaperead('landareas', 'UseGeoCoords', true); %导入陆地框架
geoshow(ax, land, 'FaceColor', [0.5 0.7 0.5]); %展示地图
scatterm(x,y,50,'filled') 
num = xlsread('G:\代码\Python\杨宇铮\坐标\2010.xlsx');
x=num(:,1);
y=num(:,2);
figure(2)
ax=worldmap([45 50],[-125 -116]);
%setm(ax, 'Origin', [49 -122 0]);  %设置坐标轴属性，[0,0,0]表示地图中心的经纬度高度
land = shaperead('landareas', 'UseGeoCoords', true); %导入陆地框架
geoshow(ax, land, 'FaceColor', [0.5 0.7 0.5]); %展示地图
scatterm(x,y,50,'filled') 