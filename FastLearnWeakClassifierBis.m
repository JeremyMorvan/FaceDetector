function [t1,t2] = FastLearnWeakClassifierBis(zc,mu,var1,var2)

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

end

