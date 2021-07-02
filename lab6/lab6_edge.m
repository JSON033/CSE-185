img = im2double( imread('lena.jpg'));

[magnitude, orientation] = sobel_feature(img);

threshold = 0.3;
e = magnitude > threshold;



e1 = edge(img, 'Sobel'); % change img to sobel edge detection
e2 = edge(img, 'Canny'); % change img to canny edge detection


figure, imshow(e1); title('Sobel Edge');
imwrite(e1, 'Sobel_edge.jpg');
figure, imshow(e2); title('Canny Edge');
imwrite(e2, 'Canny_edge.jpg');