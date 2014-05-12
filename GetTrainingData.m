function GetTrainingData(all_ftypes,np,nn)

DirNameF = 'TrainingImages/FACES/';
DirNameNF = 'TrainingImages/NFACES/';

im_sfnF = 'FaceData.mat';
im_sfnNF = 'NonFaceData.mat';

f_sfn = 'FeaturesToUse.mat';

LoadSaveImData(DirNameF, np, im_sfnF);
LoadSaveImData(DirNameNF, nn, im_sfnNF);
ComputeSaveFData(all_ftypes, f_sfn);


end

