function [quality] = featQuantization(feat,codebook,codebookVIF)
% Compute quality
gamma = 0.05; % gaussian kernel
r = 5; % 5 nearest codewords
k=size(codebook,1);
distMx=dist2(feat,codebook);
[d_sorted, pos] = sort(distMx, 2);
% Gaussian kernel similarity
weights = exp(-gamma*d_sorted(:, 1:r))./repmat(sum(exp(-gamma*d_sorted(:, 1:r))')', 1, r);
WeightVIF=zeros(k,1);
for i = 1:k,
    idx = [];
    weights_temp = [];
    for j = 1:r
        pos_temp = pos(:, j);
        idx_temp = find(pos_temp == i);
        idx = [idx; idx_temp];
        weights_temp = [weights_temp; weights(idx_temp, j)];
    end
    if ~isempty(weights_temp)
        WeightVIF(i) = sum(weights_temp); % weight
    end
end

WeightVIF=WeightVIF./sum(WeightVIF);

quality=  WeightVIF'* codebookVIF;

end


