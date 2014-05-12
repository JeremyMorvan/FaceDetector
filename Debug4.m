clear all;
close all;
clc;
global scs SanityCheck eps rho;
SanityCheck = 0;
eps = 1e-6;
scs = 0;
rho = 0.8; 
%%
%%%%%%%Scan Image Fixed Size

load('Cparams');
imName = 'TestImages/one_chris.png';
if SanityCheck
    imName = 'TrainingImages/FACES/face00001.bmp';
end
im = double(imread(imName));
dets = ScanImageFixedSize(Cparams, im);
DisplayDetections(imName,PruneDetections(dets));

%%
%%%%%%%Scan Image Over Scale

load('CparamsBasic');
imName = 'TestImages/big_many_faces.jpg';
if SanityCheck
    imName = 'TrainingImages/FACES/face00001.bmp';
end
im = double(imread(imName));
dets = ScanImageOverScale(Cparams, im,0.6,1.3,0.06);
DisplayDetections(imName,dets);
figure;
DisplayDetections(imName,PruneDetections(dets));