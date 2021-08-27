rgbImage = imread('peppers.png');
windowWidth = 21;
kernel = ones(windowWidth) / windowWidth .^ 2;
subplot(2, 1, 1);
imshow(rgbImage);
drawnow;
blurryImage = imfilter(rgbImage, kernel, 'replicate');
subplot(2, 1, 2);
imshow(blurryImage);