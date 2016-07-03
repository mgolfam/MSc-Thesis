function res = g_flipping( A, h, v)
%G_FLIPPING Summary of this function goes here
%   Detailed explanation goes here
% h is a boolean variable means horizental Flipping
% v is a boolean variable means vertical Flipping
m = size(A, 1);
n = size(A, 2);
q = size(A, 3);
temp = 0;
if v & h
    for i = 1 : m
        for j = 1 : n
            for k = 1 : q
                temp(i, j, k) = A(m-i+1, n-j+1, k);
            end
        end
    end
elseif h
    for i = 1 : m
        for j = 1 : n
            for k = 1 : q
                temp(i, j, k) = A(i, n-j+1, k);
            end
        end
    end
elseif v
    for i = 1 : m
        for j = 1 : n
            for k = 1 : q
                temp(i, j, k) = A(m-i+1, j, k);
            end
        end
    end
end

res = uint8(temp);

end

