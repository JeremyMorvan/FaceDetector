function LoadSaveImData(DirName, ni, im_sfn)

global W H SanityCheck ii_im im;

face_fnames = dir([DirName,'/*.bmp']);
aa = 1:length(face_fnames);
a = randperm(length(aa));
fnums = aa(a(1:ni));

for i=1:ni
    im_fname=[DirName,face_fnames(fnums(i)).name];
    [im,ii_im] = LoadImage(im_fname);
    if i==1
        W = size(im,2);
        H = size(im,1);
        ii_ims = zeros(ni,W*H);
    end
    if SanityCheck
        if W ~= size(im,2) || H ~= size(im,1)
            error('Those images do not have the same dimensions');
        end
    end
    ii_ims(i,:) = ii_im(:)';
end

save(im_sfn,'DirName','fnums','ii_ims');

end

