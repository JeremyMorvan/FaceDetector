clear all;
close all;
clc;

global eps SanityCheck mu var1 var2;
eps = 1e-6;
SanityCheck = 1;
mu = 0;
var1 = 0;
var2 = 0;

% %%
% %%%%%%%%%Simple Weak Classifier
% 
% FTData = load('FeaturesToUse.mat');
% feature = FTData.fmat(:,12026);
% 
% [theta,p,err] = TrainAndPlot(feature);
% 
% 
% %%
% %%%%%%%%Feature Pic
% 
% fpic = MakeFeaturePic([5,5,5,5,4],19,19);
% imagesc(fpic);
% colormap(gray);
% 
% %%
% %%%%%%%%%ClassifierPic
% 
% FTData = load('FeaturesToUse.mat');
% cpic = MakeClassifierPic(FTData.all_ftypes,[5192,12765],[1.8725,1.467],[1,-1],FTData.W,FTData.H);
% imagesc(cpic);
% colormap(gray);

%%
%%%%%%%%%Boosting Alg (50000)

dinfo6 = load('DebugInfo/debuginfo6.mat');
FTData = load('FeaturesToUse.mat');
NFData = load('NonFaceData.mat');
FData = load('FaceData.mat');
T = dinfo6.T;
Cparams1 = FastBoostingAlg(FData, NFData, FTData, T);
Cparams = BoostingAlg(FData, NFData, FTData, T);


% %%
% %%%%%%%%%Boosting Alg II
% 
% dinfo7 = load('DebugInfo/debuginfo7.mat');
% FTData = load('FeaturesToUse.mat');
% NFData = load('NonFaceData.mat');
% FData = load('FaceData.mat');
% T = dinfo7.T;
% Cparams = BoostingAlg(FData, NFData, FTData, T);
% b1 = sum(abs(dinfo7.alphas - Cparams.alphas))>eps
% b2 = sum(abs(dinfo7.Thetas(:) - Cparams.Thetas(:)))>eps
% save('Cparams','Cparams');
% c_pic = MakeClassifierPic(Cparams.all_ftypes,Cparams.Thetas(:,1)',Cparams.alphas',Cparams.Thetas(:,3)',FTData.W,FTData.H);
% imagesc(-c_pic);
% colormap(gray);

