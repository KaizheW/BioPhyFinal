function u_tot = forcepotential(N,X,D,K,F)
global eps
u_tot = 0;
for i = 1:N-1
    for j = i+1:N
        dx = X(i,1) - X(j,1);
%         if abs(dx) > L/2
%             dx = dx - L;
%         end
        dy = X(i,2) - X(j,2);
%         if abs(dy) > L/2
%             dy = dy - L;
%         end
        dis = sqrt(dx^2 + dy^2);
        sig = 0.5*(D(i)+D(j))/1.122;
        u_tot = u_tot + 4*eps*((sig/dis)^12-(sig/dis)^6);
    end
end

u_tot = u_tot + 0.5*sum(K.*(sqrt((X(2:end,1)-X(1:end-1,1)).^2 + (X(2:end,2)-X(1:end-1,2)).^2)-(D(1:end-1)+D(2:end))/2).^2);

u_tot = u_tot + F * X(1,1) - F * X(end,1);
