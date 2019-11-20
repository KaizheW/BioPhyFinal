function Rg2 = gyration(N,X)
Rg2 = 0;
for i = 1:N
    for j = i+1:N
        Rg2 = Rg2 + norm(X(i,:)-X(j,:));
    end
end
Rg2 = Rg2/N/N;