img = 'data/Army';
%img = 'data/Dumptruck';
%img = 'data/Basketball';
%img = 'data/Backyard';
img1 = im2double(imread(fullfile(img, 'frame10.png')));
img2 = im2double(imread(fullfile(img, 'frame11.png')));


% parameters
window_size = 45;
k = 4;

w = floor(window_size/2);
shift = w + 10;


%gray-scale
I1 = rgb2gray(img1);
I2 = rgb2gray(img2);

Ix_m = imfilter(I1, [1 -1;  1 -1], 'replicate');
Iy_m = imfilter(I1, [1  1; -1 -1], 'replicate');


% this is the optical flow
u = zeros(size(I1));
v = zeros(size(I1));

u_next = zeros(size(I1));
v_next = zeros(size(I1));

for t = 1:k
    for i = 1 + shift : size(Ix_m, 1) - shift
        for j = 1 + shift : size(Ix_m, 2) - shift

         % extracting  Ix, Iy, It 
            Ix = Ix_m(i - w : i + w, j - w : j + w);
            Iy = Iy_m(i - w : i + w, j - w : j + w);
            
            j2 = j + u(i, j);
            i2 = i + v(i, j);
           
            
            j2 = round(j2);
            i2 = round(i2);
           
            
            It = I1(i - w : i + w, j - w : j + w) - I2(i2 - w : i2 + w, j2 - w : j2 + w);
            
           %Ix, Iy, It

            Ix = Ix(:);
            Iy = Iy(:);
            It = It(:);
            
            A = [Ix, Iy];
            b = -It;
            
            %solve A x = b
           
            x = A \ b;
             
            u_next(i, j) = x(1);
            v_next(i, j) = x(2);

        end
    end
   %flow
    v = v + v_next;
    u = u + u_next;
   
    
end

plot_flow(img2, u, v);
h = gcf;
saveas(h, 'result3.png')