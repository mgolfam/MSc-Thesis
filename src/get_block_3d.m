function res = get_block_3d(A, x, y, N)
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
        for k = 1 : size(A, 3)
            indexi = ii + i;
            indexj = jj + j;
            temp(i, j, k) = A(indexi, indexj, k);
        end
    end
end


res = temp;
end