function ComputeROC(Cparams,FData,NFData)

global tprThresh;

N = 1000;

TestFIms = setdiff(LoadAllIntegrals(FData.DirName),FData.ii_ims,'rows');
TestNFIms = setdiff(LoadAllIntegrals(NFData.DirName),NFData.ii_ims,'rows');

scF = ApplyDetector(Cparams,TestFIms);
scNF = ApplyDetector(Cparams,TestNFIms);

thresholds = linspace(min(min(scF),min(scNF)),max(max(scF),max(scNF)),N)';
[tpr,fpr] = ComputeRates(scF,scNF,thresholds);
plot(fpr,tpr,'r');
hold on

[dummy,index] = min(abs(tpr-tprThresh));
Cparams.thresh = thresholds(index,1);
save('Cparams','Cparams');
plot(fpr(index),tpr(index),'bo');

end

