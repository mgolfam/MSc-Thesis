img = imread('imgs\motherboard.jpg');
w = size(img, 2);
h = size(img, 1);
hh = h;
ww = w;
temp = uint8(0);
if mod(hh, 8) ~= 0
    hh = hh + (8-mod(hh, 8));
end

if mod(ww, 8) ~= 0
    ww = ww + (8-mod(ww, 8));
end

for i = 1 : hh
    for j = 1 : ww
        for k = 1 : size(img, 3)
            
            if i<=h & j<=w
                temp(i, j, k) = img(i, j, k);
            else
                temp(i, j, k) = uint8(0);
            end
            
        end
    end
end

imshow(temp);