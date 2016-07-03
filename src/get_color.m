function res = get_color( img, N )
%GET_COLOR Summary of this function goes here
%   this function returns, one color of image.
temp(1, 1, 3) = uint8(0);
for i = 1 : size(img, 1)
    for j = 1 : size(img, 2)
        for k = 1 : 3
            if k == N
                temp(i, j, k) = img(i, j, k);
            else
                temp(i, j, k) = uint8(0);
            end
        end
    end
end
res = temp;
end