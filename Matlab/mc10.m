%% Matlab code for the Particle Python Code
% Biophysics, Professor Jasna Brujic
% Kaizhe Wang

%% Funciton MC
% function [ft, fe] = mc(N,F,beta)

% ===== Initialization ============================
% General parameter
global L psize KS eps;
N = 10; % Number of Particles
L = 5; % Size of the Domain
psize = 0.5; % Particle size, assume the same
eps = 1; % coefficient in Lennard-Jones potential
KS = 100; % Spring strength
F = 0; % Force applied to two ends
beta1 = 5; % 1/kT, high temperature
beta2 = 20; % low temperature
step_length = 0.2*psize; % MC step moving scale
step_maxnp = 2; % number of particles that moves each step
nsteps = 10000000;
t = linspace(0, 10*pi, nsteps)';
beta = (1+square(t))/2*(beta2-beta1)+beta1;

% Generate randomly distributed particles
% D_range = [1, 1]; % Diameter of each particle, range
% X = rand(N,2).*L; % Position of particles
% D = rand(N,1).*(D_range(2)-D_range(1)) + D_range(1); % Size of particles

% Generate a chain
LB = [0;1;0;1;0;1;0;1;0;1]; % put a label (A, B, etc.) to each particle.
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
% state = zeros(1);
% statecount = 2;
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
    
%     if u_final < -10
%         ft = k;
%         energy(end) = u_final;
%         break
%     end
    
    if exp(-beta(k)*du) > rand
%         X(ind,:) = mod(X(ind, :), L);
        energy(k+1) = u_final;
    else
        X(ind,:) = X(ind, :) - dX;
        energy(k+1) = u_init;
    end
    
    
%     ===Plot===
    if mod(k,10000)==0
        plot(X(:,1), X(:,2),'-o');
        axis([-L/2 L/2 -L/2 L/2]);
        drawnow;
%         state(statecount) = state_identify(N,X);
%         statecount = statecount + 1;
    end
    
end

% ft = k;
% fe = energy(end);

figure
plot(energy)
figure
viscircles(X, D/2, 'Color','g');
hold on
viscircles(X(2,:), D(2)/2, 'Color','r');
viscircles(X(4,:), D(4)/2, 'Color','r');
viscircles(X(6,:), D(6)/2, 'Color','r');
viscircles(X(8,:), D(6)/2, 'Color','r');
viscircles(X(10,:), D(6)/2, 'Color','r');
plot(X(:,1), X(:,2),'k-')
axis equal
% close all

% state = state_identify(N,X);
