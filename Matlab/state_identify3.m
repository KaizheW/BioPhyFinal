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
    state = 1;
elseif count == 16
    state = 2;
else
    state = 0;
end