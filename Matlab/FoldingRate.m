nsteps = 300000;
num = 10000;
beta1 = 1;
beta2 = 10;
allstate = zeros(nsteps+1, num);

parfor i = 1:num
    disp(i)
    [allstate(:,i), ~] = mc(beta1, beta2, nsteps);
end

p0 = sum(allstate==0, 2)/num;
p1 = sum(allstate==1, 2)/num;
p2 = sum(allstate==2, 2)/num;

% figure
% hold on
% plot(p0, 'k.')
% plot(p1, 'r.')
% plot(p2, 'b.')
filename = ['rc_beta_',num2str(beta1),'_',num2str(beta2),'_num_',num2str(num),'_t_',num2str(nsteps)];
save(filename,'-v7.3')