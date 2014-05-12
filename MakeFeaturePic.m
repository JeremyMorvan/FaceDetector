function fpic = MakeFeaturePic(ftype,W,H)

fpic = zeros(H,W);
x = ftype(1);
y = ftype(2);
w = ftype(3);
h = ftype(4);

switch ftype(5)
    case 1
        fpic(x:x+h-1,y:y+w-1) = ones(h,w);
        fpic(x+h:x+2*h-1,y:y+w-1) = -ones(h,w);
    case 2
        fpic(x:x+h-1,y:y+w-1) = -ones(h,w);
        fpic(x:x+h-1,y+w:y+2*w-1) = ones(h,w);
    case 3
        fpic(x:x+h-1,y:y+w-1) = -ones(h,w);
        fpic(x:x+h-1,y+w:y+2*w-1) = ones(h,w);
        fpic(x:x+h-1,y+2*w:y+3*w-1) = -ones(h,w);
    case 4
        fpic(x:x+h-1,y:y+w-1) = -ones(h,w);
        fpic(x:x+h-1,y+w:y+2*w-1) = ones(h,w);
        fpic(x+h:x+2*h-1,y:y+w-1) = ones(h,w);
        fpic(x+h:x+2*h-1,y+w:y+2*w-1) = -ones(h,w);
end


end

