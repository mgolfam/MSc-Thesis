function res = dec_2_bin( A )
%DEC_2_BIN Summary of this function goes here
%   Detailed explanation goes here
ch = '00000000';
bin = dec2bin(A);
for i = 1 : size(bin, 1)
    temp(i, :) = ch;
end
lenght = size(bin, 2);
for i = 1 : size(bin, 1)
    for j = 1 : lenght
        temp(i, 8-j+1) = bin(i, lenght - j + 1);
    end
end
res = temp;
end

