global L eps psize KS
L = 5; % Size of the Domain
psize = 0.5; % Particle size, assume the same
eps = 1; % coefficient in Lennard-Jones potential
KS = 300; % Spring strength

N = 6; %Number of Particles
F = 0; % Force applied to two ends
beta = 1000; % 1/kT

repeats = 100;
foldingtime = zeros(repeats, 1);
finalenergy = zeros(repeats, 1);

for i = 1:repeats
    disp(i);
    [foldingtime(i), finalenergy(i)] = mc(N,F,beta);
end


% plot(beta', mean(Rg2,2),'o');