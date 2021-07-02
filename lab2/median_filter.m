function output = median_filter(img, patch_size)
% disp(patch_size) = 3, 3

I2 = zeros(size(img));

% making u and v the different dimensions in the patchsize
shiftu = floor(patch_size(1)/2);
shiftv = floor(patch_size(2)/2);

%to save the image boundary we made the parameters 1 + dimension to end - dimension
for u = 1+shiftu: size(img, 2)-shiftu
       for v = 1+ shiftv: size(img, 1)-shiftv
        % we set our endpoints for x and y
        x1 = u - shiftu;
        x2 = u + shiftu;
        y1 = v - shiftv;
        y2 = v + shiftv;
        
        %make a matrix with the endpoints to get our patch
        median_matrix = img(y1:y2, x1:x2);
        
        %convert matrix to vector
        median_matrix = median_matrix(:);
        
        %median amirite
        med = median(median_matrix);
          
        %set the pixel to the median value
        I2(v, u) = med;
       end
    end
output = I2;
end