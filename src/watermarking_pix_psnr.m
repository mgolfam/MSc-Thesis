clear all; clc;
%%%%%%% Enter
block_size = 4;
psnr_values = 0;
nc_values = 0;

dir = 'imgs\\';
ext = '.jpg';
name = 'im';
s1 = '-1024';
s5 = '-512';
h = 0;
hh = 0;
w16 = imread('imgs\logo16.jpg');
w32 = imread('imgs\logo32.jpg');

for pic = 1:9
    ch = char(dir, name, int2str(pic), s1, ext);
    ch = s_strappend(ch);
    simg = char(dir, name, int2str(pic), s1, '_watermarked', ext);
    simg = s_strappend(simg);
    wwdir = char(dir, name, int2str(pic), s1, '_extraced_watermark', ext);
    wwdir = s_strappend(wwdir);
    h = imread(ch);
    hh = watermark_proposed(h, w32, 4);
    ww = watermark_inv_proposed(hh, 4, 32, 32);
    psnr_values(pic) = psnr(double(h), double(hh));
    nc_values(pic) = nc_(double(w32), double(ww));
    imwrite(hh, simg);
    imwrite(ww, wwdir);
end