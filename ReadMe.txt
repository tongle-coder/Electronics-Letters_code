%-----------------------------------------------------------------------------------------------------------------------------%
% Copyright (c) 2019 Tongle Wang All rights reserved.
% Department of Computer Science and Technology
% East China Normal University, Shanghai, China
%
% Permission is hereby  granted, commercial use prohibited, to any person obtaining a copy
% of this software and associated documentation files (the "Software"), to deal
% in the Software with restriction, subject to the following conditions:
%
% The above copyright notice and this permission notice shall be included in all
% copies or substantial portions of the Software.
%
% The software is provided "as is", without warranty of any kind.
% References (Please cite the folowing paper if you use this code):
%
%     Saha, A.; Wu, Q.M. Jonathan, "A opinion-unaware blind quality assessment algorithm for multiply distorted images"
%     ELECTRONICS LETTERS. 
%(The  results reported in the paper were obtained by excuting this code in MATLAB2015b)
% im=imread('test.bmp');
%quality=getQuality(im,codebook,codebookVIF,blocksizerow,blocksizecol,blockrowoverlap,blockcoloverlap)

% INPUTS :
% queryImg:         The distorted query image in uint8 format (color,if available or grayscale)
% codebook:         The codebook constructed by distorted image blocks (500*30)
% codebookVIF:      The VIF value of each code word in the codebook (500*1)
%blocksizerow:      98 (constant)
%blocksizecol:      98 (constant)
%blockrowoverlap:   0 (constant)
%blockcoloverlap:   0 (constant)
% OUTPUT :
% qualityScore : The quality score of the query image
%-----------------------------------------------------------------------------------------------------------------------------%


