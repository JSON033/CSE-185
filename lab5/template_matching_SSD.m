

function match = template_matching_SSD(img, template, threshold)
shift_u = floor(size(template,2)/2);
shift_v = floor(size(template,1)/2);

for u = 1 + shift_u : size(img, 2) - shift_u
    for v = 1 + shift_v : size(img, 1) - shift_v
        x1 = u - shift_u; 
        x2 = u + shift_u;
        y1 = v - shift_u;
        y2 = v + shift_u;
        patch = img(y1:y2, x1:x2);
        % SSD
        patch = (patch - template).^ 2;
        value = sum(patch);
        value = sum(value);
        output(v, u) = value;
    end
end
match = (output < threshold);
end