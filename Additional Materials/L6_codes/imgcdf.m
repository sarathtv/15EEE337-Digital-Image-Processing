A = imread('cameraman.tif');    
[histIM, bins] = imhist(A);
counts = histcounts(A);
cdf = cumsum(counts) / sum(counts);
plot(cdf); % If you want to be more precise on the X axis plot it against bins