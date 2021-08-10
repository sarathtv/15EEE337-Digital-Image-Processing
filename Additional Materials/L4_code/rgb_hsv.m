h=imread('peppers.png');
imshow(h)
hsi_imgage=rgb2hsv(h);
imshow(hsi_imgage(:,:,1)) % last arg select the channel
h1=hsi_imgage(:,:,1);
h2=hsi_imgage(:,:,2);
h3=hsi_imgage(:,:,3);
