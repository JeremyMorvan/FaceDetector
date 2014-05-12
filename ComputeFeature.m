function fs = ComputeFeature( ii_ims, ftype )
%%% Warning : ftype must be computed with the image with the smallest
%%% dimensions
global im ims SanityCheck;
ni = size(ii_ims,1);
fs = zeros(1,ni);

for i=1:ni
    if SanityCheck
        im = ims{i};
    end
    fs(1,i) = Feature(ii_ims{i},ftype);
end


end

