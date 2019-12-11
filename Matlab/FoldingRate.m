nsteps = 1000000;
num = 50;
beta = 6;
allstate = zeros(nsteps+1, num);

for i = 1:num
    [allstate(:,i), ~] = mc(beta, nsteps);
end

p0 = zeros(nsteps, 1);
p1 = zeros(nsteps, 2);
p2 = zeros(nsteps, 3);
for i = 1:nsteps
    p0(i) = sum(allstate(i,:)==0)/num;
    p1(i) = sum(allstate(i,:)==1)/num;
    p2(i) = sum(allstate(i,:)==2)/num;
end

figure
hold on
plot(p0, 'k.')
plot(p1, 'r.')
plot(p2, 'b.')