 A = imread('concordaerial.png');
 Ref = imread('concordorthophoto.png');
B = imhistmatch(A,Ref);
figure
subplot(1,2,1)
imshow(A)
title('RGB Image with Color Cast')
subplot(1,2,2)
imhist(A)
figure
subplot(1,2,1)
imshow(Ref)
title('Reference Grayscale Image')
subplot(1,2,2)
imhist(Ref)
figure
subplot(1,2,1)
imshow(B)
title('Histogram Matched RGB Image')
subplot(1,2,2)
imhist(B)