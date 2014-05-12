function [tpr,fpr] = ComputeRates(scF,scNF,threshold)

tpr=sum(repmat(scF,size(threshold,1),1)>=repmat(threshold,1,size(scF,2)),2)/size(scF,2);
fpr=sum(repmat(scNF,size(threshold,1),1)>=repmat(threshold,1,size(scNF,2)),2)/size(scNF,2);

end

