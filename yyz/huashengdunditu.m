%ax=worldmap('World') ;
%ax=worldmap('United States of America');
num = xlsread('G:\����\Python\�����\����\2007.xlsx');
x=num(:,1);
y=num(:,2);
figure(1)
ax=worldmap([45 50],[-125 -116]);
%setm(ax, 'Origin', [49 -122 0]);  %�������������ԣ�[0,0,0]��ʾ��ͼ���ĵľ�γ�ȸ߶�
land = shaperead('landareas', 'UseGeoCoords', true); %����½�ؿ��
geoshow(ax, land, 'FaceColor', [0.5 0.7 0.5]); %չʾ��ͼ
scatterm(x,y,50,'filled') 
num = xlsread('G:\����\Python\�����\����\2010.xlsx');
x=num(:,1);
y=num(:,2);
figure(2)
ax=worldmap([45 50],[-125 -116]);
%setm(ax, 'Origin', [49 -122 0]);  %�������������ԣ�[0,0,0]��ʾ��ͼ���ĵľ�γ�ȸ߶�
land = shaperead('landareas', 'UseGeoCoords', true); %����½�ؿ��
geoshow(ax, land, 'FaceColor', [0.5 0.7 0.5]); %չʾ��ͼ
scatterm(x,y,50,'filled') 