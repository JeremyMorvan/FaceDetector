function dets = ScanImageOverScale(Cparams,im,min_s,max_s,step_s)

dets = [];

S = min_s:step_s:max_s;

for i=1:size(S)
    dets = [dets;ScanImageFixedSize(Cparams,imresize(im,S(i)))/S(i)];
end

end

