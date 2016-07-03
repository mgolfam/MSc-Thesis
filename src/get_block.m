function res = get_block(A, x, y, N)
%GET_BLOCK Summary of this function goes here
%   Detailed explanation goes here
% A is a matrix
% x is the xth block, horiziontal
% y is the yth block, vertical

temp = 0;
ii = (x-1) * N;
jj = (y-1) * N;
for i = 1 : N
    for j = 1 : N
        indexi = ii + i;
        indexj = jj + j;
        temp(i, j) = A(indexi, indexj);
    end
end


res = temp;
end