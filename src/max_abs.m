function res = max_abs( m )
%MAX_ABS Summary of this function goes here
%   Detailed explanation goes here
mm = abs(m);
temp = mm(1, 1);
for i = 1 : size(mm, 1)
    for j = 1 : size(mm, 2)
        if(temp < mm(i, j))
            temp = mm(i, j);
        end
    end
end
res = temp;

end

