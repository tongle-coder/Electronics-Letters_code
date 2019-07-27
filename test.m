clc;
clear;
load codebookVIF;
load codebook;
blocksizerow    = 96;
blocksizecol    = 96;
blockrowoverlap = 0;
blockcoloverlap = 0;
im=imread('test.bmp');
quality=getQuality(im,codebook,codebookVIF,blocksizerow,blocksizecol,blockrowoverlap,blockcoloverlap)


