function res = n_salt_pepper( A, block )
%N_SALT_PEPPER Summary of this function goes here
%   Detailed explanation goes here
m = size(A, 1);
n = size(A, 2);
q = size(A, 3);
temp = A;
for i = 1 : cutoff(m/block)
    for j = 1 : cutoff(n/block)
        
        if cutoff(randi(2)/2) == 1
           if cutoff(randi(2)/2) == 1
               ii = randi(block)+(i-1)*block;
               jj = randi(block)+(j-1)*block;
               for k = 1 : q
                   temp(ii, jj, k) = 255;
               end
           else
               ii = randi(block)+(i-1)*block;
               jj = randi(block)+(j-1)*block;
               for k = 1 : q
                   temp(ii, jj, k) = 0;
               end
           end
        end
        
    end
end
res = uint8(temp);
end
