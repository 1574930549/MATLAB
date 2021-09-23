X=0+10*rand(500,2);
A=X;
numData=size(A,1);
Kdist=zeros(numData,1);
[IDX,Dist]=knnsearch(A(2:numData,:),A(1,:));
Kdist(1)=Dist;
for i=2:size(A,1)
    [IDX,Dist] = knnsearch(A([1:i-1,i+1:numData],:),A(i,:));
    Kdist(i)=Dist;
end
[sortKdist,sortKdistIdx]=sort(Kdist,'descend');
distX=[1:numData]';
plot(distX,sortKdist,'r+-','LineWidth',2);
set(gcf,'position',[1000 340 350 350]);
grid on;
 
%% Run DBSCAN Clustering Algorithm
epsilon= 0.15 ;
MinPts=  3   ;
IDX1=DBSCAN(X,epsilon,MinPts);
%% Plot Results
figure;
PlotClusterinResult(X, IDX1);
title(['DBSCAN Clustering (\epsilon = ' num2str(epsilon) ', MinPts = ' num2str(MinPts) ')']);
set(gcf,'position',[30 -10 500 500]); 
 
 
epsilon= 0.25 ;
MinPts=  3   ;
IDX2=DBSCAN(X,epsilon,MinPts);
%% Plot Results
figure;
PlotClusterinResult(X, IDX2);
title(['DBSCAN Clustering (\epsilon = ' num2str(epsilon) ', MinPts = ' num2str(MinPts) ')']);
set(gcf,'position',[530 -10 500 500]);
 
epsilon= 0.5 ;
MinPts=  3   ;
IDX3=DBSCAN(X,epsilon,MinPts);
%% Plot Results
figure;
PlotClusterinResult(X, IDX3);
title(['DBSCAN Clustering (\epsilon = ' num2str(epsilon) ', MinPts = ' num2str(MinPts) ')']);
set(gcf,'position',[30 380 500 500]);
