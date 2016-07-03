function hprime = watermark_9( h, w)
%WATERMARK_9 Summary of this function goes here
%   Detailed explanation goes here

%host = imread('lena256.jpg');
host = h;
%watermark = imread('logo.jpg');
watermark = w;
htemp = 0;
wtemp = 0;

h_width = size(host, 2);
h_height = size(host, 1);

w_width = size(watermark, 2);
w_height = size(watermark, 1);

% Block Size
Bsize = 0;
m = w_width;
n = w_height;
flag = true;
landa = 0;
kb = 0;
N = 0;

if(w_width > h_width)
    flag = false;
    warning('the size of Watermark Image is bigger than standards');
else
    Bsize = h_width / w_width;
    N = Bsize / 2;
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
end

if flag
    
    for i = 1 : n
        for j = 1 : m
            for k = 1 : 3
                
                B = get_block(host(:, :, k), i, j, Bsize);
                [u, s, v] = svd(B);
                
                s(N, N) = watermark(i, j, k)/kb;
                
                x = N-1;
                while s(N, N) > s(x, x) & x > 1
                    s(x, x) = s(N, N);
                    x = x - 1;
                end
                
                x = N+1;
                while s(N, N) < s(x, x) & x < N
                    s(x, x) = s(N, N);
                    x = x+1;
                end
                
                B = u * s * transpose(v);
                
                % Reconstruct Temp Matrix
                for ci = 1 : Bsize
                    for cj = 1 : Bsize
                        htemp((i-1)*Bsize + ci, (j-1)*Bsize + cj, k) = B(ci, cj);
                    end
                end
                
                
            end
        end

        
        
    end
    
    
   hprime = uint8(htemp);
        
end

end

