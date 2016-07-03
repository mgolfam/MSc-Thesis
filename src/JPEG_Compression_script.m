% MATLAB 4.2c JPEG image compression program
% by Scott Teresi, www.teresi.us
% March 15-17, 1997

% Data Classification and Compression class
% Dr. Salari, Univ. of Toledo

% This program compresses an image using the JPEG algorithm

% Enter matlab, then type the name of this file (jpeg) to execute it.
% It requires a ".mat" file containing raw black-and-white image data
% stored in matrix variable "X". The matrix contains the pixel intensities.
% Also, store a colormap in variable "map" (see first few lines of program).


% Initializations

clear                  % clear all variables from previous sessions
load lenna             % load file of variables containing a gray image matrix

orig_img = X;          % image matrix was stored in variable X
                       % image colormap is stored in variable map

quant_multiple = 1;    % set the multiplier to change size of quant. levels
                       % (fractions decrease distortion)
                       % vary quant_mult from .1 to 3 (see jpeg.results file)

blocksize = 8;         % set the size of chunks to take the DCT of ( =< 8)
DCT_quantizer = ...    % levels for quantizing the DCT block (8x8 matrix)
	[ 16  11  10  16  24  40  51  61; ...
	  12  12  14  19  26  58  60  55; ...
	  14  13  16  24  40  57  69  56; ...
	  14  17  22  29  51  87  80  62; ...
	  18  22  37  56  68 109 103  77; ...
	  24  35  55  64  81 104 113  92; ...
	  49  64  78  87 103 121 120 101; ...
	  72  92  95  98 112 100 103  99 ];

sz = size(orig_img);
rows = sz(1,1);               % finds image's rows and columns
cols = sz(1,2);
colors = max(max(orig_img));  % guess at the number of colors in the image

% Replace a color colormap with a grayscale one
% 
% map_sz = size(map);
% clrs = map_sz(1,1);
% gray_map = (0:clrs-1)' / (clrs-1);
% gray_map = [gray_map gray_map gray_map];
% map = gray_map;
% colormap(map)




% Introduction

str = str2mat( ...
  'Scott Teresi, March 1997.', ...
  'This program implements the JPEG data compression algorithm.');
ssdisp(0, str);

fprintf (1, 'Image used:               lenna.mat\n');
fprintf (1, 'Its size is:              %dx%d\n', rows, cols);
fprintf (1, 'Number of colors (guess): %d\n', colors);
fprintf (1, 'DCT block size:           %dx%d\n', blocksize, blocksize);
fprintf (1, 'Quant. size multiplier:   %d\n', quant_multiple);

% Display the original image

figure(1)
image(orig_img)
colormap(map)
title('Original image')
figure(2)




% Prepare image for transform

% Level-shift the image (center intensity values around 0)

orig_img = orig_img - ceil(colors/2);

% Replicate edges of image to make its dimensions a multiple of blocksize

pad_cols = (1 - (cols/blocksize - floor(cols/blocksize))) * blocksize;
if pad_cols == blocksize, pad_cols = 0; end
pad_rows = (1 - (rows/blocksize - floor(rows/blocksize))) * blocksize;
if pad_rows == blocksize, pad_rows = 0; end

for extra_cols = 1:pad_cols
  orig_img(1:rows, cols+extra_cols) = orig_img(1:rows, cols);
end

cols = cols + pad_cols;    % orig_img is now pad_cols wider

for extra_rows = 1:pad_rows
  orig_img(rows+extra_rows, 1:cols) = orig_img(rows, 1:cols);
end

rows = rows + pad_rows;    % orig_img is now pad_rows taller




% calculate the DCT transform matrix
%    (from page 336 of the Intro to Data Compression book)

i = 0;
for j = 0: blocksize - 1
  DCT_trans(i + 1, j + 1) = sqrt(1 / blocksize) ...
                          * cos ((2 * j + 1) * i * pi / (2 * blocksize));
end

for i = 1: blocksize - 1
  for j = 0: blocksize - 1
    DCT_trans(i + 1, j + 1) = sqrt(2 / blocksize) ...
                            * cos ((2 * j + 1) * i * pi / (2 * blocksize));
  end
end




% Take DCT of blocks of size blocksize

fprintf(1, '\nFinding the DCT and quantizing...\n');
starttime = cputime;              % "cputime" is an internal cpu time counter

jpeg_img = orig_img - orig_img;   % zero the matrix for the compressed image

for row = 1: blocksize: rows
  for col = 1: blocksize: cols

       % take a block of the image:
    DCT_matrix = orig_img(row: row + blocksize-1, col: col + blocksize-1);

       % perform the transform operation on the 2-D block
       %    (from page 331 of the Intro to Data Compression book)
    DCT_matrix = DCT_trans * DCT_matrix * DCT_trans';

       % quantize it (levels stored in DCT_quantizer matrix):
    DCT_matrix = floor (DCT_matrix ...
          ./ (DCT_quantizer(1:blocksize, 1:blocksize) * quant_multiple) + 0.5);

       % place it into the compressed-image matrix:
    jpeg_img(row: row + blocksize-1, col: col + blocksize-1) = DCT_matrix;

  end
end

fprintf(1, '   CPU time used: %1.3f\n', (cputime - starttime))


% Reverse the process (take the Inverse DCT)

fprintf(1, 'Reconstructing quantized values and taking the inverse DCT...\n');
starttime = cputime;

recon_img = orig_img - orig_img;  % zero the matrix for the reconstructed image

for row = 1: blocksize: rows
  for col = 1: blocksize: cols

       % take a block of the image:
    IDCT_matrix = jpeg_img(row: row + blocksize-1, col: col + blocksize-1);

       % reconstruct the quantized values:
    IDCT_matrix = IDCT_matrix ...
                .* (DCT_quantizer(1:blocksize, 1:blocksize) * quant_multiple);

       % perform the inverse DCT:
    IDCT_matrix = DCT_trans' * IDCT_matrix * DCT_trans;

       % place it into the reconstructed image:
    recon_img(row: row + blocksize-1, col: col + blocksize-1) = IDCT_matrix;

  end
end

fprintf(1, '   CPU time used: %1.3f\n', (cputime - starttime))




% Restore image to normal

% Level-shift the image back

recon_img = recon_img + ceil(colors/2);
orig_img = orig_img + ceil(colors/2);

% Clip off padded rows and columns

rows = rows - pad_rows;
cols = cols - pad_cols;
recon_img = recon_img(1:rows, 1:cols);

% Display image

colormap(map)
image(recon_img)
title('Decompressed JPEG image')




% Calculate signal-to-noise ratio

fprintf(1, 'Finding the signal-to-noise ratio...\n');
starttime = cputime;

PSNR = 0;
for row = 1:rows
  for col = 1:cols
    PSNR = PSNR + (orig_img(row, col) - recon_img(row, col)) ^ 2;
  end
end
PSNR = 10 * log10 ((255^2) / (1 / (((rows + cols) / 2) ^ 2) * PSNR));
             % (averaged rows and cols together)

fprintf(1, '   CPU time used: %1.3f\n', (cputime - starttime))
fprintf(1, '\nThe signal-to-noise ratio (PSNR) is: %1.3f dB\n\n', PSNR);
