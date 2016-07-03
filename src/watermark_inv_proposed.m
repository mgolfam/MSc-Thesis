function wprime = watermark_inv_proposed( h, block_size, width, height )
%WATERMARK_INV_PROPOSED Summary of this function goes here
%   Detailed explanation goes here

Bm = height;
Bn = width*8;

watermark = 0;
for i = 1:Bm
    for j = 1:Bn
        for k = 1:3
            block = double(get_block(h(:, :, k), i, j, block_size));
            [u, s, v] = svd(block);
            
            if u(2, 1) < u(3, 1)
                watermark(i, j, k) = 1;
            else
                watermark(i, j, k) = 0;
            end
            
        end
    end
end

watermark_b(:, :, 1) = get_decimal(watermark(:, :, 1));
watermark_b(:, :, 2) = get_decimal(watermark(:, :, 2));
watermark_b(:, :, 3) = get_decimal(watermark(:, :, 3));
watermark = uint8(watermark_b);
clear watermark_b;
watermark = arnold_cat_inverse(watermark, 1);
wprime = watermark;

end

