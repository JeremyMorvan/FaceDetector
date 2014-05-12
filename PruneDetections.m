function fdets = PruneDetections(dets)

global rho;
nd = size(dets,1);
D = eye(nd);

for i=1:nd
    for j=i+1:nd
        a = rectint(dets(i,:),dets(j,:));
        resp = ((a/(dets(i,3)*dets(i,4)+dets(j,3)*dets(j,4)-a))>rho);
        D(i,j) = resp;
        D(j,i) = resp;
    end
end

[s,C] = graphconncomp(sparse(D));
fdets = zeros(s,4);
for i=1:s
    fdets(i,:) = mean(dets(C==i,:),1);
end

end

