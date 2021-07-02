function output = sobel_filter(img, kernel)
    
    output = zeros(size(img));
    [row,col] = size(img);
%     Getting parameters
    shiftu = size(kernel,1);
    shiftv = size(kernel,2);
%    setting boundaries
    for u = shiftu : col -shiftu
        for v = shiftv: row - shiftv


sobel = sum(sum(kernel.*img(v-1: v+1, u-1: u+1)));


        output(v, u)  = sobel;
        
        end
    end

end
