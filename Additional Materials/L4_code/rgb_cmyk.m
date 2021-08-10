
clc;    % Clear the command window.
close all;  % Close all figures (except those of imtool.)
clear;  % Erase all existing variables. Or clearvars if you want.
workspace;  % Make sure the workspace panel is showing.
format long g;
format compact;
fontSize = 15;

rgbImage = imread('peppers.png');
subplot(2, 4, 1);
imshow(rgbImage);
title('RGB Image', 'FontSize', fontSize);
subplot(2, 4, 2);
imshow(rgbImage(:, :, 1));
title('Red Channel', 'FontSize', fontSize);
subplot(2, 4, 3);
imshow(rgbImage(:, :, 2));
title('Green Channel', 'FontSize', fontSize);
subplot(2, 4, 4);
imshow(rgbImage(:, :, 3));
title('Blue Channel', 'FontSize', fontSize);
% Do the conversion
cmykImage = rgb2cmyk(rgbImage);
subplot(2, 4, 5);
imshow(cmykImage(:, :, 1), []);
title('Cyan Channel', 'FontSize', fontSize);
subplot(2, 4, 6);
imshow(cmykImage(:, :, 2), []);
title('Magenta Channel', 'FontSize', fontSize);
subplot(2, 4, 7);
imshow(cmykImage(:, :, 3), []);
title('Yellow Channel', 'FontSize', fontSize);
subplot(2, 4, 8);
imshow(cmykImage(:, :, 4), []);
title('Black Channel', 'FontSize', fontSize);

function c = rgb2cmyk(c)

% RGB2CMYK   Converts between RGB- and CMYK- Colors
%
% RedGreenBlue <---> CyanMangentaYellowBlack
%
% CMYK = RGB2CMYK(  RGB )
% 
%  RGB = RGB2CMYK( CMYK )
%
% RGB :  N by 3   , N Colors
% CMYK:  N by 4 
% 
%

s = size(c);
n = size(s,2);

m = s(2+(n==3));

if ~( isnumeric(c) & any( n == [ 2  3 ]) & ...
      any( m == [ 3  4 ] ) )
    error('Input must be a RGB or CMYK ColorMatrice.');
end

if isempty(c)
   return
end

u8 = strcmp(class(c),'uint8');
if u8
   c = double(c)/255;
end

sub = { ':'  ':' };
sub = sub(1:(1+(n==3)));

if m == 3
%  RGB --> CMYK

   c = 1 - c;
   k = min(c,[],n);

   c = c - k(sub{:},[1 1 1]);

   c = cat( n , c , k );

else
% CMYK --> RGB

   c = 1 - ( c(sub{:},[1 2 3]) + c(sub{:},[4 4 4]) );

end


if u8
   c = uint8(round(c*255));
end
 
end