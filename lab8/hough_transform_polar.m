function [r, theta] = hough_transform_polar(edge_map)

  % x, y from edge map
    [edge_y, edge_x] = find(edge_map);
    
%r range 
    H = size(edge_map, 1);
    W = size(edge_map, 2);
    
    r_max = round(sqrt(H^2 + W^2));
    r_min = -r_max;
    r_step = 1;
    r_range = r_min : r_step : r_max;
    
    %theta
    theta_step = 0.01;
    theta_range = -pi/2 : theta_step : pi/2;
    
   % create vote matrix
    V = zeros(length(r_range), length(theta_range));
    
   
   
    
    for i = 1:length(edge_y)
        y = edge_y(i);
        x = edge_x(i);
        for theta_index = 1:length(theta_range)
            theta = theta_range(theta_index);
            
             r = x * cos(theta) + y * sin(theta);
            if(r_min <= r && r_max >= r)
                r_index = round( (r - r_min) / r_step ) + 1;
                V(r_index, theta_index) = V(r_index, theta_index) + 1;
            end
            
        end
    end
    
    

   % visualize votes
    subplot(2,2,4);
    imagesc(V); xlabel('theta'); ylabel('r');
    
   % find the maximal vote
    max_vote = max(V(:));
    [max_r_index, max_theta_index] = find( V == max_vote );
    r = r_range(max_r_index);
    theta = theta_range(max_theta_index);

end