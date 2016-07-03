function res = max_value( m )
%MAX_VALUE Summary of this function goes here
%   Detailed explanation goes here
temp = m(1, 1);
for i = 1 : size(m, 1)
    for j = 1 : size(m, 2)
        if(temp < m(i, j))
            temp = m(i, j);
        end
    end
end
res = temp;
end


