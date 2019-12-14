nsteps = 100000;
num = 2;
beta1 = 5;
beta2 = 5;
allstate = zeros(nsteps+1, num);

parfor i = 1:num
    disp(i)
    [allstate(:,i), ~] = mc3(beta1, beta2, nsteps);
end

p0 = sum(allstate==0, 2)/num;
p1 = sum(allstate==1, 2)/num;
p2 = sum(allstate==2, 2)/num;

parfor i = 1:num
    disp(i)
    [allstate(:,i), ~] = mc3(beta1, beta2, nsteps);
end

p0 = sum(allstate==0, 2)/num + p0;
p1 = sum(allstate==1, 2)/num + p1;
p2 = sum(allstate==2, 2)/num + p2;

parfor i = 1:num
    disp(i)
    [allstate(:,i), ~] = mc3(beta1, beta2, nsteps);
end

p0 = sum(allstate==0, 2)/num + p0;
p1 = sum(allstate==1, 2)/num + p1;
p2 = sum(allstate==2, 2)/num + p2;

parfor i = 1:num
    disp(i)
    [allstate(:,i), ~] = mc3(beta1, beta2, nsteps);
end

p0 = sum(allstate==0, 2)/num + p0;
p1 = sum(allstate==1, 2)/num + p1;
p2 = sum(allstate==2, 2)/num + p2;

parfor i = 1:num
    disp(i)
    [allstate(:,i), ~] = mc3(beta1, beta2, nsteps);
end

p0 = sum(allstate==0, 2)/num + p0;
p1 = sum(allstate==1, 2)/num + p1;
p2 = sum(allstate==2, 2)/num + p2;

parfor i = 1:num
    disp(i)
    [allstate(:,i), ~] = mc3(beta1, beta2, nsteps);
end

p0 = sum(allstate==0, 2)/num + p0;
p1 = sum(allstate==1, 2)/num + p1;
p2 = sum(allstate==2, 2)/num + p2;

parfor i = 1:num
    disp(i)
    [allstate(:,i), ~] = mc3(beta1, beta2, nsteps);
end

p0 = sum(allstate==0, 2)/num + p0;
p1 = sum(allstate==1, 2)/num + p1;
p2 = sum(allstate==2, 2)/num + p2;

parfor i = 1:num
    disp(i)
    [allstate(:,i), ~] = mc3(beta1, beta2, nsteps);
end

p0 = sum(allstate==0, 2)/num + p0;
p1 = sum(allstate==1, 2)/num + p1;
p2 = sum(allstate==2, 2)/num + p2;

parfor i = 1:num
    disp(i)
    [allstate(:,i), ~] = mc3(beta1, beta2, nsteps);
end

p0 = sum(allstate==0, 2)/num + p0;
p1 = sum(allstate==1, 2)/num + p1;
p2 = sum(allstate==2, 2)/num + p2;

parfor i = 1:num
    disp(i)
    [allstate(:,i), ~] = mc3(beta1, beta2, nsteps);
end

p0 = (sum(allstate==0, 2)/num + p0)/10;
p1 = (sum(allstate==1, 2)/num + p1)/10;
p2 = (sum(allstate==2, 2)/num + p2)/10;

% figure
% hold on
% plot(p0, 'k.')
% plot(p1, 'r.')
% plot(p2, 'b.')
clearvars allstate
filename = ['s3_beta_',num2str(beta1),'_',num2str(beta2)];
save(filename)