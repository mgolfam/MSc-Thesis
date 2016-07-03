clear all; clc;
%%%%%%% Enter
block_size = 4;
%number of calulation blocks
no = 200;

data = 'data\\';
dir = 'imgs\\';
ext = '.jpg';
txt = '.txt';
name = 'im';
s5 = '-512';
s1 = '-1024';
img = 0;
ncu = 0;
bcounter = 1;
for bi = 1:block_size^2
    for bj = bi:block_size^2
        ncu(1, bcounter) = bi/100+bj;
        bcounter = bcounter+1;
    end
end
        
for pic = 5
    ch = char(dir, name, int2str(pic), s5, ext);
    ch = s_strappend(ch);
    txtname = char(dir, name, int2str(pic), s5, txt);
    txtname = s_strappend(txtname);
    img = imread(ch);
    for ttt = 1:no
        i = cutoff(randi(512/block_size));
        j = cutoff(randi(512/block_size));
        b = get_block(img(: ,: , 1), i, j, block_size);
        b(:, :, 2) = get_block(img(: ,: , 2), i, j, block_size);
        b(:, :, 3) = get_block(img(: ,: , 3), i, j, block_size);
        [u(:, :, 1), s(:, :, 1), v(:, :, 1)] = svd(b(:, :, 1));
        [u(:, :, 2), s(:, :, 2), v(:, :, 2)] = svd(b(:, :, 2));
        [u(:, :, 3), s(:, :, 3), v(:, :, 3)] = svd(b(:, :, 3));
        u = mat2vector(u);
        bcounter = 1;
        for bi = 1:block_size^2
            for bj = bi:block_size^2
                tempi = nc_(u(1, 1, :, bi), u(1, 1, :, bj));
                if tempi > 0 & tempi < 2
                    ncu((ttt)+1, bcounter) = tempi;
                end
                bcounter = bcounter+1;
            end
        end
        
        clear i j b u s v bi bj;
    end
    
    for j = 1 : bcounter-1
        sum = 0;
        cet = 0;
        for ttt = 2:no
            if ncu(ttt, j)>0 & ncu(ttt, j)<2
                sum = sum+ncu(ttt, j);
                cet = cet+1;
            end
        end
        ncu(no+1, j) = sum/(cet);
    end
    
    ncc(:, 1) = ncu(1, :);
    ncc(:, 2) = ncu(no+1, :);
%    %neww = 0;
%    %count=1;
%    for i = 1:size(ncc, 1)
%        if(ncc(i, 2) > .9 )&~(cutoff(ncc(i, 1)) == cutoff(100*(ncc(i, 1)-cutoff(ncc(i, 1)))))
%            neww(count, 1) = ncc(i, 1);
%            neww(count, 2) = ncc(i, 2);
%            count = count+1;
%        end
%    end
%        %%% Saving ncu on file
%    fileID = fopen(txtname,'wt');
%    fprintf(fileID,'%6s\n','NC');
%    fprintf(fileID,'%6.5f\n', ncc(:, 2));
%    fprintf(fileID,'%6s\n','NC');
%    fprintf(fileID,'%6.5f\n', neww(:, 1));
%    fclose(fileID);
end