function res = get_binarychar( A )
%GET_BINARYCHAR Summary of this function goes here
%   Detailed explanation goes here
ch = '00000000';
m = size(A, 1);
n = size(A, 2);
temp = ch;
bin = dec_2_bin(A);
for i = 1 : m
    temp(i, :) = ch;
end
for i = 1 : n
    temp(:, :, i) = temp(:, :, 1);
end
index = 1;
for i = 1 : n
    for j = 1 : m
        temp(j, :, i) = bin(index, :);
        index = index + 1;
    end
end
res = temp;

end

