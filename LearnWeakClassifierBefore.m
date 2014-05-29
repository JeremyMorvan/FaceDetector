function [theta,p,err] = LearnWeakClassifierBefore(ws,fs,ys)

n = size(fs,1);

p1 = sum(ws(ys==1));
p2 = sum(ws(ys==0));

mu1 = ws(ys==1)'*fs(ys==1)/p1;
mu2 = ws(ys==0)'*fs(ys==0)/p2;


theta = (mu1+mu2)/2;
err1 = [ws'*abs(ys-(fs<theta)), ws'*abs(ys-(fs>theta))];
[err,ind] = min(err1);
p = (-1)^(ind-1);



end

