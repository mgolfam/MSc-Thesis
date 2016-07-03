function res = f_blur( A, p )
%F_BLUR Summary of this function goes here
%   Detailed explanation goes here
m = size(A, 1);
n = size(A, 2);
q = size(A, 3);
temp = 0;

for i = 1 : m
    for j = 1 : n
        for k = 1 : q
            
            c = 0;
            sum = 0;
            for ii = i : i+p
                for jj = j : j+p
                    
                    if (ii >= 1 & ii <= m & jj >= 1 & jj <= n)
                        sum = sum + double(A(ii, jj, k));
                        c = c + 1;
                    end
                    
                end
            end
            temp(i, j, k) = cutoff(sum/c);
            
        end
    end
end
res = uint8(temp);

end