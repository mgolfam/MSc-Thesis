function wprime = watermark_inv_9( h, width, height )
%WATERMARK_INV_9 Summary of this function goes here
%   Detailed explanation goes here

% Block Size
Bsize = 0;
m = width;
n = height;
landa = 0;
kb = 0;
N = 0;
Bsize = size(h, 2)/width;
N = cutoff(Bsize / 2);

if(Bsize == 8)
        landa = 4;
        kb = 3;
elseif Bsize == 16
        landa = 5;
        kb = 4;
elseif Bsize == 32
        landa = 6;
        kb = 5;
end

wtemp = 0;
for i = 1 : n
	for j = 1 : m
        for k = 1 : 3
            
            B = get_block(h(:, :, k), i, j, Bsize);
            [u, s, v] = svd(B);
            wtemp(i, j, k) = s(N, N) * kb;
            
        end
    end
end
wprime = uint8(wtemp);
end

