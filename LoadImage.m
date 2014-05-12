function [im, ii_im] = LoadImage(im_fname)

global SanityCheck eps;

im = double(imread(im_fname));

mu = mean(im(:));
std1 = std(im(:))+realmin('double');

im = (im-mu)./std1;

ii_im = cumsum(cumsum(im,1),2);

%Sanity Check
if SanityCheck
    if abs(mean(im(:)))>eps || abs(std(im(:))-1)>eps
        error('This image is not normalized');
        
    end
    x = floor(size(im,1)/2);
    y = floor(size(im,2)/2);
    if abs(ii_im(x,y)-sum(sum(im(1:x,1:y))))>eps
        error('The integral image is not correct');
    end
end

end