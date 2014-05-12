function [theta,p,err] = LearnWeakClassifier(ws,fs,ys)

n = size(fs,1);

p1 = sum(ws(ys==1));
p2 = sum(ws(ys==0));

mu1 = ws(ys==1)'*fs(ys==1)/p1;
mu2 = ws(ys==0)'*fs(ys==0)/p2;

var1 = 1/((ws(ys==1)'*(fs(ys==1)).^2)/p1-mu1^2);
var2 = 1/((ws(ys==0)'*(fs(ys==0)).^2)/p2-mu2^2);

a = var2-var1;
b = mu1*var1-mu2*var2;
c = (1/2)*(-(1/2)*log(var2/var1)+log(p1/p2)+(mu2^2)*var2-(mu1^2)*var1);

d = b^2-2*a*c;

if d<0
    theta = (mu1+mu2)/2;
    err1 = [ws'*abs(ys-(fs<theta)), ws'*abs(ys-(fs>theta))];
    [err,ind] = min(err1);
    p = (-1)^(ind-1);
else
    d = sqrt(d);

    t = zeros(1,2);
    t(1,1) = (-b+d)/a;
    t(1,2) = (-b-d)/a;

    err1(1) = ws'*abs(ys-(fs<t(1,1)));
    err1(2) = ws'*abs(ys-(fs<t(1,2)));
    err1(3) = ws'*abs(ys-(fs>t(1,1)));
    err1(4) = ws'*abs(ys-(fs>t(1,2)));

    [err,ind] = min(err1);
    p = (-1)^floor((ind-0.1)/2);
    theta = t(1,mod(ind-1,2)+1);
end




end

