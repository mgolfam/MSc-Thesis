function res = random_matrix( n, high )
%RANDOM_MATRIX Summary of this function goes here
%   Detailed explanation goes here
temp = zeros(n);
for i = 1 : n
    for j = 1 : n
        
        temp(i, j) = randi(high);
        
        
    end
end
res = temp;
end

