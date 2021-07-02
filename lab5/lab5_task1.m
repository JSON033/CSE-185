% gaussian pyramid
img = im2double(imread('lena.jpg'));
sigma = 2.0;
hsize = 7;
scale = 5;
% Gaussian Pyramid
I = img;
I1 = I;
I2 = I;
 I3 =I;
kernel = fspecial('gaussian', hsize, sigma);
for s = 1 : scale
% Gaussian filter
I1 = imfilter(I1,kernel);
% Save or show image
imwrite(I, sprintf('Gaussian_scale%d.jpg', s));

% Down-sampling
 I1 = imresize(I1,0.5);
 
% figure, imshow(I1);
end
% laplacian pyramid

for s = 1 : scale
% Gaussian filtering
I3 = imfilter(I2,kernel);
% Laplacian filtering
I4 = I2 - I3;
% Save or show image
imwrite(I4 + 0.5, sprintf('Laplacian_scale%d.jpg',s));
% Down-sampling
I2 = imresize(I2,0.5);
figure, imshow(I4 + 0.5);
end


