function Cparams = FastBoostingAlg(FData,NFData,FTData,T)

betas = zeros(T,1);
thetas = zeros(T,3);
Cparams.all_ftypes = FTData.all_ftypes;
Cparams.fmat = FTData.fmat;

n = size(FData.ii_ims,1);
m = size(NFData.ii_ims,1);

w = [(1/(2*m)).*ones(m,1);(1/(2*n)).*ones(n,1)];
y = [zeros(m,1);ones(n,1)];
ii_ims = [NFData.ii_ims;FData.ii_ims];
zc = zeros(2,1);
muc = zeros(2,size(ii_ims,2));

fs = ii_ims*FTData.fmat(:,1:50000);

for t=1:T
    w = w/sum(w);
    errMin = realmax;
    zc = [sum(w(m+1:end,1));sum(w(1:m,1))];
    [varc1,muc(1,:)] = wcov(FData.ii_ims,w(m+1:end,1));
    [varc2,muc(2,:)] = wcov(NFData.ii_ims,w(1:m,1));
    for j=1:size(fs,2)
        [theta,p,err] = FastLearnWeakClassifier(w,y,zc,muc,varc1,varc2,fs(:,j),FTData.fmat(:,j));
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

