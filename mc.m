%% Matlab code for the Particle Python Code
% Biophysics, Professor Jasna Brujic
% Kaizhe Wang

%% ===== Initialization ============================
% General parameter
global N L eps;
N = 7; % Number of Particles
L = 10; % Size of the Domain
eps = 10; % coefficient in Lennard-Jones potential
beta = 1; % 1/kT
step_length = 0.1; % MC step moving scale
nsteps = 3000; 

% Generate randomly distributed particles
% D_range = [1, 1]; % Diameter of each particle, range
% X = rand(N,2).*L; % Position of particles
% D = rand(N,1).*(D_range(2)-D_range(1)) + D_range(1); % Size of particles

% Generate a chain
LB = randi([0,1],N,1); % put a label (A, B, etc.) to each particle.
D_range = [1, 1];
D = rand(N,1).*(D_range(2)-D_range(1)) + D_range(1);
K = 1*ones(N-1,1); % Spring constant between neighboring particles.
% X = gausschain(D);
X = straightchain(D);
% plot(X(:,1), X(:,2))
% axis([0 L 0 L]);

% MC initialize
energy = zeros(nsteps+1,1);
energy(1) = potential(X,D,K);

%% MC Loop
for k = 1:nsteps
    if mod(k,1)==0
        disp(k);
    end
    u_init = energy(k);
    dx = step_length.*randn(1,2);
    ind = randi(N);
    X(ind, :) = X(ind, :) + dx;
    u_final = potential(X,D,K);
    du = u_final - u_init;
    if exp(-beta*du) > rand
        X(ind,:) = mod(X(ind, :), L);
        energy(k+1) = u_final;
    else
        X(ind,:) = X(ind, :) - dx;
        energy(k+1) = u_init;
    end
    
%     Plot
    plot(X(:,1), X(:,2),'-o');
    axis([0 L 0 L]);
    drawnow;
    
end

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