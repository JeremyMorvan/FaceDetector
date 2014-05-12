function DisplayDetections(im,dets)

imshow(im);
hold on;
for i=1:size(dets,1)
    rectangle('Position',dets(i,:),'EdgeColor','r');
end


end

