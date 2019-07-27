function [feat] = extractFeature( im,blocksizerow,blocksizecol,blockrowoverlap,blockcoloverlap)
if(size(im,3)==3)
im               = rgb2gray(im);
end
im               = double(im);                
[row col]        = size(im);
block_rownum     = floor(row/blocksizerow);
block_colnum     = floor(col/blocksizecol);

im               = im(1:block_rownum*blocksizerow,1:block_colnum*blocksizecol);                         
window           = fspecial('gaussian',3,3/4);
window           = window/sum(sum(window));
scalenum         = 3;
warning('off')

feat             = [];
lbpnum=10;

for itr_scale = 1:scalenum
% compute MSCN
mu                       = imfilter(im,window,'replicate');
mu_sq                    = mu.*mu;
sigma                    = sqrt(abs(imfilter(im.*im,window,'replicate') - mu_sq));
structdis                = (im-mu)./(sigma+0.1);
feat_lbp                 = blkproc(structdis,[blocksizerow/(2^(itr_scale-1)) blocksizecol/(2^(itr_scale-1))], ...
                           [blockrowoverlap/2^(itr_scale-1) blockcoloverlap/2^(itr_scale-1)], ...
                           @lbp_feature);
feat_lbp                 = reshape(feat_lbp,[lbpnum ....
                           size(feat_lbp,1)*size(feat_lbp,2)/lbpnum]);
feat_lbp                 = feat_lbp';

%feat is a n*30 matrix£¬n denotes the image block num£¬30 is feature dimension
feat                     = [feat,feat_lbp];
im                       = imresize(im,0.5);   
end

end

