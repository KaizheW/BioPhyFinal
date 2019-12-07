function trajectory = self_avoiding_walk3(N)

% step_num = 20;
% walk_num = 10;
step_num = N-1;
walk_num = N;

for walk = 1 : walk_num

    x = 0;   
    y = 0;
    z = 0;

    trajectory = zeros ( N, 3 );  % the origin.
    trajectory(1,1:3) = [ x, y, z ];

    step_length = step_num;

    for step = 1 : step_num    

        neighbors = [x + 1, y, z; ...
                    x - 1, y, z; ...
                    x, y + 1, z; ...
                    x, y - 1, z; ...
                    x, y, z + 1; ...
                    x, y, z - 1];

        destination = setdiff ( neighbors, trajectory, 'rows' );

        [ nrows, ~ ] = size ( destination );

        if ( nrows == 0 )
            step_length = step - 1;
            break;
        end

        k = ceil ( nrows * rand ( ) );
        x = destination(k,1);
        y = destination(k,2);
        z = destination(k,3);

        trajectory(step+1,1:3) = [ x, y, z ];

    end

    if ( step_length == step_num )
        break;
    end

end
plot3(trajectory(:,1), trajectory(:,2), trajectory(:,3), 'r-', 'LineWidth', 2 );