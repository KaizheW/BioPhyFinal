%% Plot the hist of Force distribution
nbins = 1000; % hist plot number of bins
fig = figure('Position', [0 0 500 500]);
ax = axes('Parent', fig);
plot(X(:,1), X(:,2),'o');
axis([0 L 0 L]);
% leg = legend('show');
% set(leg, 'FontSize',24,'Position',[0.23 0.62 0.18 0.25]);
% set(ax,'FontSize',24);
% xlim(ax,[-0.02 0.06]);
% ylim(ax,[0 0.2]);
% xlabel({'Angular velocity'});
% ylabel({'Probability distribution'});
% title({'\Delta H=3cm, probability distribution of angular velocity'});
f = allforce(X,D);
[bincounts, binedges, binindex] = histcounts(f(:,5),...
    nbins, 'Normalization','probability');
semilogy((binedges(1:end-1)+binedges(2:end))./2, bincounts,'o');