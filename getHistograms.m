function [red,green,blue] = getHistograms(image)
%GETHISTOGRAMS Gets normalised histograms for each channel of RGB image
red = imhist(image(:,:,1))/  numel(image(:,:,1));
green = imhist(image(:,:,2))/ numel(image(:,:,2));
blue = imhist(image(:,:,3))/ numel(image(:,:,3));
end

