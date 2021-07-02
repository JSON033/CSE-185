% horizontal sobel filter

img = im2double(imread('lena.jpg'));

Hy = [1, 2, 1; 0, 0, 0; -1, -2, -1]; 

img_sobely = sobel_filter(img, Hy);

figure,  imshow (img_sobely);

imwrite ( img_sobely, 'sobel_y.jpg');

%vertical sobel filter
%translated the Hy matrix for the vertical edge detection
Hx = [-1 ,0 ,1; -2, 0 ,2;-1, 0, 1];

img_sobelx = sobel_filter(img, Hx);

figure,  imshow (img_sobelx);

imwrite ( img_sobelx, 'sobel_x.jpg');

%Breaking 2d to 1d
sobel_cr = sobelcr(img);
figure,  imshow (sobel_cr);
imwrite ( sobel_cr, 'sobel_cr.jpg');

sobel_rc= sobelrc(img);
figure,  imshow (sobel_rc);
imwrite ( sobel_rc, 'sobel_rc.jpg');

%gaussian

hsize = 5;
sigma = 2;

img_gaussian = gaussian_filter(img, hsize, sigma);
figure, imshow(img_gaussian);
imwrite(img_gaussian, 'gaussian_5.jpg');

hsize = 9;
sigma = 4;

img_gaussian = gaussian_filter(img, hsize, sigma);
figure, imshow(img_gaussian);
imwrite(img_gaussian, 'gaussian_9.jpg');











% 
function output2 = sobelcr(img)
    
    
    Hx1 = [1,1,1;0,0,0;-1 ,-1 ,-1];
    Hx2 = [1, 2,1];
    
    [row,col] = size(img);
    
    I2  = zeros (row + 2, col + 2);
    I2(1+1:row+1, 1+1:col+1) = img;
    
    output = zeros(row +2, col+2);
    output2 = zeros(row , col);
   

    
     for u = 1 : row
        for v = 1 : col
   output(u,v:v+2) = sum(Hx1 .* I2(u:u+2,v:v+2), 1);
    
   output2(u,v) = sum(Hx2 .* output(u,v:v+2));

        end 
     end
end

% rc sobel

function output2 = sobelrc(img)
    
    
    Hy1 = [1, 2 ,1; 1, 2 ,1; 1, 2 ,1];
    Hy2 = [1, 0 ,-1];
    
 
    [row,col] = size(img);
    
     I2  = zeros (row + 2, col + 2);
    I2(1+1:row+1, 1+1:col+1) = img;
    
    output = zeros(row +2, col+2);
    output2 = zeros(row , col);
    
     for u = 1: col 
        for v = 1: row 
        output(u:u+2,v) = sum(Hy1 .* I2(u:u+2,v:v+2), 2);
    


   output2(u,v) = sum(Hy2' .* output(u:u+2,v));
   
        end 
     end
end
