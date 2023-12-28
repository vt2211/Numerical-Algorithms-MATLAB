function [F, P] = divideddifference(a, f)
% needed values on the table are on the main diagonal

n = length(a)-1;
F = zeros(n+1,n+1);
F(:,1) = f(:);
for i = 1:n
    for j = 1:i
        F(i+1,j+1) = (F(i+1,j) - F(i,j)) / (a(i+1) - a(i-j+1));
    end
end

syms x;
P = F(1, 1);

for k = 2:n+1
    c = F(k, k);
    G = 1;
    for m = 1:k-1
        G = G * (x - a(m));
    end
    G = G * c;
    P = P + G;
end

end
