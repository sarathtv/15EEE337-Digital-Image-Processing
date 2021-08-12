clear all;
close all;
clc;
itemp = imread('office_5.jpg');   % read the image
r = double(itemp)/255;              % normalise the image
c = 1;              % constant
gamma = 0.6;          % to make image dark take value of gamma > 1, to make image bright take vlue of gamma < 1
s = c*(r).^gamma;   % formula to implement power law transformation
subplot(1,2,1),imshow(uint8(itemp)),title('Original Image');
subplot(1,2,2),imshow(s),title('Power Law Transformed Image');