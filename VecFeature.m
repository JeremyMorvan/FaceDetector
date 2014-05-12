function ftype_vec = VecFeature(ftype,W,H)

global SanityCheck ii_im eps

x = ftype(1);
y = ftype(2);
w = ftype(3);
h = ftype(4);

switch ftype(5)
    case 1
        ftype_vec = VecBoxSum(x,y,w,h,W,H)-VecBoxSum(x+h,y,w,h,W,H);
    case 2
        ftype_vec = VecBoxSum(x,y+w,w,h,W,H)-VecBoxSum(x,y,w,h,W,H);
    case 3
        ftype_vec = VecBoxSum(x,y+w,w,h,W,H)-VecBoxSum(x,y,w,h,W,H)-VecBoxSum(x,y+2*w,w,h,W,H);
    case 4
        ftype_vec = VecBoxSum(x,y+w,w,h,W,H)-VecBoxSum(x,y,w,h,W,H)+VecBoxSum(x+h,y,w,h,W,H)-VecBoxSum(x+h,y+w,w,h,W,H);
end

if SanityCheck
    if abs(ii_im(:)'*ftype_vec-Feature(ii_im,x,y,w,h,ftype(5)))>eps
        ii_im(:)'*ftype_vec
        Feature(ii_im,x,y,w,h,ftype(5))
        error('Wrong Vectorization of Feature');
    end
end

end

