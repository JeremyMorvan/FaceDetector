function cpic = ShowClassifier(Cparams,H,W)

cpic = zeros(H,W);

for i=1:size(Cparams.Thetas,1)
    cpic = cpic + MakeFeaturePic(Cparams.all_ftypes(Cparams.Thetas(i,1),:),W,H)*Cparams.alphas(i,1)*Cparams.Thetas(i,3);
end

end

