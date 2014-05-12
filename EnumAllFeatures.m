function all_ftypes = EnumAllFeatures(W,H)

all_ftypes = zeros(20*W^2*H^2,5);

global SanityCheck;
i = 1;
%Feature 1
for w = 1:W
    for h = 1:floor(H/2)
        for x = 1:H-2*h+1
            for y = 1:W-w+1
                if SanityCheck && (x+h-1>H || y+w-1>W)
                    error('exceed dimensions');
                end
                all_ftypes(i,:) = [x y w h 1];
                i=i+1;
            end
        end
    end
end

%Feature 2
for w = 1:floor(W/2)
    for h = 1:H
        for x = 1:H-h+1
            for y = 1:W-2*w+1
                if SanityCheck && (x+h-1>H || y+w-1>W)
                    error('exceed dimensions');
                end
                all_ftypes(i,:) = [x y w h 2];
                i=i+1;
            end
        end
    end
end

%Feature 3 
for w = 1:floor(W/3)
    for h = 1:H
        for x = 1:H-h+1
            for y = 1:W-3*w+1
                if SanityCheck && (x+h-1>H || y+w-1>W)
                    error('exceed dimensions');
                end
                all_ftypes(i,:) = [x y w h 3];
                i=i+1;
            end
        end
    end
end

%Feature 4
for w = 1:floor(W/2)
    for h = 1:floor(H/2)
        for x = 1:H-2*h+1
            for y = 1:W-2*w+1
                if SanityCheck && (x+h-1>H || y+w-1>W)
                    error('exceed dimensions');
                end
                all_ftypes(i,:) = [x y w h 4];
                i=i+1;
            end
        end
    end
end


all_ftypes = all_ftypes(1:i-1,:);

end

