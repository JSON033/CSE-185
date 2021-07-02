

function  match= template_matching_normcorr(img, template, threshold)
    
    shift_u = floor(size(template,2)/2);
    shift_v = floor(size(template,1)/2);
    
    for u = 1 + shift_u : size(img, 2) - shift_u
    for v = 1 + shift_v : size(img, 1) - shift_v
        x1 = u - shift_u; 
        x2 = u + shift_u;
        y1 = v - shift_u;
        y2 = v + shift_u;
        patch = img(y1:y2, x1:x2);
        
        patch = patch(:);
        template = template(:);
        
        patch = patch - mean(patch);
        template = template - mean(template);
        
        patch = patch/norm(patch);
        template = template/norm(template);
        
        value = dot(patch, template);
        
        
        
        
        output(v, u) = value;
        
    end
    end
    
    match = (output > threshold);
    
    
    
    
    
    
    
    
    
    
    
end