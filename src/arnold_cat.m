function newimg = arnold_cat( img, n )
%ARNOLD_CAT Summary of this function goes here
%   Detailed explanation goes here
temp = img;
w = size(img, 2);
h = size(img, 1);
a = [2 1; 1 1];
for x = 0 : w-1
    for y = 0 : h-1
        for c = 1 : size(img, 3)
            for i = 1 : n
                map = a * [x; y];
                map(1) = mod(map(1), w) + 1;
                map(2) = mod(map(2), h) + 1;
                temp(y+1, x+1, c) = img(map(2), map(1), c);
            end
        end
    end
end
newimg = uint8(temp);
end

