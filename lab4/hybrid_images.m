function img_merged = hybrid_image(img1, img2, ratio)


[low1,high1] = separate_frequency(img1,ratio);
[low2,high2] = separate_frequency(img2,ratio);


img_merged = low1+high2;





end