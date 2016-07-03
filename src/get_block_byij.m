function res = get_block_byij(A, x, y, N)
%GET_BLOCK Summary of this function goes here
%   Detailed explanation goes here
% A is a matrix
% x is the xth block, horiziontal
% y is the yth block, vertical

temp = 0;
for i = 1 : N
    for j = 1 : N
        indexi = x + i - 1;
        indexj = y + j - 1;
        temp(i, j) = A(indexi, indexj);
    end
end


res = temp;
end