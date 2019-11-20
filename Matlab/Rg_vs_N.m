global L eps psize KS
L = 5; % Size of the Domain
psize = 0.5; % Particle size, assume the same
eps = 1; % coefficient in Lennard-Jones potential
KS = 300; % Spring strength

N = 6; %Number of Particles
F = 0; % Force applied to two ends
beta = [0.1 0.5 1 2 5 10]; % 1/kT

Rg2 = zeros(6,5);

for j = 1:6
    for i = 1:5
        disp(beta(j));
        X = mc(N,F,beta(j));
        Rg2(j, i) = gyration(N,X);
    end
end

plot(beta', mean(Rg2,2),'o');