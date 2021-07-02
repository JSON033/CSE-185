% template Sum squared difference
img = im2double(imread('einstein1.jpg'));
template = im2double(imread('template.jpg'));

%threshold value is 25 because it can identify the eyes
threshold = 25;
 match = template_matching_SSD(img, template, threshold);

figure, imshow(match);
imwrite(match,'SSD_threshold25.jpg');
% einstein 2
img = im2double(imread('einstein2.jpg'));
template = im2double(imread('template.jpg'));

%threshold is 65 because it is the point where you can identify where the
%eyes are even though there is a lot of false positives
threshold = 65;
 match = template_matching_SSD(img, template, threshold);

figure, imshow(match);
imwrite(match,'SSD_threshold65.jpg');
% normcorr

img = im2double(imread('einstein1.jpg')); 
threshold = 0.5;
 match = template_matching_normcorr(img, template, threshold);

figure, imshow(match); 
imwrite(match,'normcorr_einstein1.jpg');

img = im2double(imread('einstein2.jpg')); 
threshold = 0.5;
 match = template_matching_normcorr(img, template, threshold);

figure, imshow(match); 
imwrite(match,'normcorr_einstein2.jpg');