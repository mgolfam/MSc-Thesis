function res = psnr( H, Hprime )
%PSNR Summary of this function goes here
%   Detailed explanation goes here
m=size(H, 1);
n=size(H, 2);
q=size(H, 3);
top= m * n * max_value(H.^2);
low(1)=0;
low(2)=0;
low(3)=0;
for i=1:q
    for x=1:n
        for y=1:m
            low(i) = low(i)+(H(x, y, i) - Hprime(x, y, i))^2;
        end
    end
end
temp = 0;
for i = 1 : q
    temp = temp + 10*log10(top/low(i));
end
temp = temp/q;
res = temp;
end

