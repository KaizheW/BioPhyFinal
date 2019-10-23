function f = allforce(X,D)
global N L eps
f = zeros(N*(N-1)/2, 5);
count = 1;
for i = 1:N-1
    for j = i+1:N
        dx = X(i,1) - X(j,1);
        if abs(dx) > L/2
            dx = dx - L;
        end
        dy = X(i,2) - X(j,2);
        if abs(dy) > L/2
            dy = dy - L;
        end
        dis = sqrt(dx^2 + dy^2);
        sig = 0.5*(D(i)+D(j))/1.122;
        f(count,1) = i;
        f(count,2) = j;
        f(count,3) = 48*eps*((sig/dis)^12-(sig/dis)^6/2)*dx/dis^2;
        f(count,4) = 48*eps*((sig/dis)^12-(sig/dis)^6/2)*dy/dis^2;
        f(count,5) = sqrt((f(count,3))^2 + (f(count,4))^2);
        count = count + 1;
    end
end