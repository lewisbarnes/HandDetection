function processHand(RGBImage)
strel = [ 0 1 1 1 0; 1 1 1 1 1; 1 1 1 1 1; 1 1 1 1 1; 0 1 1 1 0];
[BW, MaskedRGBImage] = createMask(RGBImage);
[BWSkin, MaskedSkinImage] = isolateSkin(MaskedRGBImage);
HandGreyscale = rgb2gray(RGBImage);
R= RGBImage(:,:,1);
G= RGBImage(:,:,2);
B= RGBImage(:,:,3);

GreyThreshold = graythresh(RGBImage(:,:,1));

HistGrey = imhist(HandGreyscale) / numel(HandGreyscale);
[HistMRed,HistMGreen,HistMBlue] = getHistograms(MaskedRGBImage);
[HistRed,HistGreen,HistBlue] = getHistograms(RGBImage);

YlimMax = max([max(HistRed),max(HistGreen),max(HistBlue)]);

MeanGreyscale = mean2(HandGreyscale);
MeanRed = mean2(R);
MeanGreen = mean2(G);
MeanBlue = mean2(B);
figure;

imshow(RGBImage);
axis image;

figure;
colormap gray;
imshow(HandGreyscale);
axis image;
figure;
imshow(MaskedRGBImage);
axis image;

figure;
hold on;
y = [0 YlimMax];
plot(HistRed,'r','LineWidth',1);
plot([MeanRed MeanRed],y,'--r','LineWidth',1);
plot(HistGreen,'g','LineWidth',1);
plot([MeanGreen MeanGreen],y,'--g','LineWidth',1);
plot(HistBlue,'b','LineWidth',1);
plot([MeanBlue MeanBlue],y,'--b','LineWidth',1);
xlim([0 255]);
ylim([0 YlimMax]);
hold off;
xlabel('Intensity');
ylabel('Normalised Count');
title('Normalised Histogram of RGB image');

figure;
hold on;
plot(HistGrey);
x = [MeanGreyscale MeanGreyscale];
y = [0 max(HistGrey)];
plot(x,y,'--');
ylim([0 max(HistGrey)]);
hold off;
ylabel('Normalised Count');
xlabel('Luminance');
title('Normalised Histogram of Greyscale image');

figure;
hold on;
y = [0 YlimMax];
plot(HistMRed,'r','LineWidth',1);
plot(HistMGreen,'g','LineWidth',1);
plot(HistBlue,'b','LineWidth',1);
xlim([0 255]);
ylim([0 YlimMax]);
hold off;
xlabel('Intensity');
ylabel('Normalised Count');
title('Normalised Histogram of masked RGB image');

figure;
text(0,1,strcat('Mean R = ',string(floor(MeanRed))),'HorizontalAlignment','Center', 'VerticalAlignment','Middle');
text(0,0.9,strcat('Mean G = ',string(floor(MeanGreen))),'HorizontalAlignment','Center', 'VerticalAlignment','Middle');
text(0,0.8,strcat('Mean B = ',string(floor(MeanBlue))),'HorizontalAlignment','Center', 'VerticalAlignment','Middle');
disp(strcat('Mean R = ',string(floor(MeanRed))));
disp(strcat('Mean G = ',string(floor(MeanGreen))));
disp(strcat('Mean B = ',string(floor(MeanBlue))));
text(0.5,1,strcat('Min R = ',string(min(min(R)))),'HorizontalAlignment','Center', 'VerticalAlignment','Middle');
text(0.5,0.9,strcat('Min G = ',string(min(min(G)))),'HorizontalAlignment','Center', 'VerticalAlignment','Middle');
text(0.5,0.8,strcat('Min B = ',string(min(min(B)))),'HorizontalAlignment','Center', 'VerticalAlignment','Middle');
disp(strcat('Min R = ',string(min(min(R)))));
disp(strcat('Min G = ',string(min(min(G)))));
disp(strcat('Min B = ',string(min(min(B)))));
text(1,1,strcat('Max R= ',string(max(max(R)))),'HorizontalAlignment','Center', 'VerticalAlignment','Middle');
text(1,0.9,strcat('Max G= ',string(max(max(G)))),'HorizontalAlignment','Center', 'VerticalAlignment','Middle');
text(1,0.8,strcat('Max B= ',string(max(max(B)))),'HorizontalAlignment','Center', 'VerticalAlignment','Middle');
axis off;
figure;
text(0.5,1,strcat('Mean Luminance= ',string(floor(MeanGreyscale))),'HorizontalAlignment','Center', 'VerticalAlignment','Middle');
text(0.5,0.9,strcat('Max Luminance= ',string(max(max(HandGreyscale)))),'HorizontalAlignment','Center', 'VerticalAlignment','Middle');
text(0.5,0.8,strcat('Min Luminance= ',string(min(min(HandGreyscale)))),'HorizontalAlignment','Center', 'VerticalAlignment','Middle');
axis off;

LabHand = rgb2lab(MaskedRGBImage);
RLab = LabHand(:,:,1);
GLab = LabHand(:,:,2);
BLab = LabHand(:,:,3);

%%%%%%%%%%%%%%%%%
%%%   Thumb   %%%
%%%%%%%%%%%%%%%%%
Red = RLab >= 29.10 & RLab <= 65.256;
Green = GLab >= 11.774 & GLab <= 17.399;
Blue = BLab >= 13 & BLab <= 42.805;
Thumb = bwareaopen(Red & Green & Blue, 1300);
Thumb = Thumb - BWSkin
%%%%%%%%%%%%%%%%%
%%%   Index   %%%
%%%%%%%%%%%%%%%%%
Red = RLab >= 42.787 & RLab <= 63.153;
Green = GLab >= -18.454 & GLab <= 3.203;
Blue = BLab >= 28.407 & BLab <= 54.509;
Index = bwareaopen(Red & Green & Blue,20000);

%%%%%%%%%%%%%%%%%%
%%%   Middle   %%%
%%%%%%%%%%%%%%%%%%
Red = RLab >= 16 & RLab <= 61.6;
Green = GLab >= -4.692 & GLab <= 3.778;
Blue = BLab >= -41.64 & BLab <= -12.628;
Middle = bwareaopen(Red & Green & Blue,20000);

%%%%%%%%%%%%%%%%
%%%   Ring   %%%
%%%%%%%%%%%%%%%%
Red = RLab >= 32.458 & RLab <=54;
Green = GLab >= -26.488 & GLab <= -14.175;
Blue = BLab >= -10.028 & BLab <= 3.437;
Ring = bwareaopen(Red & Green & Blue,1000);

%%%%%%%%%%%%%%%%%%
%%%   Pinky    %%%
%%%%%%%%%%%%%%%%%%
Red = RLab >= 31.607 & RLab <= 51.503;
Green = GLab >= 23.197 & GLab <= 35.899;
Blue = BLab >= 3.608 & BLab <= 22;
Pinky = bwareaopen(Red & Green & Blue, 20000);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%   Find locations and centres of fingertips   %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
thumbLocation = regionprops(Thumb,'centroid');
indexLocation = regionprops(Index,'centroid');
middleLocation = regionprops(Middle,'centroid');
ringLocation = regionprops(Ring,'centroid');
pinkyLocation = regionprops(Pinky,'centroid');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%   Define Isolated Fingertips   %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
IsolatedPinky = uint8(cat(3,int8(R).*int8(Pinky),int8(G).*int8(Pinky),int8(B).*int8(Pinky)));
IsolatedIndex = uint8(cat(3,int8(R).*int8(Index),int8(G).*int8(Index),int8(B).*int8(Index)));
IsolatedMiddle = uint8(cat(3,int8(R).*int8(Middle),int8(G).*int8(Middle),int8(B).*int8(Middle)));
IsolatedRing = uint8(cat(3,int8(R).*int8(Ring),int8(G).*int8(Ring),int8(B).*int8(Ring)));
IsolatedThumb = uint8(cat(3,int8(R).*int8(Thumb),int8(G).*int8(Thumb),int8(B).*int8(Thumb)));

Fingertips = rgb2gray(IsolatedThumb + IsolatedIndex + IsolatedMiddle + IsolatedRing + IsolatedPinky);
figure;
imshow(Thumb);

figure;
imshow(IsolatedThumb);

figure;
imshow(Index);


figure;
imshow(IsolatedIndex);

figure;
imshow(Middle);


figure;
imshow(IsolatedMiddle);

figure;
imshow(Ring);


figure;
imshow(IsolatedRing);

figure;
imshow(Pinky);

figure;
imshow(IsolatedPinky);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%   Fingertips on Greyscale Image   %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure;
imshow(HandGreyscale);
hold on;
image(RGBImage,'AlphaData',Thumb);
image(RGBImage,'AlphaData',Index);
image(RGBImage,'AlphaData',Middle);
image(RGBImage,'AlphaData',Ring);
image(RGBImage,'AlphaData',Pinky);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%   Centroid Plotting   %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
plot(indexLocation.Centroid(1),indexLocation.Centroid(2),'ro','MarkerSize',10);
plot(thumbLocation.Centroid(1),thumbLocation.Centroid(2),'ro','MarkerSize',10);
plot(middleLocation.Centroid(1),middleLocation.Centroid(2),'ro','MarkerSize',10);
plot(ringLocation.Centroid(1),ringLocation.Centroid(2),'ro','MarkerSize',10);
plot(pinkyLocation.Centroid(1),pinkyLocation.Centroid(2),'ro','MarkerSize',10);
plot([pinkyLocation.Centroid(1),ringLocation.Centroid(1)],[pinkyLocation.Centroid(2),ringLocation.Centroid(2)],'g','LineWidth',1);
plot([ringLocation.Centroid(1),middleLocation.Centroid(1)],[ringLocation.Centroid(2),middleLocation.Centroid(2)],'g','LineWidth',1);
plot([middleLocation.Centroid(1),indexLocation.Centroid(1)],[middleLocation.Centroid(2),indexLocation.Centroid(2)],'g','LineWidth',1);
plot([indexLocation.Centroid(1),thumbLocation.Centroid(1)],[indexLocation.Centroid(2),thumbLocation.Centroid(2)],'g','LineWidth',1);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%   Coordinate Plotting   %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
text(thumbLocation.Centroid(1)+10,thumbLocation.Centroid(2),string([round(thumbLocation.Centroid(1)),round(thumbLocation.Centroid(2))]),'FontSize',9);
text(indexLocation.Centroid(1)+10,indexLocation.Centroid(2),string([round(indexLocation.Centroid(1)),round(indexLocation.Centroid(2))]),'FontSize',9);
text(middleLocation.Centroid(1)+10,middleLocation.Centroid(2),string([round(middleLocation.Centroid(1)),round(middleLocation.Centroid(2))]),'FontSize',9);
text(ringLocation.Centroid(1)+10,ringLocation.Centroid(2),string([round(ringLocation.Centroid(1)),round(ringLocation.Centroid(2))]),'FontSize',9);
text(pinkyLocation.Centroid(1)+10,pinkyLocation.Centroid(2),string([round(pinkyLocation.Centroid(1)),round(pinkyLocation.Centroid(2))]),'FontSize',9);
hold off;