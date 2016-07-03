clear all;
clc;

lena = imread('imgs\im1-1024.jpg');
logo = imread('imgs\logo32.jpg');

proposed = watermark_proposed(lena, logo, 4);
ref9 = watermark_9(lena, logo);
salt = 0;
counter = 1;
% Salt and pepper
for i = 4:12
    
    pp = n_salt_pepper(proposed, i);
    rr = n_salt_pepper(ref9, i);
    
    w1 = watermark_inv_proposed(pp, 4, 32, 32);
    w2 = watermark_inv_9(rr, 32, 32);
    salt(1, counter) = nc_(w1, logo);
    salt(2, counter) = nc_(w2, logo);
    counter = counter + 1;
    
end