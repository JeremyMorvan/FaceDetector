function A = ComputeBoxSum(ii_im,x,y,w,h)

global im SanityCheck eps;

A = ii_im(x+h-1,y+w-1);
if x>1
    A = A - ii_im(x-1,y+w-1);
    if y>1
        A = A + ii_im(x-1,y-1);
    end    
end
if y>1
    A = A - ii_im(x+h-1,y-1);
end

%SanityCheck
if SanityCheck && 0
    if abs(A-sum(sum(im(x:x+h-1,y:y+w-1))))>eps
        A
        sum(sum(im(x:x+h-1,y:y+w-1)))
        error('The Box Sum is Wrong');   
    end
end
    
end

