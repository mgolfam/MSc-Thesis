function res = nc_( w, wprime )
%_NC Summary of this function goes here
%   Detailed explanation goes here
w = double(w);
wprime = double(wprime);
top = 0;
lower = 0;
lower1 = 0;
lower2 = 0;
m = size(w, 1);
n = size(w, 2);
q = size(w, 3);
for k = 1 : q
    for i = 1 : m
        for j = 1 : n
            top = top + (w(i, j, k) * wprime(i, j, k));
        end
    end
end
for k = 1 : q
    for i = 1 : m
        for j = 1 : n
            lower1 = lower1 + (w(i, j, k)^2);
            lower2 = lower2 + (wprime(i, j, k)^2);
        end
    end
end
lower1 = sqrt(lower1);
lower2 = sqrt(lower2);
lower = lower1 * lower2;
res = abs(top / lower);
end