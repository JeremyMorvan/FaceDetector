function dets = ScanImageFixedSize(Cparams,im)

global scs SanityCheck eps;
L = 19;

%%Image processing
if size(size(im)) > 2
    im = rgb2gray(imread(im));
end

mu = mean(im(:));
std1 = std(im(:))+realmin('double');

im = (im-mu)./std1;

ii_im = cumsum(cumsum(im,1),2);
im2 = im.*im;
ii_im2 = cumsum(cumsum(im2,1),2);


i=1;
n = (size(im,1)-L+1)*(size(im,2)-L+1);
ii_imBox = zeros(n,L*L);
mus = zeros(n,1);
sigmas = zeros(n,1);
xs = zeros(n,1);
ys = zeros(n,1);

for x=1:size(im,1)-L+1
    for y=1:size(im,2)-L+1
        xs(i,1) = x;
        ys(i,1) = y;
        ii_imBox1 = ii_im(x:x+L-1,y:y+L-1);
        ii_imBox(i,:) = ii_imBox1(:)';
        mus(i,1) = ComputeBoxSum(ii_im,x,y,L,L)/(L^2);
        sigmas(i,1) = sqrt((ComputeBoxSum(ii_im2,x,y,L,L)-L^2*mus(i,1)^2)/(L^2-1));
        i=i+1;
    end
end
scs = ApplyDetector(Cparams,ii_imBox,mus,sigmas);
faces_detected = (scs>=Cparams.thresh);
dets = [ys(faces_detected,1) xs(faces_detected,1) L*ones(sum(faces_detected),2)];

if SanityCheck
    if abs(scs(1,:)-ApplyDetector(Cparams,ii_im(:)'))>eps
        error('incorrect score !');
    end
end

end

