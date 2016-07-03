function res = g_rotation( A, teta )
%G_ROTATION Summary of this function goes here
%   Detailed explanation goes here
m = size(A, 1);
n = size(A, 2);
q = size(A, 3);
temp = 0;
x0 = cutoff(n/2);
y0 = cutoff(m/2);

for i = 1 : m
    for j = 1 : n

            x2 = round(cos(teta)*(j-x0) - sin(teta)*(i-y0)+x0);
            y2 = round(sin(teta)*(j-x0) + cos(teta)*(i-y0)+y0);
            if x2<=1
                x2=1;
            end    
            if y2<=1
                y2=1;
            end
            for k = 1 : q
                temp(y2, x2, k) = A(i, j, k);
            end
    end
end
res = uint8(temp);
end