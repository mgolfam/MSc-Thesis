function res = f_contrast_adjustment( A, con )
%F_CONTRAST_ADJUSTMENT Summary of this function goes here
%   Detailed explanation goes here
m = size(A, 1);
n = size(A, 2);
q = size(A, 3);
temp = 0;
factor = (259 * (con + 255)) / (255 * (259 - con));
for i = 1 : m
    for j = 1 : n
        for k = 1 : q
            temp(i, j, k) = cutoff((factor * A(i, j, k) - 128) + 128);
        end
    end
end
res = uint8(temp);
end