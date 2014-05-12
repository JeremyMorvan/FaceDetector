function b_vec = VecBoxSum(x,y,w,h,W,H)

global SanityCheck ii_im eps;

b_vec = zeros(H*W,1);
b_vec(x-1+h+(y+w-2)*H) = 1;
if x>1
    b_vec(x-1+(y+w-2)*H) = -1;
    if y>1
        b_vec(x-1+(y-2)*H) = 1;
    end
end
if y>1
    b_vec(x-1+h+(y-2)*H) = -1;
end


if SanityCheck
    if abs(ii_im(:)'*b_vec-ComputeBoxSum(ii_im,x,y,w,h))>eps
        error('Vectorize Box Sum is wrong');
    end
end

end

