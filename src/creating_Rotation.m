clear all;
clc;
tic
kid = imread('imgs\im7-512.jpg');
w = imread('imgs\logo16.jpg');
wo = w;

% Extracted from proposed method
w1 = 0;
% Extracted from Reference 9 method
w2 = 0;

proposed = watermark_proposed(kid, w, 4);
ref9 = watermark_9(kid, w);
ncvals = 0;
counter = 1;
for i = pi/2
    tic
    proposed_com = g_rotation(proposed, i);
    ref9_com = g_rotation(ref9, i);

    
    w1 = watermark_inv_proposed(proposed_com, 4, size(w, 1), size(w, 1));
    w2 = watermark_inv_9(ref9_com, size(w, 1), size(w, 1));

    ncvals(1, counter) = nc_(double(w), double(w1));
    ncvals(2, counter) = nc_(double(w), double(w2));
    counter = counter + 1;
    i
    toc
end