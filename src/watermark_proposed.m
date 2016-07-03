function hprime = watermark_proposed( h, w, block_size )
%WATERMARK_PROPOSED Summary of this function goes here
%   Detailed explanation goes here
host_original = h;
newhost = h;
watermark = w;

watermark = arnold_cat(watermark, 1);
watermark_b(:, :, 1) = get_binary(double(watermark(:, :, 1)));
watermark_b(:, :, 2) = get_binary(double(watermark(:, :, 2)));
watermark_b(:, :, 3) = get_binary(double(watermark(:, :, 3)));
watermark = watermark_b;
clear watermark_b;

Bm = size(watermark, 1);
Bn = size(watermark, 2);
for i = 1:Bm
    for j = 1:Bn
        for k = 1:3
            block = get_block(host_original(:, :, k), i, j, block_size);
            [u, s, v] = svd(block);
            
            u_avg = (abs(u(2, 1)) + abs(u(3, 1) ))/2;
            T = max_value(abs([u(2, 1) u(3, 1)]))/6;
            
            if(watermark(i, j, k) == 1)
                %if u(2, 1) > u(3, 1)
                    u(2, 1) = sgn(u(2, 1)) * (u_avg + T/2);
                    u(3, 1) = sgn(u(3, 1)) * (u_avg - T/2);
                %end
            else
                %if u(2, 1) < u(3, 1)
                    u(2, 1) = sgn(u(2, 1)) * (u_avg - T/2);
                    u(3, 1) = sgn(u(3, 1)) * (u_avg + T/2);
                %end
            end
            
            block = uint8(u * s * transpose(v));
            
            for ii = 1:block_size
                for jj=1:block_size
                    newhost((i-1)*block_size + ii, (j-1)*block_size + jj, k) = block(ii, jj);
                end
            end
            
        end
    end
end
hprime = newhost;
end

