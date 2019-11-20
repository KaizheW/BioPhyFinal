end2end = zeros(46,10);
for N = 5:50
    for i = 1:100
        X = self_avoiding_walk(N);
        end2end(N-4, i) = norm(X(end,:) - X(1,:));
    end
end

loglog(5:50, mean(end2end,2), '.')
fit(log((5:50)'), log(mean(end2end,2)), 'poly1')