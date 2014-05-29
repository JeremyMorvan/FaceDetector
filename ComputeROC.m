function ComputeROC(Cparams,FData,NFData,m,n)

global tprThresh;

N = 1000;

TestFIms = FData.ii_ims(n+1:end,:);
TestNFIms = NFData.ii_ims(m+1:end,:);

scF = ApplyDetector(Cparams,TestFIms);
scNF = ApplyDetector(Cparams,TestNFIms);

thresholds = linspace(min(min(scF),min(scNF)),max(max(scF),max(scNF)),N)';
[tpr,fpr] = ComputeRates(scF,scNF,thresholds);
plot(fpr,tpr,'r');
hold on

% [dummy,index] = min(abs(tpr-tprThresh));
% Cparams.thresh = thresholds(index,1);
% save('Cparams','Cparams');
plot(fpr(index),tpr(index),'bo');

end

