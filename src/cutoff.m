function res = cutoff( n )
%CUTOFF Summary of this function goes here
%   Detailed explanation goes here

t = round(n);
if(t > n) 
    t = t - 1;
end
res = t;
end

