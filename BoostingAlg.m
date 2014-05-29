function Cparams = BoostingAlg(FData,NFData,FTData,T)

betas = zeros(T,1);
thetas = zeros(T,3);
Cparams.all_ftypes = FTData.all_ftypes;
Cparams.fmat = FTData.fmat;

n = size(FData.ii_ims,1);
m = size(NFData.ii_ims,1);

w = [(1/(2*m)).*ones(m,1);(1/(2*n)).*ones(n,1)];
y = [zeros(m,1);ones(n,1)];
fs = [NFData.ii_ims;FData.ii_ims]*FTData.fmat;

for t=1:T
    w = w/sum(w);
    errMin = realmax;
    for j=1:size(fs,2)
        [theta,p,err] = LearnWeakClassifier(w,fs(:,j),y);
        if err<errMin
            errMin = err;
            thetas(t,2) = theta;
            thetas(t,1) = j;
            thetas(t,3) = p;
        end
    end
    betas(t,1) = errMin/(1-errMin);
    w = w.*betas(t,1).^(1-abs(y-(thetas(t,3)*fs(:,thetas(t,1))<thetas(t,3)*thetas(t,2))));
end

Cparams.alphas = log(1./betas);
Cparams.Thetas = thetas;

end

