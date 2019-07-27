function quality=getQuality(im,codebook,codebookVIF,blocksizerow,blocksizecol,blockrowoverlap,blockcoloverlap)
feat         = extractFeature(im,blocksizerow,blocksizecol,blockrowoverlap,blockcoloverlap);
quality      = featQuantization(feat,codebook,codebookVIF);
end