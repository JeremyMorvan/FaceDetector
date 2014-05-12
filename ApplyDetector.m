function sc = ApplyDetector(Cparams,ii_im,mu,sigma)

if nargin < 3
    applied_filters = (Cparams.fmat(:,Cparams.Thetas(:,1))'*ii_im');
else
    applied_filters = ((Cparams.fmat(:,Cparams.Thetas(:,1))'*ii_im')./repmat(sigma',size(Cparams.Thetas,1),1))+repmat((Cparams.all_ftypes(Cparams.Thetas(:,1),5)==3).*Cparams.all_ftypes(Cparams.Thetas(:,1),3).*Cparams.all_ftypes(Cparams.Thetas(:,1),4),1,size(ii_im,1)).*repmat((mu./sigma)',size(Cparams.Thetas,1),1);    
end
sc = Cparams.alphas'*((repmat(Cparams.Thetas(:,3),1,size(ii_im,1)).*applied_filters)<repmat(Cparams.Thetas(:,3).*Cparams.Thetas(:,2),1,size(ii_im,1)));

end

