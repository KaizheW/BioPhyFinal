function trajectory = self_avoiding_walk(N)

% step_num = 20;
% walk_num = 10;
step_num = N-1;
walk_num = N;

for walk = 1 : walk_num

    x = 0;   
    y = 0;

    trajectory = zeros ( step_num + 1, 2 );  % the origin.
    trajectory(1,1:2) = [ x, y ];

    step_length = step_num;

    for step = 1 : step_num    

        neighbors = [ x + 1.0, y; ...
                    x - 1.0, y; ...
                    x,       y + 1.0; ...
                    x,       y - 1.0 ];

        destination = setdiff ( neighbors, trajectory, 'rows' );

        [ nrows, ~ ] = size ( destination );

        if ( nrows == 0 )
            step_length = step - 1;
            break;
        end

        k = ceil ( nrows * rand ( ) );
        x = destination(k,1);
        y = destination(k,2);

        trajectory(step+1,1:2) = [ x, y ];

    end

    if ( step_length == step_num )
        break;
    end

end
% plot (trajectory(:,1), trajectory(:,2), 'r-', 'LineWidth', 2 );