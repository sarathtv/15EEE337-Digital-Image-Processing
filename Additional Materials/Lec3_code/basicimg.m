A=imread('fig1.jpg');
B = rgb2gray( A );
surf(B,'edgecolor','none')
colormap(gray)
