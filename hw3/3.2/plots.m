for j=1:3:30
figure;
tiledlayout(6,2,'TileSpacing','None','Padding','None');
for i = j:j+2
nexttile;
imshow(mat2gray(xTrain1(:,:,1,i)));
nexttile;
imshow(mat2gray(trainPred1_1(:,:,1,i)));
end
end

for j=1:3:60
figure;
tiledlayout(6,2,'TileSpacing','None','Padding','None');
for i = j:j+2
nexttile;
imshow(mat2gray(xTrain1(:,:,1,i)));
nexttile;
imshow(mat2gray(trainPred2_2(:,:,1,i)));
end
end

x0=[];
x1=[];
x2=[];
x3=[];
x4=[];
x5=[];
x6=[];
x7=[];
x8=[];
x9=[];
y0=[];
y1=[];
y2=[];
y3=[];
y4=[];
y5=[];
y6=[];
y7=[];
y8=[];
y9=[];
x0=[];
x1=[];
x9=[];
y0=[];
y1=[];
y9=[];
for i = 1:1000
if double(tTest(i))==1
x1=[x1 testEnc1(1,i)];
y1=[y1 testEnc1(2,i)];
elseif double(tTest(i))==2
x2=[x2 testEnc1(1,i)];
y2=[y2 testEnc1(2,i)];
elseif double(tTest(i))==3
x3=[x3 testEnc1(1,i)];
y3=[y3 testEnc1(2,i)];
elseif double(tTest(i))==4
x4=[x4 testEnc1(1,i)];
y4=[y4 testEnc1(2,i)];
elseif double(tTest(i))==5
x5=[x5 testEnc1(1,i)];
y5=[y5 testEnc1(2,i)];
elseif double(tTest(i))==6
x6=[x6 testEnc1(1,i)];
y6=[y6 testEnc1(2,i)];
elseif double(tTest(i))==7
x7=[x7 testEnc1(1,i)];
y7=[y7 testEnc1(2,i)];
elseif double(tTest(i))==8
x8=[x8 testEnc1(1,i)];
y8=[y8 testEnc1(2,i)];
elseif double(tTest(i))==9
x9=[x9 testEnc1(1,i)];
y9=[y9 testEnc1(2,i)];
else
x0=[x0 testEnc1(1,i)];
y0=[y0 testEnc1(2,i)];
end
end

x0=[];
x1=[];
x2=[];
x3=[];
x4=[];
x5=[];
x6=[];
x7=[];
x8=[];
x9=[];
y0=[];
y1=[];
y2=[];
y3=[];
y4=[];
y5=[];
y6=[];
y7=[];
y8=[];
y9=[];
x0=[];
x1=[];
x9=[];
y0=[];
y1=[];
y9=[];
for i = 1:1000
if double(tTest(i))==1
x1=[x1 testEnc2(1,i)];
y1=[y1 testEnc2(2,i)];
elseif double(tTest(i))==2
x2=[x2 testEnc2(1,i)];
y2=[y2 testEnc2(2,i)];
elseif double(tTest(i))==3
x3=[x3 testEnc2(1,i)];
y3=[y3 testEnc2(2,i)];
elseif double(tTest(i))==4
x4=[x4 testEnc2(1,i)];
y4=[y4 testEnc2(2,i)];
elseif double(tTest(i))==5
x5=[x5 testEnc2(1,i)];
y5=[y5 testEnc2(2,i)];
elseif double(tTest(i))==6
x6=[x6 testEnc2(1,i)];
y6=[y6 testEnc2(2,i)];
elseif double(tTest(i))==7
x7=[x7 testEnc2(1,i)];
y7=[y7 testEnc2(2,i)];
elseif double(tTest(i))==8
x8=[x8 testEnc2(1,i)];
y8=[y8 testEnc2(2,i)];
elseif double(tTest(i))==9
x9=[x9 testEnc2(1,i)];
y9=[y9 testEnc2(2,i)];
else
x0=[x0 testEnc2(1,i)];
y0=[y0 testEnc2(2,i)];
end
end

x0=[];
x1=[];
x9=[];
y0=[];
y1=[];
y9=[];
for i = 1:1000
if double(tTest(i))==1
x1=[x1 testEnc2(1,i)];
y1=[y1 testEnc2(2,i)];
elseif double(tTest(i))==9
x9=[x9 testEnc2(1,i)];
y9=[y9 testEnc2(2,i)];
else
x0=[x0 testEnc2(1,i)];
y0=[y0 testEnc2(2,i)];
end
end

figure;
tiledlayout(6,2,'TileSpacing','None');%,'Padding','None');
nexttile;
scatter(x0,y0,'filled');
nexttile;
scatter(x1,y1,'filled');
nexttile;
scatter(x2,y2,'filled');
nexttile;
scatter(x3,y3,'filled');
nexttile;
scatter(x4,y4,'filled');
nexttile;
scatter(x5,y5,'filled');
nexttile;
scatter(x6,y6,'filled');
nexttile;
scatter(x7,y7,'filled');
nexttile;
scatter(x8,y8,'filled');
nexttile;
scatter(x9,y9,'filled');

figure;
hold on;
scatter(x0,y0,'filled');
scatter(x1,y1,'filled');
scatter(x2,y2,'filled');
scatter(x3,y3,'filled');
scatter(x4,y4,'filled');
scatter(x5,y5,'filled');
scatter(x6,y6,'filled');
scatter(x7,y7,'filled');
scatter(x8,y8,'filled');
scatter(x9,y9,'filled');
legend('0','1','2','3','4','5','6','7','8','9');
hold off;
