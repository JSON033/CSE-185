function feature = multiscale_sobel_feature(img, scale)
    
    feature = [];
    
     for i = 1:scale
         %compute sobel feature
         [magnitude, orientation] = sobel_feature(img);
          feature = cat(1, feature, magnitude(:));
%         feature = cat(1, feature, orientation(:));
         
          img = imresize(img, 1/2);
         
     end
    
    
    
    
end


