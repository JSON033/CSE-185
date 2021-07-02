function [magnitude, orientation] = sobel_feature(img)
    
    
    %  this is the horizontal edge
    y = [1, 2, 1; 0, 0, 0; -1, -2, -1];
    
    % this is the vertical edge
    x = [1, 0, -1; 2, 0, -2; 1, 0, -1]; % vertical edge
    
    %finding the sobel features
    h = imfilter(img,y);
    %vertical and horizontal sobel from imfilter
    v = imfilter(img,x);
    
    % calulating magnitude and orientation
    magnitude = sqrt((h.^2)+(v.^2));
    orientation = atan2(h,v);
    
end