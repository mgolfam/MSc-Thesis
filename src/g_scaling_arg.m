function res = g_scaling_arg( A, scale)
%G_SCALING Summary of this function goes here
%   Detailed explanation goes here
m = size(A, 1);
n = size(A, 2);
q = size(A, 3);
temp = 0;
h2 = m * scale; 
w2 = n * scale;
xratio = n/w2;
yratio = m/h2;

for i = 1 : h2
    for j = 1 : w2
        for k = 1 : q
            
            px = cutoff(j*xratio);
            py = cutoff(i*yratio);
            if px<1
                px=1;
            end
            if px>n
                px=n;
            end
            if py<1
                py=1;
            end
            if py>m
                py=m;
            end
            temp(i, j, k) = A(py, px, k);
        end
    end
end
res = uint8(temp);
end

