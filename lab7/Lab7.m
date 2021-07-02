
%parameters
sigma1 = 1;
sigma2 = 2;
alpha = 0.04;
R_threshold = 1e-5 * 5;

%img = 'baboon.png';
%img = 'cameraman.png';
img = 'checkboard.png';

I = im2double(imread(img));

[corner_x, corner_y] = Harris_corner_dectector(I, sigma1, sigma2, alpha, R_threshold);

%visualize results
figure, imshow(I); hold on;
plot(corner_x, corner_y, 'ro');

h = gcf; saveas(h, "checkboardresult.jpg");