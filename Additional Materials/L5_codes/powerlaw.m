
%% 
% This is for Power-Law Transform 
%%
    
%for gamma value less than 1 we get Bright image
%for gamma value greater than 1 we get Dark image
%%
% Clear History
clear all
close all
%%
%%
% Importing image in Workspace
RGB=imread('board.tif');
%%
%% RGB to gray
I=rgb2gray(RGB);
% In double format
I=im2double(I);
%%
% computing size m,n 
[m n] = size(I);
%%
% Computing s = c * (r ^ gamma) where r and gamma are positive constants 
c = 2;
g =[0.5 0.7 0.9 1 2 3 4 5 6];% Gamma Correction Array
for r=1:length(g)
for p = 1 : m
    for q = 1 : n
        I3(p, q) = c * I(p, q).^ g(r);  
    end
end
figure, imshow(I3);title(['With gamma= ' ,num2str(g(r))]);xlabel('Gamma='),xlabel(g(r));
end
