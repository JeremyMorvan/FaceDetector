close all;
clear all;
clc;
global im SanityCheck eps ims ii_im;
SanityCheck = 1;
eps = 1e-6;

%%
%%%%%%%%%Test LoadImages

im_fname = 'TrainingImages/FACES/face00001.bmp';
[im,ii_im] = LoadImage(im_fname);
dinfo1 = load('DebugInfo/debuginfo1.mat');
a1 = sum(abs(dinfo1.im(:) - im(:)) > eps)
a2 = sum(abs(dinfo1.ii_im(:) - ii_im(:)) > eps)
%montage({im,ii_im,dinfo1.im,dinfo1.ii_im},'Size',[2 2]);

%%
%%%%%%%%Test Features
im_fname = 'TrainingImages/FACES/face00001.bmp';
[im,ii_im] = LoadImage(im_fname);
dinfo2 = load('DebugInfo/debuginfo2.mat');
x = dinfo2.y; y = dinfo2.x; w = dinfo2.w; h = dinfo2.h;
b1 = abs(dinfo2.f1 - Feature(ii_im, x, y, w, h,1)) > eps
b2 = abs(dinfo2.f2 - Feature(ii_im, x, y, w, h,2)) > eps
b3 = abs(dinfo2.f3 - Feature(ii_im, x, y, w, h,3)) > eps
b4 = abs(dinfo2.f4 - Feature(ii_im, x, y, w, h,4)) > eps
%%
%%%%%%%%Test Several Features
n = 100;
DirName = 'TrainingImages/FACES';
mystr = [DirName,'/*.bmp'];
im_files = dir(mystr);
addpath(DirName);
ii_ims = cell(n,1);

if SanityCheck
    ims = cell(n,1);
end

for i=1:n
    [im,ii_im] = LoadImage(im_files(i).name);
    ii_ims{i} = ii_im;
    if SanityCheck
        ims{i} = im;
    end
end
dinfo3 = load('DebugInfo/debuginfo3.mat');
ftype = dinfo3.ftype;
ftype = [ftype(2:end),ftype(1)];
c1 = sum(abs(dinfo3.fs - ComputeFeature(ii_ims, ftype)) > eps)

%%
%%%%%%%%% Test Vectorization

DirName = 'TrainingImages/FACES/';
dinfo4 = load('DebugInfo/debuginfo4.mat');
ni = dinfo4.ni;
all_ftypes = dinfo4.all_ftypes;
all_ftypes = [all_ftypes(:,3) all_ftypes(:,2) all_ftypes(:,4:5) all_ftypes(:,1)];
im_sfn = 'FaceData.mat';
f_sfn = 'FeaturesToMat.mat';
rng(dinfo4.jseed);
LoadSaveImData(DirName, ni, im_sfn);
ComputeSaveFData(all_ftypes, f_sfn);
load(im_sfn);
load(f_sfn);
d1 = sum(sum(abs(dinfo4.fmat - fmat))) > eps
d2 = sum(sum(abs(dinfo4.ii_ims - ii_ims))) > eps

%%
%%%%%%%%% Test Training Data

dinfo5 = load('DebugInfo/debuginfo5.mat');
np = dinfo5.np;
nn = dinfo5.nn;
all_ftypes = dinfo5.all_ftypes;
all_ftypes = [all_ftypes(:,3) all_ftypes(:,2) all_ftypes(:,4:5) all_ftypes(:,1)];
rng(dinfo5.jseed);
GetTrainingData(all_ftypes, np, nn);
Fdata = load('FaceData.mat');
NFdata = load('NonFaceData.mat');
FTdata = load('FeaturesToUse.mat');







