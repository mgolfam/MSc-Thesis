function res = f_median( A )
%MEDIAN Summary of this function goes here
%   Detailed explanation goes here
outputPixelValue = 0;
%img = f_gray(A);
img_h = size(A, 1);
img_w = size(A, 2);
window = 0;
window_w = 3;
window_h = 3;
edgex = floor(window_w / 2);
edgey = floor(window_h / 2);
for k = 1 : size(A, 3)
    for x = 1 : (img_w)
        for y = 1 : (img_h)
            i = 1;
            for fx = 1 : window_w
               for fy = 1 : window_h
                   ii = x + fx - edgex - 1;
                   jj = y + fy - edgey - 1;
                   if ii > img_h & jj > img_w
                        window(i) = A(img_h, img_w, k);
                   elseif ii < 1 & jj < 1
                        window(i) = A(1, 1, k);
                   elseif ii<1 & jj>img_w
                        window(i) = A(1, img_w, k);
                   elseif jj<1 & ii>img_h
                        window(i) = A(img_h, 1, k);
                   elseif ii > img_h & jj <= img_w & jj >=1
                       window(i) = A(img_h, jj, k);
                   elseif jj > img_w & ii>=1 & ii<=img_h
                       window(i) = A(ii, img_w, k);
                   elseif ii < 1 & jj>=1 & jj <= img_w
                       window(i) = A(1, jj, k);
                   elseif jj < 1 & ii>=1 & ii<=img_h
                       window(i) = A(ii, 1, k);
                   else
                       window(i) = A(ii, jj, k);
                   end
                   i = i + 1;
               end
           end
           window = sort(window);
           outputPixelValue(x, y, k) = window(cutoff(window_w * window_h / 2));
        end
    end
end
res = outputPixelValue;