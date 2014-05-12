function f = Feature(ii_im,x,y,w,h,type)

global im SanityCheck eps;

if nargin == 2
    type = x(5);
    h = x(4);
    w = x(3);
    y = x(2);
    x = x(1);
end

switch type
    case 1
        f = ComputeBoxSum(ii_im,x,y,w,h)-ComputeBoxSum(ii_im,x+h,y,w,h);
        
        if SanityCheck
            if abs(f-(sum(sum(im(x:x+h-1,y:y+w-1)))-sum(sum(im(x+h:x+2*h-1,y:y+w-1)))))>eps
                error('Feature I is wrong');                
            end
        end
    case 2
        f = ComputeBoxSum(ii_im,x,y+w,w,h)-ComputeBoxSum(ii_im,x,y,w,h);
        
        if SanityCheck
            if abs(f-(sum(sum(im(x:x+h-1,y+w:y+2*w-1)))-sum(sum(im(x:x+h-1,y:y+w-1)))))>eps
                error('Feature II is wrong');                
            end
        end
    case 3
        f = ComputeBoxSum(ii_im,x,y+w,w,h)-ComputeBoxSum(ii_im,x,y,w,h)-ComputeBoxSum(ii_im,x,y+2*w,w,h);
        
        if SanityCheck
            if abs(f-(sum(sum(im(x:x+h-1,y+w:y+2*w-1)))-sum(sum(im(x:x+h-1,y:y+w-1)))-sum(sum(im(x:x+h-1,y+2*w:y+3*w-1)))))>eps
                error('Feature III is wrong');                
            end
        end
    case 4
        f = ComputeBoxSum(ii_im,x,y+w,w,h)-ComputeBoxSum(ii_im,x,y,w,h)-ComputeBoxSum(ii_im,x+h,y+w,w,h)+ComputeBoxSum(ii_im,x+h,y,w,h);
        
        if SanityCheck
            if abs(f-(sum(sum(im(x:x+h-1,y+w:y+2*w-1)))-sum(sum(im(x:x+h-1,y:y+w-1)))-sum(sum(im(x+h:x+2*h-1,y+w:y+2*w-1)))+sum(sum(im(x+h:x+2*h-1,y:y+w-1)))))>eps
                error('Feature IV is wrong');                
            end
        end
end

end

