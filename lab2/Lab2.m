% transtion 
I1 = imread('01.jpg');

 I2 = zeros(300, 400 + 50, 3,'uint8');
     I2(1:300,51:400+50,:) = I1;
    
for y1 = 1 : 300
    for x1 = 1 : 400
        x2 = 1;
        y2 = 1;
        I2(y2, x2, :) = I1(y1, x1, :);
    end
end

    figure, imshow(I2);
    
% forward warping

I1 = imread('01.jpg');
Rotate1 = zeros(300, 400, 3,'uint8');
% indexing through the image pixels
for y1 = 1:300
    for x1 = 1:400
        % defining origin which is center 200, 150
        x0 = 200;
        y0 = 150;
     % formula for warping the image 45 degrees, hard amirite
    x2 = (cosd(45) .* (x1 - x0)) + (sind(45) .* (y1- y0)) + x0;
    y2 = (-sind(45) .* (x1 - x0)) + (cosd(45) .* (y1 - y0)) + y0;
    
    % rounding bc we using array indicies which need to be integers
    x2 = round(x2);
    y2 = round(y2);
    % finding out if the output value is within our image frame
    if (x2 >= 1 && x2 <= 400 && y2 >= 1 && y2 <= 300)
        
        Rotate1(y2, x2,:) = I1(y1, x1,:);
        
     end
     
    end 
end
       
  

figure, imshow(Rotate1);

imwrite(Rotate1, 'rotate_0.jpg');



%Backward warp

I1 = imread('01.jpg');
Rotate2 = zeros(300, 400, 3,'uint8');

for y1 = 1:300
    for x1 = 1:400
        % defining origin which is center 200, 150
        x0 = 200;
        y0 = 150;
     % formula for warping the image 45 degrees, hard amirite
    x2 = (cosd(45) .* (x1 - x0)) - (sind(45) .* (y1- y0)) + x0;
    y2 = (sind(45) .* (x1 - x0)) + (cosd(45) .* (y1 - y0)) + y0;
   
    
    % rounding bc we using array indicies which need to be integers
    x2 = round(x2);
    y2 = round(y2);
    % finding out if the output value is within our image frame
    if (x2 >= 1 && x2 <= 400 && y2 >= 1 && y2 <= 300)
        
        Rotate2(y1, x1,:) = I1(y2, x2,:);
        
     end
     
    end 
end

figure, imshow(Rotate2)
imwrite(Rotate2, 'rotate_1.jpg');




% making a filter median

img = im2double(imread('lena_noisy.jpg'));
I2 = zeros(size(img));

% Median filter
patch_size = [3, 3];
patch_size2 = [5, 5];




img_median = median_filter(img, patch_size);
figure, imshow(img_median);
imwrite(img_median,'median_0.jpg');
img_median1 = median_filter(img, patch_size2);
figure, imshow(img_median1);
imwrite(img_median1,'median_1.jpg');
% I = medfilt2(img, patch_size);
% figure, imshow(I);
% I = medfilt2(img, patch_size2);
% figure, imshow(I);