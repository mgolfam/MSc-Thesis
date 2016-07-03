function b = get_one_component( a, n )
%GET_ONE_COMPONENT Summary of this function goes here
%   Detailed explanation goes here
temp = 0;
for i = 1 : size(a, 1)
    for j = 1 : size(a, 2)
        for k = 1 : size(a, 3)
            if k==n
                temp(i, j, k) = a(i, j, k);
            else
                temp(i, j, k) = uint8(0);
            end
        end
    end
end
b = uint8(temp);
end

