function res = zerobaz(start, endl, mat)
%ZEROBAZ Summary of this function goes here
%   Detailed explanation goes here
s = round(start);
e = round(endl);
for i = s : e
    mat(i, i) = 0;
end
res = mat;
end

