function [t1,t2,a1,a2] = FastLearnWeakClassifierBis(zc,ys,ws,mu,var1,var2,fs)
% function [theta,p,err] = FastLearnWeakClassifierBis(zc,ys,ws,mu,var1,var2,fs)

a = var2-var1;
b = mu(1)*var1-mu(2)*var2;
c = (1/2)*(-(1/2)*log(var2/var1)+log(zc(1)/zc(2))+(mu(2)^2)*var2-(mu(1)^2)*var1);

d = b^2-2*a*c;

if d<0
    theta = (mu(1)+mu(2))/2;
    t1 = theta;
    t2 = theta;
else
    d = sqrt(d);

    t1 = (-b+d)/a;
    t2 = (-b-d)/a;
end
% 
%     err1(1) = ws'*abs(ys-(fs<t1));
%     err1(2) = ws'*abs(ys-(fs<t2));
%     err1(3) = ws'*abs(ys-(fs>t1));
%     err1(4) = ws'*abs(ys-(fs>t2));
    
    a1 = abs(ys-(fs<t1));
    a2 = abs(ys-(fs<t2));
    
%     err1(1) = ws'*a1;
%     err1(2) = ws'*a2;
%     err1(3) = ws'*(~a1);
%     err1(4) = ws'*(~a2);
% 
%     [err,ind] = min(err1);
%     p = (-1)^floor((ind-0.1)/2);
%     theta = t1*(mod(ind,2)==1)+t2*(mod(ind,2)==0);

end

