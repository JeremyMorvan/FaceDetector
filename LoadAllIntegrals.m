function ii_ims = LoadAllIntegrals(DirName)

global SanityCheck;

face_fnames = dir([DirName,'/*.bmp']);
n = size(face_fnames,1);
for i=1:n
    [im,ii_im] = LoadImage([DirName,face_fnames(i).name]);
    if i==1
        H = size(im,1);
        W = size(im,2);
        ii_ims = zeros(n,W*H);
    end
    if SanityCheck
        if W ~= size(im,2) || H ~= size(im,1)
            error('Those images do not have the same dimensions');
        end
    end
    ii_ims(i,:) = ii_im(:)';
end

end

