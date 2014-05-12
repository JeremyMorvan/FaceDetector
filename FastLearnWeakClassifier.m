function [theta,p,err] = FastLearnWeakClassifier(ws,ys,zc,muc,varc1,varc2,fs,feature)


n = size(fs,1);

mu = muc*feature;

var1 = feature'*varc1*feature;
var2 = feature'*varc2*feature;

a = var2-var1;
b = mu(1)*var1-mu(2)*var2;
c = (1/2)*(-(1/2)*log(var2/var1)+log(zc(1)/zc(2))+(mu(2)^2)*var2-(mu(1)^2)*var1);

d = b^2-2*a*c;

if d<0
    theta = (mu(1)+mu(2))/2;
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

