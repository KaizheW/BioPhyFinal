function X = straightchain3(N)
global psize L
X = zeros(N,3);
for i = 1:N
    X(i,1) = i*psize - L/2;
    X(i,2) = psize * (rand - 0.5);
    X(i,3) = psize * (rand - 0.5);
end