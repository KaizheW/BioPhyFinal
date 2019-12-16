% end2end = zeros(46,10);
% for N = 5:50
%     for i = 1:100
%         X = self_avoiding_walk(N);
%         end2end(N-4, i) = norm(X(end,:) - X(1,:));
%     end
% end
% 
% loglog(5:50, mean(end2end,2), '.')
% fit(log((5:50)'), log(mean(end2end,2)), 'poly1')


figure
hold on
[xs,ys,zs] = sphere;
surf(psize/3*xs+X(1,1), psize/3*ys+X(1,2), psize/3*zs+X(1,3), 'EdgeColor','none','FaceColor',[44/255, 160/255, 44/255]);
surf(psize/3*xs+X(3,1), psize/3*ys+X(3,2), psize/3*zs+X(3,3), 'EdgeColor','none','FaceColor',[44/255, 160/255, 44/255]);
surf(psize/3*xs+X(5,1), psize/3*ys+X(5,2), psize/3*zs+X(5,3), 'EdgeColor','none','FaceColor',[44/255, 160/255, 44/255]);
surf(psize/3*xs+X(7,1), psize/3*ys+X(7,2), psize/3*zs+X(7,3), 'EdgeColor','none','FaceColor',[44/255, 160/255, 44/255]);
surf(psize/3*xs+X(2,1), psize/3*ys+X(2,2), psize/3*zs+X(2,3), 'EdgeColor','none','FaceColor',[214/255, 39/255, 40/255]);
surf(psize/3*xs+X(4,1), psize/3*ys+X(4,2), psize/3*zs+X(4,3), 'EdgeColor','none','FaceColor',[214/255, 39/255, 40/255]);
surf(psize/3*xs+X(6,1), psize/3*ys+X(6,2), psize/3*zs+X(6,3), 'EdgeColor','none','FaceColor',[214/255, 39/255, 40/255]);
plot3(X(:,1), X(:,2), X(:,3),'k-','LineWidth',2)
axis equal
% grid on

% figure
% hold on
% [xs,ys,zs] = sphere(10);
% mesh(psize/3*xs+X(1,1), psize/3*ys+X(1,2), psize/3*zs+X(1,3), 'EdgeColor',[44/255, 160/255, 44/255],'FaceColor','none');
% mesh(psize/3*xs+X(3,1), psize/3*ys+X(3,2), psize/3*zs+X(3,3), 'EdgeColor',[44/255, 160/255, 44/255],'FaceColor','none');
% mesh(psize/3*xs+X(5,1), psize/3*ys+X(5,2), psize/3*zs+X(5,3), 'EdgeColor',[44/255, 160/255, 44/255],'FaceColor','none');
% mesh(psize/3*xs+X(7,1), psize/3*ys+X(7,2), psize/3*zs+X(7,3), 'EdgeColor',[44/255, 160/255, 44/255],'FaceColor','none');
% mesh(psize/3*xs+X(2,1), psize/3*ys+X(2,2), psize/3*zs+X(2,3), 'EdgeColor',[214/255, 39/255, 40/255],'FaceColor','none');
% mesh(psize/3*xs+X(4,1), psize/3*ys+X(4,2), psize/3*zs+X(4,3), 'EdgeColor',[214/255, 39/255, 40/255],'FaceColor','none');
% mesh(psize/3*xs+X(6,1), psize/3*ys+X(6,2), psize/3*zs+X(6,3), 'EdgeColor',[214/255, 39/255, 40/255],'FaceColor','none');
% plot3(X(:,1), X(:,2), X(:,3),'k-','LineWidth',2)
% axis equal
% grid on