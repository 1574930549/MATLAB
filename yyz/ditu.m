
num = xlsread('G:\����\Python\�����\2021MCMProblemC_DataSet(1).xlsx');
x=num(:,5);
y=num(:,6);
geoshow(x,y)
ax = worldmap('World');   
setm(ax, 'Origin', [0 0]);
land = shaperead('landareas', 'UseGeoCoords', true); 
geoshow(ax, land, 'FaceColor', [0.5 0.7 0.5]);
%���վ�γ�Ȼ��Ƶ�λ
scatterm(x,y,10,'filled')  %��γ�ȿ����ǵ�����ģ�Ҳ���������ɸ����
%plotm(lat,lon,'Marker','.')   %ʹ��scatterm��plotm���ɻ��Ƶ�λ