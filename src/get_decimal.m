function res = get_decimal( A )
%GET_DECIMAL Summary of this function goes here
%   Detailed explanation goes here
m = size(A, 1);
%size of matrix in binary
n1 = size(A, 2);
n = n1 / 8;
ch = '00000000';
c = ch;
temp = 0;
for i = 1 : m
    for j = 1 : n
        for k = 1 : 8
            tt = A(i, 8*(j-1) + k);
            c(k) = num2str(tt);
        end
        temp(i, j) = bin2dec(c);
        c = ch;
    end
end

res = temp;
end