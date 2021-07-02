
% Split Frequency

 img = im2double(imread("lena.jpg"));
 
 ratio = 0.1;
 
 [low_pass_img, high_pass_img] = separate_frequency(img, ratio);
 
 figure, imshow(low_pass_img);
figure, imshow(high_pass_img + 0.5);
 imwrite(low_pass_img, 'lena_low_pass_0.1.jpg');
 imwrite(high_pass_img + 0.5, 'lena_high_pass_0.1.jpg');
 
 ratio = 0.2;
 
 [low_pass_img, high_pass_img] = separate_frequency(img, ratio);
 
 figure, imshow(low_pass_img);
figure, imshow(high_pass_img + 0.5);
 imwrite(low_pass_img, 'lena_low_pass_0.2.jpg');
 imwrite(high_pass_img + 0.5, 'lena_high_pass_0.2.jpg');
 
 
%  Hybrid images

name1 = 'marilyn.jpg'; 
name2 = 'einstein.jpg';

img1 = im2double(imread(name1));
img2 = im2double(imread(name2));


ratio = 0.2;

img_merged = hybrid_images(img1, img2, ratio);

figure, imshow(img_merged);
imwrite(img_merged, 'hybrid1.jpg');

img_merged = hybrid_images(img2, img1, ratio);

figure, imshow(img_merged);
imwrite(img_merged, 'hybrid2.jpg');

% phase image
img3 = im2double(imread('new_york.jpg'));
img4 = im2double(imread('flowers.jpg'));

frequency_map = visualization(img3);
imwrite(frequency_map, 'new_york_frequency.jpg');
frequency_map = visualization(img4);
imwrite(frequency_map, 'flowers_ frequency.jpg');
