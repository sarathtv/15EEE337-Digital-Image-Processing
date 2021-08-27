% Read images 1 and 2
 im = imread('peppers.png');
 A = rgb2gray(im);
 A = double(A);
    % Read Kernels
Kernel_1 = (1/9)*ones(3);
Kernel_2 = (1/49)*ones(7);
Kernel = Kernel_2;          % Set current kernel
 img_out = convolution(A,Kernel);   %Perform convolution on image and selected kernel
 img_out_filter = imfilter(A,Kernel,'same','conv');
 %%Display output images
figure('color','w')
subplot(1,3,1); imshow(A,[]); title('Original') 
subplot(1,3,2); imshow(img_out,[]); title('Custom Created Function')
subplot(1,3,3); imshow(img_out_filter,[]); title('Matlab imfilter Function')


function B = convolution(A, k)
    [ky, kx] = size(k);             % Read kernel size
    im_pad = padarray(A, [kx ky]);  % Pad original image
    [y, x] = size(im_pad);          % Read image size
    B = zeros(x,y);         % Create empty matrix to store output image
    kr = rot90(k);          % Rotates kernel 180 deg for convolution
    kr = rot90(kr);
    for i=(1+ky):(y-ky)         % index through each image row
        for j=(1+kx):(x-kx)     % index through each image pixel        
            neigh = im_pad(i-floor(ky/2):i+floor(ky/2), j-floor(kx/2):j+floor(kx/2));   % Create local neighborhood of image
            accumulator = 0; 
            for u=1:ky      % index through each kernel row 
                for v=1:kx  % index through each kernel element
                    if(i>ky && i<y-ky && j>kx && j<y-kx)
                    temp = neigh(u,v)*kr(u,v);
                    accumulator = accumulator + temp;
                    end
                end
            end
            B(i,j) = accumulator;   %Set value of pixel in new image with convolution operation resultant
        end
    end
    B=B(1+ky:y-ky,1+kx:x-kx);       % Remove image padding
end