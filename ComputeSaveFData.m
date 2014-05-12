function ComputeSaveFData(all_ftypes,f_sfn)

global W H

fmat = sparse(VecAllFeatures(all_ftypes,W,H));

save(f_sfn,'fmat','all_ftypes','W','H');

end

