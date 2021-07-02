%load input image
 %im = 'lines.png';
 im = 'bridge.png';
%im = 'hill.png';
global h2;
img =  im2double(imread(im));


%extract edge map
edge_map = edge(rgb2gray(img), 'canny', 0.1, 3);



% Hough Transform (vote for m and b)
[m, b] = hough_transform(edge_map);
x = 1:size(img, 2);
y = m * x + b;

subplot(2,2,1);
h3 = imshow(img);h4 = title('(mb)'); hold on;
h1 =plot(x, y, 'LineWidth', 4, 'Color', 'red');

h = gcf;
saveas(h, sprintf('%s_mb_line.png', im));

delete(h1);delete(h3);delete (h2);delete(h4);
% Hough Transform (vote for r and theta)
[r, theta] = hough_transform_polar(edge_map);
x = 1:size(img, 2);
y = -(cos(theta)/sin(theta)) * x + (r / sin(theta));

subplot(2,2,3);
imshow(img); title(' (polar)'); hold on;
plot(x, y, 'LineWidth', 4, 'Color', 'blue');

h = gcf;
saveas(h, sprintf('%s_polar_line.png', im));