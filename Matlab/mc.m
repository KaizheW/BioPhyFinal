%% Matlab code for the Particle Python Code
% Biophysics, Professor Jasna Brujic
% Kaizhe Wang

%% Funciton MC
% function X = mc(N,F,beta)

% ===== Initialization ============================
% General parameter
global L psize KS eps;
N = 6; % Number of Particles
L = 5; % Size of the Domain
psize = 0.5; % Particle size, assume the same
eps = 1; % coefficient in Lennard-Jones potential
KS = 300; % Spring strength
F = 0; % Force applied to two ends
beta = 1000; % 1/kT
step_length = 0.75; % MC step moving scale
step_maxnp = 2; % number of particles that moves each step
nsteps = 1000000;

% Generate randomly distributed particles
% D_range = [1, 1]; % Diameter of each particle, range
% X = rand(N,2).*L; % Position of particles
% D = rand(N,1).*(D_range(2)-D_range(1)) + D_range(1); % Size of particles

% Generate a chain
LB = [0;1;0;0;1;0]; % put a label (A, B, etc.) to each particle.
% D_range = [0.5, 0.5];
% D = rand(N,1).*(D_range(2)-D_range(1)) + D_range(1);
D = psize * ones(N,1);
K = KS * ones(N-1,1); % Spring constant between neighboring particles.
% X = psize * self_avoiding_walk(N); % self-avoiding random walk chain.
X = straightchain(N);
% plot(X(:,1), X(:,2))
% axis([0 L 0 L]);

figure
plot(X(:,1), X(:,2),'-o');
axis([-L/2 L/2 -L/2 L/2]);

% MC initialize
energy = zeros(nsteps+1,1);
energy(1) = potential(N,X,D,K,LB);
% figure
%% MC Loop
for k = 1:nsteps
    if mod(k,10000)==0
        disp(k);
    end
    u_init = energy(k);
    
    step_np = randi(step_maxnp);
    dX = step_length.*(2.*rand(step_np,2)-repmat([1 1], step_np, 1));
    ind = randperm(N,step_np);
    X(ind, :) = X(ind, :) + dX;
    
    u_final = potential(N,X,D,K,LB);
    du = u_final - u_init;
    if exp(-beta*du) > rand
%         X(ind,:) = mod(X(ind, :), L);
        energy(k+1) = u_final;
    else
        X(ind,:) = X(ind, :) - dX;
        energy(k+1) = u_init;
    end
    
%     Plot
    if mod(k,10000)==0
        plot(X(:,1), X(:,2),'-o');
        axis([-L/2 L/2 -L/2 L/2]);
        drawnow;
    end
    
end

figure
plot(energy)
figure
viscircles(X, D/2, 'Color','k');
hold on
viscircles(X(2,:), D(2)/2, 'Color','r');
viscircles(X(5,:), D(5)/2, 'Color','r');
plot(X(:,1), X(:,2),'k-')
axis equal
% close all

%% Plot the hist of Force distribution
% nbins = 1000; % hist plot number of bins
% fig = figure('Position', [0 0 500 500]);
% ax = axes('Parent', fig);
% plot(X(:,1), X(:,2),'o');
% axis([0 L 0 L]);
% % leg = legend('show');
% % set(leg, 'FontSize',24,'Position',[0.23 0.62 0.18 0.25]);
% % set(ax,'FontSize',24);
% % xlim(ax,[-0.02 0.06]);
% % ylim(ax,[0 0.2]);
% % xlabel({'Angular velocity'});
% % ylabel({'Probability distribution'});
% % title({'\Delta H=3cm, probability distribution of angular velocity'});
% f = allforce(X,D);
% [bincounts, binedges, binindex] = histcounts(f(:,5),...
%     nbins, 'Normalization','probability');
% semilogy((binedges(1:end-1)+binedges(2:end))./2, bincounts,'o');