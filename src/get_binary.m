function res = get_binary( A )
%GET_BINARY Summary of this function goes here
%   Detailed explanation goes here
temp = 0;
m = size(A, 1);
n = size(A, 2);
bin = get_binarychar(A);
index = 1;
for i = 1 : m
    for j = 1 : n
        for k = 1 : 8
            temp(i, index) = str2num(bin(i, k, j));
            index = index + 1;
        end
    end
    index = 1;
end
res = temp;
end

