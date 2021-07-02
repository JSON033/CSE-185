%loading image
img1 = imread('01.jpg');

%changing green channel
img1(:,:,2) = 0;

%show image
figure, imshow(img1);

%save image 
imwrite(img1, 'green.jpg');

%setting grayscale
img2 = imread('01.jpg');
img2 = (img2(:,:,1)*0.299) + (img2(:,:,2)*0.587) + (img2(:,:,3)*0.114) ;

figure, imshow(img2);
imwrite(img2, 'gray.jpg');

%rotate 90 degrees
img3 = imread('01.jpg');
img3 = imrotate(img3,90);
figure, imshow(img3);
imwrite(img3, 'rotate.jpg');

%cropping
img4 = imread('01.jpg');
img4 = img4(30:270,100:300,:);

figure, imshow(img4)
imwrite(img4, 'crop.jpg');

%Flipping
img5 = imread('01.jpg');
img5 = flip(img5,2);
figure, imshow(img5)
imwrite(img5, 'flip.jpg');

%combining 4 images hopefully
img1 = imread('01.jpg');
img2 = imread('02.jpg');
img3 = imread('03.jpg');
img4 = imread('04.jpg');
%creating a canvas for 4 pictures
canvas = zeros(300 * 2 + 10, 400 * 2 + 10, 3, 'uint8');

canvas(1:300, 1:400,:) = img1;
canvas(1:300, 410:809,:) = img2;
canvas(310:609,1:400,:) = img3;
canvas(310:609,410:809,:) = img4;
figure, imshow(canvas)
imwrite(canvas, 'combine.jpg');



%averaging images
img6 = imread('05.jpg');
img7 = imread('06.jpg');
%using (:) to convert image to vectors
img6 = img6(:);
img7 = img7(:);
img8 = (img6 + img7) / 2;
size(img8);
img8 = reshape(img8,375, 1242,3);
figure, imshow(img8)
imwrite(img8, 'average.jpg');

    


