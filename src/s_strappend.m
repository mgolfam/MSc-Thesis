function res = s_strappend( strings )
%S_STRAPPEND Summary of this function goes here
%   Detailed explanation goes here
temp = '';
c=1;
for i = 1:size(strings, 1)
    cc = (strings(i, :));
    for j=1:size(cc, 2)
        if ~strcmp(cc(j), ' ')
            temp(c) = cc(j);
            c=c+1;
        end
    end
end
res = temp;
end

