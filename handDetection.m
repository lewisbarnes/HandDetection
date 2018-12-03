close all;
% 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%   Read image from file and resize   %%%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 UpwardOpen = imread('upwardmiddle.jpg');
%  UpwardIndex = imread('upwardindex.jpg');
%  UpwardMiddle = imread('upwardmiddle.jpg');
%  UpwardRing = imread('upwardring.jpg');
UpwardPinky = imread('upwardpinky.jpg');
processHand(UpwardOpen);
%  processHand(UpwardIndex);
%  processHand(UpwardMiddle);
%  processHand(UpwardRing);
%  processHand(UpwardPinky);
% 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%   Remove the background and get a binary mask for the image   %%%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% [BW, maskedRGBImage] = createMask(handRGB);
% 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%   Isolate the skin from the fingertips   %%%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% [BWskin, maskedSkinImage] = isolateSkin(maskedRGBImage);
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%   Define grayscale version of the image   %%%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% handRGBGreyscale = rgb2gray(handRGB);
% strel = [ 0 1 1 1 0; 1 1 1 1 1; 1 1 1 1 1; 1 1 1 1 1; 0 1 1 1 0];
% 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%   Get Colour Channels   %%%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% R= handRGB(:,:,1);
% G= handRGB(:,:,2);
% B= handRGB(:,:,3);
% 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%% Get the threshold for greyscale conversion using Otsu's method   %%%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% greyThreshold = graythresh(handRGB(:,:,1));
% histGrey = imhist(handRGBGreyscale) / numel(handRGBGreyscale);
% [histMRed,histMGreen,histMBlue] = getHistograms(maskedRGBImage);
% [histRed,histGreen,histBlue] = getHistograms(handRGB);
% 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%% Get the Y axis max for all channels %%%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ylimMax = max([max(histRed),max(histGreen),max(histBlue)]);
% 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%   Get the means for each of the channels including greyscale   %%%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% meanGreyscale = mean2(handRGBGreyscale);
% meanRed = mean2(R);
% meanGreen = mean2(G);
% meanBlue = mean2(B);
% 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%   Display the images in a figure along with their histograms   %%%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% figure('units','normalized','outerposition',[0 0 1 1]);
% subplot(3,3,1);
% 
% imshow(handRGB);
% title('RGB image');
% axis image;
% 
% subplot(3,3,2);
% 
% colormap gray;
% imshow(handRGBGreyscale);
% title('Greyscale image');
% axis image;
% 
% subplot(3,3,3);
% imshow(maskedRGBImage);
% title('Masked image');
% axis image;
% 
% subplot(3,3,5);
% 
% hold on;
% plot(histGrey);
% x = [meanGreyscale meanGreyscale];
% y = [0 max(histGrey)];
% plot(x,y,'--');
% ylim([0 max(histGrey)]);
% hold off;
% 
% ylabel('Normalised Count');
% xlabel('Luminance');
% title('Normalised Histogram of Greyscale image');
% subplot(3,3,4);
% 
% hold on;
% y = [0 ylimMax];
% plot(histRed,'r','LineWidth',1);
% plot([meanRed meanRed],y,'--r','LineWidth',1);
% plot(histGreen,'g','LineWidth',1);
% plot([meanGreen meanGreen],y,'--g','LineWidth',1);
% plot(histBlue,'b','LineWidth',1);
% plot([meanBlue meanBlue],y,'--b','LineWidth',1);
% xlim([0 255]);
% ylim([0 ylimMax]);
% hold off;
% 
% xlabel('Intensity');
% ylabel('Normalised Count');
% title('Normalised Histogram of RGB image');
% 
% subplot(3,3,6);
% 
% hold on;
% y = [0 ylimMax];
% plot(histMRed,'r','LineWidth',1);
% plot(histMGreen,'g','LineWidth',1);
% plot(histBlue,'b','LineWidth',1);
% xlim([0 255]);
% ylim([0 ylimMax]);
% hold off;
% xlabel('Intensity');
% ylabel('Normalised Count');
% title('Normalised Histogram of masked RGB image');
% 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%   Display image stats   %%%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% subplot(3,3,7);
% text(0,1,strcat('Mean R = ',string(floor(meanRed))),'HorizontalAlignment','Center', 'VerticalAlignment','Middle');
% text(0,0.9,strcat('Mean G = ',string(floor(meanGreen))),'HorizontalAlignment','Center', 'VerticalAlignment','Middle');
% text(0,0.8,strcat('Mean B = ',string(floor(meanBlue))),'HorizontalAlignment','Center', 'VerticalAlignment','Middle');
% disp(strcat('Mean R = ',string(floor(meanRed))));
% disp(strcat('Mean G = ',string(floor(meanGreen))));
% disp(strcat('Mean B = ',string(floor(meanBlue))));
% text(0.5,1,strcat('Min R = ',string(min(min(R)))),'HorizontalAlignment','Center', 'VerticalAlignment','Middle');
% text(0.5,0.9,strcat('Min G = ',string(min(min(G)))),'HorizontalAlignment','Center', 'VerticalAlignment','Middle');
% text(0.5,0.8,strcat('Min B = ',string(min(min(B)))),'HorizontalAlignment','Center', 'VerticalAlignment','Middle');
% disp(strcat('Min R = ',string(min(min(R)))));
% disp(strcat('Min G = ',string(min(min(G)))));
% disp(strcat('Min B = ',string(min(min(B)))));
% text(1,1,strcat('Max R= ',string(max(max(R)))),'HorizontalAlignment','Center', 'VerticalAlignment','Middle');
% text(1,0.9,strcat('Max G= ',string(max(max(G)))),'HorizontalAlignment','Center', 'VerticalAlignment','Middle');
% text(1,0.8,strcat('Max B= ',string(max(max(B)))),'HorizontalAlignment','Center', 'VerticalAlignment','Middle');
% axis off;
% subplot(3,3,8);
% text(0.5,1,strcat('Mean Luminance= ',string(floor(meanGreyscale))),'HorizontalAlignment','Center', 'VerticalAlignment','Middle');
% text(0.5,0.9,strcat('Max Luminance= ',string(max(max(handRGBGreyscale)))),'HorizontalAlignment','Center', 'VerticalAlignment','Middle');
% text(0.5,0.8,strcat('Min Luminance= ',string(min(min(handRGBGreyscale)))),'HorizontalAlignment','Center', 'VerticalAlignment','Middle');
% axis off;
% labHand = rgb2lab(maskedRGBImage);
% RLab = labHand(:,:,1);
% GLab = labHand(:,:,2);
% BLab = labHand(:,:,3);
% %%%%%%%%%%%%%%%%%
% %%%   Thumb   %%%
% %%%%%%%%%%%%%%%%%
% Red = RLab >= 29.10 & RLab <= 65.256;
% Green = GLab >= 11.774 & GLab <= 17.399;
% Blue = BLab >= 13 & BLab <= 42.805;
% Thumb = bwareaopen(Red & Green & Blue, 1300);
% Thumb = imerode(Thumb, strel);
% Thumb = Thumb - BWskin;
% 
% %%%%%%%%%%%%%%%%%
% %%%   Index   %%%
% %%%%%%%%%%%%%%%%%
% Red = RLab >= 42.787 & RLab <= 63.153;
% Green = GLab >= -18.454 & GLab <= 3.203;
% Blue = BLab >= 28.407 & BLab <= 54.509;
% Index = bwareaopen(Red & Green & Blue,500);
% Index = imclose(imerode(imdilate(imdilate(Index,strel),strel),strel),strel);
% 
% %%%%%%%%%%%%%%%%%%
% %%%   Middle   %%%
% %%%%%%%%%%%%%%%%%%
% Red = RLab >= 16 & RLab <= 61.6;
% Green = GLab >= -4.692 & GLab <= 3.778;
% Blue = BLab >= -41.64 & BLab <= -12.628;
% Middle = bwareaopen(Red & Green & Blue,1200);
% Middle = imclose(Middle,strel);
% 
% %%%%%%%%%%%%%%%%
% %%%   Ring   %%%
% %%%%%%%%%%%%%%%%
% Red = RLab >= 32.458 & RLab <=54;
% Green = GLab >= -26.488 & GLab <= -14.175;
% Blue = BLab >= -10.028 & BLab <= 3.437;
% Ring = bwareaopen(Red & Green & Blue, 1200);
% Ring = imdilate(Ring,strel);
% 
% %%%%%%%%%%%%%%%%%%
% %%%   Pinky    %%%
% %%%%%%%%%%%%%%%%%%
% Red = RLab >= 31.607 & RLab <= 51.503;
% Green = GLab >= 23.197 & GLab <= 35.899;
% Blue = BLab >= 3.608 & BLab <= 22;
% Pinky = bwareaopen(Red & Green & Blue, 700);
% Pinky = imdilate(Pinky,strel);
% 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%   Find locations and centres of fingertips   %%%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% thumbLocation = regionprops(Thumb,'centroid');
% indexLocation = regionprops(Index,'centroid');
% middleLocation = regionprops(Middle,'centroid');
% ringLocation = regionprops(Ring,'centroid');
% pinkyLocation = regionprops(Pinky,'centroid');
% 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%   Define Isolated Fingertips   %%%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% isolatedPinky = uint8(cat(3,int8(R).*int8(Pinky),int8(G).*int8(Pinky),int8(B).*int8(Pinky)));
% isolatedIndex = uint8(cat(3,int8(R).*int8(Index),int8(G).*int8(Index),int8(B).*int8(Index)));
% isolatedMiddle = uint8(cat(3,int8(R).*int8(Middle),int8(G).*int8(Middle),int8(B).*int8(Middle)));
% isolatedRing = uint8(cat(3,int8(R).*int8(Ring),int8(G).*int8(Ring),int8(B).*int8(Ring)));
% isolatedThumb = uint8(cat(3,int8(R).*int8(Thumb),int8(G).*int8(Thumb),int8(B).*int8(Thumb)));
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%   Define Binary Mask of All Fingertips   %%%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fingertips = rgb2gray(isolatedThumb + isolatedIndex + isolatedMiddle + isolatedRing + isolatedPinky);
% 
% figure('units','normalized','outerposition',[0 0 1 1])
% subplot(2,5,1);
% imshow(Thumb);
% title('Pollex');
% subplot(2,5,6);
% imshow(isolatedThumb);
% subplot(2,5,2);
% imshow(Index);
% 
% title('Digitus Secundus Manus');
% subplot(2,5,7);
% imshow(isolatedIndex);
% subplot(2,5,3);
% imshow(Middle);
% title('Digitus Me''dius');
% subplot(2,5,8);
% imshow(isolatedMiddle);
% subplot(2,5,4);
% imshow(Ring);
% title('Digitus Annula''ris');
% subplot(2,5,9);
% imshow(isolatedRing);
% subplot(2,5,5);
% imshow(Pinky);
% title('Digitus Mi''nimus Ma''nus');
% subplot(2,5,10);
% imshow(isolatedPinky);
% saveas(gcf,"Fingertips.png");
% figure('units','normalized','outerposition',[0 0 1 1]);
% 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%   Fingertips on Greyscale Image   %%%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% imshow(handRGBGreyscale);
% hold on;
% image(maskedRGBImage,'AlphaData',Thumb);
% image(maskedRGBImage,'AlphaData',Index);
% image(maskedRGBImage,'AlphaData',Middle);
% image(maskedRGBImage,'AlphaData',Ring);
% image(maskedRGBImage,'AlphaData',Pinky);
% 
% 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%   Centroid Plotting   %%%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% plot(indexLocation.Centroid(1),indexLocation.Centroid(2),'ro','MarkerSize',10);
% plot(thumbLocation.Centroid(1),thumbLocation.Centroid(2),'ro','MarkerSize',10);
% plot(middleLocation.Centroid(1),middleLocation.Centroid(2),'ro','MarkerSize',10);
% plot(ringLocation.Centroid(1),ringLocation.Centroid(2),'ro','MarkerSize',10);
% plot(pinkyLocation.Centroid(1),pinkyLocation.Centroid(2),'ro','MarkerSize',10);
% plot([pinkyLocation.Centroid(1),ringLocation.Centroid(1)],[pinkyLocation.Centroid(2),ringLocation.Centroid(2)],'g','LineWidth',1);
% plot([ringLocation.Centroid(1),middleLocation.Centroid(1)],[ringLocation.Centroid(2),middleLocation.Centroid(2)],'g','LineWidth',1);
% plot([middleLocation.Centroid(1),indexLocation.Centroid(1)],[middleLocation.Centroid(2),indexLocation.Centroid(2)],'g','LineWidth',1);
% plot([indexLocation.Centroid(1),thumbLocation.Centroid(1)],[indexLocation.Centroid(2),thumbLocation.Centroid(2)],'g','LineWidth',1);
% 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%   Coordinate Plotting   %%%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% text(thumbLocation.Centroid(1)+10,thumbLocation.Centroid(2),string([round(thumbLocation.Centroid(1)),round(thumbLocation.Centroid(2))]),'FontSize',9);
% text(indexLocation.Centroid(1)+10,indexLocation.Centroid(2),string([round(indexLocation.Centroid(1)),round(indexLocation.Centroid(2))]),'FontSize',9);
% text(middleLocation.Centroid(1)+10,middleLocation.Centroid(2),string([round(middleLocation.Centroid(1)),round(middleLocation.Centroid(2))]),'FontSize',9);
% text(ringLocation.Centroid(1)+10,ringLocation.Centroid(2),string([round(ringLocation.Centroid(1)),round(ringLocation.Centroid(2))]),'FontSize',9);
% text(pinkyLocation.Centroid(1)+10,pinkyLocation.Centroid(2),string([round(pinkyLocation.Centroid(1)),round(pinkyLocation.Centroid(2))]),'FontSize',9);
% hold off;
% saveas(gcf,"FingertipsOnGrey.png");
% figure;
% handRGBGreyscale = rgb2gray(maskedRGBImage.*uint8(imcomplement(imerode(imdilate(imbinarize(fingertips),strel),strel))));
% edgeSkin = uint8(edge(uint8(BWskin),'roberts')*255);
% redSkin = cat(3,edgeSkin,edgeSkin,edgeSkin);
% redSkin(:,:,2) = redSkin(:,:,2)*0;
% redSkin(:,:,3) = redSkin(:,:,3)*0;
% handWithSkinOutlineRoberts = handRGB+redSkin;
% 
% edgeSkin = uint8(edge(uint8(BWskin),'prewitt')*255);
% redSkin = cat(3,edgeSkin,edgeSkin,edgeSkin);
% redSkin(:,:,2) = redSkin(:,:,2)*0;
% redSkin(:,:,3) = redSkin(:,:,3)*0;
% handWithSkinOutlinePrewitt = handRGB+redSkin;
% 
% edgeSkin = uint8(edge(uint8(BWskin*255),'canny')*255);
% redSkin = cat(3,edgeSkin,edgeSkin,edgeSkin);
% redSkin(:,:,2) = redSkin(:,:,2)*0;
% redSkin(:,:,3) = redSkin(:,:,3)*0;
% handWithSkinOutlineCanny = handRGB+redSkin;
% 
% edgeSkin = uint8(imdilate(edge(uint8(BWskin*255),'sobel'),strel)*255);
% redSkin = cat(3,edgeSkin,edgeSkin,edgeSkin);
% redSkin(:,:,2) = redSkin(:,:,2)*0;
% redSkin(:,:,3) = redSkin(:,:,3)*0;
% handWithSkinOutlineSobel = handRGB+redSkin;
% 
% subplot(2,2,1);
% imshow(handWithSkinOutlineRoberts);
% title('Roberts Method');
% subplot(2,2,2);
% imshow(handWithSkinOutlinePrewitt);
% title('Prewitt Method');
% subplot(2,2,3);
% imshow(handWithSkinOutlineCanny);
% title('Canny Method');
% subplot(2,2,4);
% imshow(handWithSkinOutlineSobel);
% title('Sobel Method');
% 
% figure;
% 
% hold on;
% y = [0 ylimMax];
% plot(histRed,'r','LineWidth',1);
% plot([meanRed meanRed],y,'--r','LineWidth',1);
% plot(histGreen,'g','LineWidth',1);
% plot([meanGreen meanGreen],y,'--g','LineWidth',1);
% plot(histBlue,'b','LineWidth',1);
% plot([meanBlue meanBlue],y,'--b','LineWidth',1);
% xlim([0 255]);
% ylim([0 ylimMax]);
% hold off;
% xlabel('Intensity');
% ylabel('Normalised Count');
% title('Normalised Histogram of RGB image');
% figure;
% hold on;
% plot(histGrey);
% x = [meanGreyscale meanGreyscale];
% y = [0 max(histGrey)];
% plot(x,y,'--');
% ylim([0 max(histGrey)]);
% hold off;
% 
% ylabel('Normalised Count');
% xlabel('Luminance');
% title('Normalised Histogram of Greyscale image');
% figure;
% hold on;
% y = [0 ylimMax];
% plot(histMRed,'r','LineWidth',1);
% plot(histMGreen,'g','LineWidth',1);
% plot(histBlue,'b','LineWidth',1);
% xlim([0 255]);
% ylim([0 ylimMax]);
% hold off;
% xlabel('Intensity');
% ylabel('Normalised Count');
% title('Normalised Histogram of masked RGB image');