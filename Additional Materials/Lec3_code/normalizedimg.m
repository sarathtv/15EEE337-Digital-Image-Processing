A=imread('fig1.jpg');
K=mat2gray(A)
imshow(K)
B = rgb2gray( K );
surf(B,'edgecolor','none')
colormap(gray)
