 %INPUT  MATRIX
A = zeros(5);
A(:) = 1:25;
%KERNEL
avg3 = ones(3)/9;

%PAD THE MATRIX WITH ZEROS
B = padarray(A,[1 1]);
% PRE-ALLOCATE THE MATRIX
Output = zeros([size(A,1) size(A,2)]);

%PERFORM COONVOLUTION
for i = 1:size(B,1)-2
    for j = 1:size(B,2)-2
        Temp = B(i:i+2,j:j+2).*avg3;
        Output(i,j) = sum(Temp(:));
    end
 end
display(Output);
