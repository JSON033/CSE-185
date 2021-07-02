 %high frequenbcy low frequency pass
 function [low_pass_img, high_pass_img] = separate_frequency(img, ratio)
 

 %      apply FFT
 frequency_map = fft2(img);
 
%  figure, imshow( log(abs(frequency_map) + 1), []);
 
 % shift the frequency map
 frequency_map_shifted = fftshift(frequency_map);



%     compute low-frequency mask
mask = zeros(size(img));
[height, width,~] = size(img);

%now getting the low pass frequency box origin

lowh =  floor(height/2);
loww =  floor(width/2);

%to get the size f the box we will divide by 2 so we can add it to the
%origin

lowh2 = floor((ratio .* height)/2);
loww2 = floor((ratio .* width)/2);

y1 = lowh - lowh2;
y2 = lowh + lowh2;
x1 = loww - loww2;
x2 = loww + loww2;



mask(y1 : y2, x1 : x2, :) = 1;

%     separate low-frequency and high-frequency maps
low_frequency_map_shifted =  frequency_map_shifted .* mask;

high_frequency_map_shifted =  frequency_map_shifted .* (1 - mask);
%     shift frequency maps back


low_frequency_map = ifftshift(low_frequency_map_shifted);

high_frequency_map =  ifftshift(high_frequency_map_shifted);



% apply Inverse FFT
low_pass_img = real(ifft2(low_frequency_map));
high_pass_img = real(ifft2(high_frequency_map));





 end