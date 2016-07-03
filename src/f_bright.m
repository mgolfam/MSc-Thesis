function res = f_bright( A, value )
%F_BRIGHT Summary of this function goes here
%   Detailed explanation goes here
m = size(A, 1);
n = size(A, 2);
q = size(A, 3);
temp = 0;
v = value;
if value > 99
    v = 100;
end
for i = 1 : m
    for j = 1 : n
        for k = 1 : q
            temp(i, j, k) = A(i, j, k) + v;
        end
    end
end
res = uint8(temp);
end

