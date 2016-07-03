clear all; clc;
img = imread('imgs\im1-512.jpg');
w = size(img, 2);
h = size(img, 1);
blocksize = 4;
temp = uint8(0);
for i = 1 : h/blocksize
    for j = 1 : w/blocksize
        for k = 1 : 3
            b = get_block(img(:, :, k), i, j, blocksize);
            sum = 0;
            for ii = 1 : blocksize
                for jj = 1 : blocksize
                    sum = sum + b(ii, jj);
                end
            end
            sum = sum / (blocksize.^2);
            for ii = 1 : blocksize
                for jj = 1 : blocksize
                    temp((blocksize*(i-1))+ii, (blocksize*(j-1))+jj, k) = sum;
                end
            end
            
        end
    end
end
clear w h blocksize i j k ii jj sum b
temp = uint8(temp);
imshow(temp);