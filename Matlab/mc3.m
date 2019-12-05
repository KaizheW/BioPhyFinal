%% Matlab code for the Particle Python Code
% Biophysics, Professor Jasna Brujic
% Kaizhe Wang

%% Funciton MC
% function [ft, fe] = mc(N,F,beta)

% ===== Initialization ============================
% General parameter
global L psize KS eps;
N = 7; % Number of Particles
L = 5; % Size of the Domain
psize = 0.5; % Particle size, assume the same
eps = 1; % coefficient in Lennard-Jones potential
KS = 300; % Spring strength
F = 0; % Force applied to two ends
beta = 10; % 1/kT
step_length = 0.2*psize; % MC step moving scale
step_maxnp = 1; % number of particles that moves each step
nsteps = 1000000;

% Generate randomly distributed particles
% D_range = [1, 1]; % Diameter of each particle, range
% X = rand(N,2).*L; % Position of particles
% D = rand(N,1).*(D_range(2)-D_range(1)) + D_range(1); % Size of particles

% Generate a chain
LB = [0;1;0;1;0;1;0]; % put a label (A, B, etc.) to each particle.
% D_range = [0.5, 0.5];
% D = rand(N,1).*(D_range(2)-D_range(1)) + D_range(1);
D = psize * ones(N,1);
K = KS * ones(N-1,1); % Spring constant between neighboring particles.
% X = psize * self_avoiding_walk(N); % self-avoiding random walk chain.
X = straightchain3(N);
% plot(X(:,1), X(:,2))
% axis([0 L 0 L]);

figure
plot3(X(:,1), X(:,2), X(:,3),'-o');
axis([-L/2 L/2 -L/2 L/2 -L/2 L/2]);
xlabel('x');
ylabel('y');
zlabel('z');
grid on

% MC initialize
energy = zeros(nsteps+1,1);
energy(1) = potential3(N,X,D,K,LB);
% figure
%% MC Loop
for k = 1:nsteps
    if mod(k,10000)==0
        disp(k);
    end
    u_init = energy(k);
    
    step_np = randi(step_maxnp);
    dX = step_length.*(2.*rand(step_np,3)-repmat([1 1 1], step_np, 1));
    ind = randperm(N,step_np);
    X(ind, :) = X(ind, :) + dX;
    
    u_final = potential3(N,X,D,K,LB);
    du = u_final - u_init;
    
%     if u_final < -10
%         ft = k;
%         energy(end) = u_final;
%         break
%     end
    
    if exp(-beta*du) > rand
%         X(ind,:) = mod(X(ind, :), L);
        energy(k+1) = u_final;
    else
        X(ind,:) = X(ind, :) - dX;
        energy(k+1) = u_init;
    end
    
    
%     ===Plot===
    if mod(k,30000)==0
        plot3(X(:,1), X(:,2),X(:,3),'-o');
        axis([-L/2 L/2 -L/2 L/2 -L/2 L/2]);
        drawnow;
    end
    
end

% ft = k;
% fe = energy(end);

figure
plot(energy)
figure
hold on
[xs,ys,zs] = sphere;
surf(psize/4*xs+X(1,1), psize/4*ys+X(1,2), psize/4*zs+X(1,3), 'EdgeColor','none','FaceColor','green');
surf(psize/4*xs+X(3,1), psize/4*ys+X(3,2), psize/4*zs+X(3,3), 'EdgeColor','none','FaceColor','green');
surf(psize/4*xs+X(5,1), psize/4*ys+X(5,2), psize/4*zs+X(5,3), 'EdgeColor','none','FaceColor','green');
surf(psize/4*xs+X(7,1), psize/4*ys+X(7,2), psize/4*zs+X(7,3), 'EdgeColor','none','FaceColor','green');
surf(psize/4*xs+X(2,1), psize/4*ys+X(2,2), psize/4*zs+X(2,3), 'EdgeColor','none','FaceColor','red');
surf(psize/4*xs+X(4,1), psize/4*ys+X(4,2), psize/4*zs+X(4,3), 'EdgeColor','none','FaceColor','red');
surf(psize/4*xs+X(6,1), psize/4*ys+X(6,2), psize/4*zs+X(6,3), 'EdgeColor','none','FaceColor','red');
plot3(X(:,1), X(:,2), X(:,3),'k-')
axis equal
grid on
axis([-L/2 L/2 -L/2 L/2 -L/2 L/2]);
% close all


