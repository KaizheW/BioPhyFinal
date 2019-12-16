function state = state_identify3(N, X)

global psize
count = 0;
for i = 1:N-1
    for j = i+1:N
        dis = norm(X(i,:) - X(j,:));
        if dis < 1.5*psize
            count = count + 1;
        end
    end
end

if count == 15
    d1 = norm(X(1,:)-X(2,:)) + norm(X(1,:)-X(4,:)) + norm(X(1,:)-X(6,:));
    d3 = norm(X(3,:)-X(2,:)) + norm(X(3,:)-X(4,:)) + norm(X(3,:)-X(6,:));
    d5 = norm(X(5,:)-X(2,:)) + norm(X(5,:)-X(4,:)) + norm(X(5,:)-X(6,:));
    d7 = norm(X(7,:)-X(2,:)) + norm(X(7,:)-X(4,:)) + norm(X(7,:)-X(6,:));
    [~, minid] = min([d1 d3 d5 d7]);
    statearray = [1 2 2 1];
    state = statearray(minid);
else
    state = 0;
end

