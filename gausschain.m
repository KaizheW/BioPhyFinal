function X = gausschain(D)
global N L
X = zeros(N,2);
X(1,:) = [L/2, L/2];
theta = 0;
for i=2:N
    theta = theta + pi*rand - pi/2;
    X(i,:) = X(i-1,:) + (D(i)+ D(i-1))/2.*[cos(theta) sin(theta)];
end
