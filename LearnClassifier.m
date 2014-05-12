clear all;
close all;
clc;

global W H SanityCheck tprThresh eps;

SanityCheck = 0;
eps = 1e-6;
W = 19;
H = 19;
T = 100;
TrainVsTest = 0.7;
tprThresh = 0.9;

all_ftypes = EnumAllFeatures(W,H);
DirNameF = 'TrainingImages/FACES/';
DirNameNF = 'TrainingImages/NFACES/';
np = floor(TrainVsTest*length(dir(DirNameF)));
nn = floor(TrainVsTest*length(dir(DirNameNF)));
GetTrainingData(all_ftypes,np,nn);

FData = load('FaceData.mat');
NFData = load('NonFaceData.mat');
FTData = load('FeaturesToUse.mat');

Cparams = FastBoostingAlg(FData,NFData,FTData,T);

ComputeROC(Cparams,FData,NFData);