function X = straightchain(D)
global N L
X = zeros(N,2);
for i = 1:N
    X(i,1) = i*D(i) + D(i)/2;
    X(i,2) = L/2 + (rand - 0.5) * D(i);
end