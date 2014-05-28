function Cparams = FastBoostingAlgBis(FData,NFData,FTData,T,m,n)

betas = zeros(T,1);
thetas = zeros(T,3);
Cparams.all_ftypes = FTData.all_ftypes;
Cparams.fmat = FTData.fmat;

w = [(1/(2*m)).*ones(m,1);(1/(2*n)).*ones(n,1)];
y = [zeros(m,1);ones(n,1)];
ii_ims = [NFData.ii_ims(1:m,:);FData.ii_ims(1:n,:)];
muc = zeros(2,size(ii_ims,2));
fmat = FTData.fmat;
fs = ii_ims*FTData.fmat;
d = size(fs,2);
fs = fs(:,1:d);
% fsrep = [fs,-fs,fs,-fs];
% yrep = y(:,ones(1,4*d));
% T1 = zeros(1,d);
% T2 = zeros(1,d);

for t=1:T
    w = w/sum(w);
    errMin = realmax;
    zc = [sum(w(m+1:end,1));sum(w(1:m,1))];
    [varc1,muc(1,:)] = wcov(FData.ii_ims(1:n,:),w(m+1:end,1));
    [varc2,muc(2,:)] = wcov(NFData.ii_ims(1:m,:),w(1:m,1));
    mu = muc*fmat;
    varg1 = varc1*fmat;
    varg2 = varc2*fmat;
    for j=1:d
        var1 = fmat(:,j)'*varg1(:,j);
        var2 = fmat(:,j)'*varg2(:,j);
        [theta,p,err] = FastLearnWeakClassifierBis(zc,y,w,mu(:,j),var1,var2,fs(:,j));
%         T1(1,j) = t1;
%         T2(1,j) = t2;
        if err<errMin
            errMin = err;
            thetas(t,2) = theta;
            thetas(t,1) = j;
            thetas(t,3) = p;
        end
    end
%     Tmat = [T1,-T1,T2,-T2];
%     Tmatfin = Tmat(ones(1,m+n),:);    
%     errs = w'*abs(yrep-(fsrep<Tmatfin));    
%     [errMin,index] = min(errs);
%     thetas(t,1) = mod(index-1,d)+1;
%     r = (index-thetas(t,1))/d;
%     thetas(t,3) = (-1)^r;
%     thetas(t,2) = thetas(t,3)*Tmat(1,index);
    betas(t,1) = errMin/(1-errMin);
    w = w.*betas(t,1).^(1-abs(y-(thetas(t,3)*fs(:,thetas(t,1))<thetas(t,3)*thetas(t,2))));
end

Cparams.alphas = log(1./betas);
Cparams.Thetas = thetas;

end

