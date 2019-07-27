function [LBPHist] = lbp_feature(structdis)

%  NRSL_FEATURE - extracts quality-aware features based on image structural and luminance information. 

% inputs:
% imdist - the distorted image (grayscale image, double type, 0~255)

% outputs:
% 60-d features. 

% This is an implementation of the NR IQA algorithm in the following paper:
%  Q. Li, W. Lin, J. Xu, and Y. Fang. "Blind Image Quality Assessment Using Statistical Structural and Luminance Features," in IEEE Transactions on Multimedia
%  doi: 10.1109/TMM.2016.2601028
R = 1; P = 8;
lbp_type = { 'ri' 'u2' 'riu2' };
y = 3;
mtype = lbp_type{y};
MAPPING = getmapping( P, mtype );
LBPMap = lbp_new(structdis,R,P,MAPPING,'x');
LBPHist = hist(LBPMap(:),0:9)/numel(LBPMap);
LBPHist=LBPHist';
end

