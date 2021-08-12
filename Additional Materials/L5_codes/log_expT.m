function [logT,expT] = log_expT(im)
% Example usage
%    im = imread('cameraman.tif');
%    [L,E] = log_expT(im);
[row col wid] = size(im);
if(wid==3)
    im = rgb2gray(im); % convert to gray scale if it is color image
end
% Log transformation
for i=1:size(im,1)
    for j=1:size(im,2)
        in = double(im(i,j)+1);
        L(i,j) = log2(in);
    end
end
subplot(1,3,1);
imshow(im),title('Original Image');
% Exponantial transformation
for i=1:size(im,1)
    for j=1:size(im,2)
        in = double(L(i,j)+1);
        E(i,j) = exp(in);
    end
end
% convert to 8-bit
logT = (L/(max(L(:))))*255; % 
expT = (E/(max(E(:))))*255;
subplot(1,3,2);
imshow(logT,[]),title('Log Transformed'); 
subplot(1,3,3);
imshow(expT,[]),title('Exponential of Log Transformed'); 
return;



