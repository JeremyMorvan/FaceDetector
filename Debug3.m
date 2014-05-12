clear all;
close all;
clc;

global eps SafetyCheck tprThresh;
SafetyCheck = 1;
eps = 1e-6;
tprThresh=0.9;


% % %%
% % %%%%%% Apply Detector
% % 
% % [im,ii_im] = LoadImage('TrainingImages/FACES/face00001.bmp');
% % load('Cparams.mat');
% % a1 = abs(ApplyDetector(Cparams,ii_im(:)')-9.1409)>2*eps

%%
%%%%%%% ROC

load('CparamsBasic.mat');
FData = load('FaceData.mat');
NFData = load('NonFaceData.mat');
ComputeROC(Cparams,FData,NFData);