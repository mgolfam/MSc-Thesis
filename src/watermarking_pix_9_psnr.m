clear all; clc;
%%%%%%% Enter
block_size = 4;
psnr_values = 0;
nc_values = 0;

dir = 'imgs\\';
dir2 = 'imgs\\reference_9\\';
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
    simg = char(dir2, name, int2str(pic), s1, '_watermarked_9', ext);
    simg = s_strappend(simg);
    wwdir = char(dir2, name, int2str(pic), s1, '_extraced_watermark_9', ext);
    wwdir = s_strappend(wwdir);
    h = imread(ch);
    hh = watermark_9(h, w32);
    ww = watermark_inv_9(hh, 32, 32);
    psnr_values(pic) = psnr(double(h), double(hh));
    nc_values(pic) = nc_(double(w32), double(ww));
    imwrite(hh, simg);
    imwrite(ww, wwdir);
end