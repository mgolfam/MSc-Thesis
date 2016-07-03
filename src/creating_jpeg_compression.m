clear all;
clc;
tic
kid = imread('imgs\im7-1024.jpg');
w = imread('imgs\logo32.jpg');

% Extracted from proposed method
w1 = 0;
% Extracted from Reference 9 method
w2 = 0;

proposed = watermark_proposed(kid, w, 4);
ref9 = watermark_9(kid, w);
ncvals = 0;
counter = 1;
for i = 7:10:97
    
    proposed_com = jpeg_compression(proposed, i);
    ref9_com = jpeg_compression(ref9, i);
    
    w1 = watermark_inv_proposed(proposed_com, 4, size(w, 1), size(w, 1));
    w2 = watermark_inv_9(ref9_com, size(w, 1), size(w, 1));
    ncvals(1, counter) = nc_(double(w), double(w1));
    ncvals(2, counter) = nc_(double(w), double(w2));
    dir1 = 'imgs\jpegcomp9\proposed\';
    dir1 = char(dir1, int2str(counter), '.jpg');
    dir1 = s_strappend(dir1);
    dir2 = 'imgs\jpegcomp9\9\';
    dir2 = char(dir2, int2str(counter), '.jpg');
    dir2 = s_strappend(dir2);
    imwrite(w1, dir1);
    imwrite(w2, dir2);
    counter = counter + 1;
end
toc