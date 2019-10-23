function X = gausschain(D)
global N L
X = zeros(N,2);
X(1,:) = [L/2, L/2];
for i=2:N
    theta = 2*pi*rand;
    X(i,:) = X(i-1,:) + 1*(D(i)+ D(i-1)).*[cos(theta) sin(theta)];
end
