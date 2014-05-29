function [theta,p,err] = TrainAndPlot(feature)

NFData = load('NonFaceData.mat');
FData = load('FaceData.mat');

nn = size(NFData.ii_ims,1);
nf = size(FData.ii_ims,1);
FsF = VecComputeFeature(FData.ii_ims, feature);
FsNF = VecComputeFeature(NFData.ii_ims, feature);
fs = [FsNF;FsF];
ys = [zeros(nn,1);ones(nf,1)];
ws = [(1/(2*nn)).*ones(nn,1);(1/(2*nf)).*ones(nf,1)];

Yn = histfit(FsNF,nn);
set(Yn(2),'color','g');
delete(Yn(1));
hold on;
Yf = histfit(FsF,nf);
delete(Yf(1));

[theta,p,err] = LearnWeakClassifier(ws,fs,ys);

plot([theta theta],ylim,'-');

[theta,p,err] = LearnWeakClassifierBefore(ws,fs,ys);

plot([theta theta],ylim,'-');


end

