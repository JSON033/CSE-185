function [corner_x, corner_y] = Harris_corner_dectector(I, sigma1, sigma2, alpha, R_threshold)
    
    
    hsize1 = 1 + (2 * ceil(sigma1 * 2));
    hsize2 = 1 + (2 * ceil(sigma2 * 2));
    
    %derivatives
    %x has 1 row 3 columns and y vice versa
    Dx = [1, 0, -1];
    Dy = [1; 0; -1];
    
    
    %gaussian kernerls
    gaussiankernel1 = fspecial('gaussian', hsize1, sigma1);
    gaussiankernel2 = fspecial('gaussian', hsize2, sigma2);
    
    filter = imfilter(I,gaussiankernel1 );
    figure, imshow(filter);
    imwrite(filter, "checkboardgaussian.jpg");
    
    %computing x-gradient and y-gradient through derivative of Gaussian
    Ix = imfilter(I, Dx, 'replicate');
    Ix = imfilter(Ix, gaussiankernel1, 'replicate');
    Iy = imfilter(I, Dy, 'replicate');
    Iy = imfilter(Iy, gaussiankernel1, 'replicate');
    
    figure, imshow(Ix +0.5);
        imwrite(Ix, 'checkboardIx.jpg');
    figure, imshow(Iy +0.5);
    imwrite(Ix, 'checkboardIy.jpg');
 
    %computing products of gradients
    Ixx = Ix .* Ix;
    Iyy = Iy .* Iy;
    Ixy = Ix .* Iy;
     
    
    %Gaussian filtering to compute sum of products of gradients
    Sxx = imfilter(Ixx, gaussiankernel2);
    Syy = imfilter(Iyy, gaussiankernel2);
    Sxy = imfilter(Ixy, gaussiankernel2);
    
    
    %det(M) = ((Sxx .* Syy) - (Sxy .* Sxy)) and alpha(trace(M)^2 compute
    %corner response
     R = ((Sxx .* Syy) - (Sxy .* Sxy)) - alpha*((Sxx + Syy).^2);
     
   figure,  imagesc(R); colormap jet; colorbar; axis image; 
   saveas( imagesc(R),'checkboardcornerresponse.jpg')
    
     
     
     corner_map = R > R_threshold;
     
   figure,   imshow(corner_map);
   imwrite(corner_map, "checkboardcornermap.jpg");
     
     local_maxima = imregionalmax(R);
     
       imshow(local_maxima);
       imwrite(local_maxima,"checkboardlocalmaxima.jpg");
     final_corner_map = corner_map & local_maxima;
     
  figure,   imshow(final_corner_map);
   imwrite(final_corner_map, "checkboardfinalcornermap.jpg");
     
     [corner_y, corner_x] = find(final_corner_map);

    
    
    
end