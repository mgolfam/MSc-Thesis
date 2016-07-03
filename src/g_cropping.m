function res = g_cropping( A, x1, y1, x2, y2 )
%G_CROPPING Summary of this function goes here
%   Detailed explanation goes here

m = size(A, 1);
n = size(A, 2);
d = size(A, 3);
temp = 0;
perm = false;

if y2 < n & y1 > 1 & x1 > 1 & x2 < m
    perm = true;
end

ii = 1;
jj = 1;
if perm
    for i = x1 : x2
        for j = y1 : y2
            for k = 1 : 3
                temp(ii, jj, k) = A(i, j, k);
            end
            jj = jj + 1;
        end
        jj = 1;
        ii = ii + 1;
    end
else
    error('the entered value are out of bound...');
    res = A;
end
res = temp;
end

