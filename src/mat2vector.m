function V = mat2vector( M )
%MAT2VECTOR Summary of this function goes here
%   Detailed explanation goes here
temp=0;
c=1;
for i=1:size(M, 1)
    for j=1:size(M, 2)
        for k=1:size(M, 3)
            temp(1, 1, k, c)=M(i, j, k);
            
        end
        c=c+1;
    end
end
V = temp;
end

