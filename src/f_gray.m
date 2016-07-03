function res = f_gray(b)
%F_GRAY Summary of this function goes here
%   Detailed explanation goes here
A = double(b);
m = size(A, 1);
n = size(A, 2);
temp = 0;
if(size(A, 3) <3)
    res = A;
else
    for i  = 1 : m
        for j = 1 : n
            temp(i, j) = floor( ( A(i, j, 1) + A(i, j, 2) + A(i, j, 3) ) / 3 );
        end
    end
    res = uint8(temp);
end

end

