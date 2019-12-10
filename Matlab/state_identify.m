function state = state_identify(N, X)

Na = N-2; % number of angles

a = X(2:end-1,:) - X(1:end-2,:);
b = X(3:end, :) - X(2:end-1, :);
adotb = dot(a,b,2);
% ab = sqrt(a(:,1).^2+a(:,2).^2).*sqrt(b(:,1).^2+b(:,2).^2);
acrsb = a(:,1).*b(:,2) - a(:,2).*b(:,1);

angles = atan2d(acrsb, adotb);
angleidx = round(angles/60) + 2;
poweridx = transpose(flip(0:Na-1));
idx = sum(angleidx.*5.^poweridx);

% for 7 particles
statearray = zeros(3125,1);
statearray([156 2344 2968 780]) = 1;
statearray([243 769 2881 2355]) = 2;

state = statearray(idx);