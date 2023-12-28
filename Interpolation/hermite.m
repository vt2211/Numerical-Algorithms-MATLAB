function [B, P, E] = hermite(a, f, df)

%B is the divided difference matrix
% needed values on the table are on the main diagonal
%P is the original polynomial
%E is the expanded polynomial

n = length(a);

z = zeros(1, 2*n);
fz = zeros(1, 2*n);
index = 1; % for x vals

for i = 1:2:2*n
    z(i) = a(index);
    z(i+1) = a(index);
    fz(i) = f(index);
    fz(i+1) = f(index);
    index = index + 1;
end

count = 1; %for derivative substitution
m = length(z) - 1;
B = zeros(m + 1, m + 1);
B(:, 1) = fz(:);

for i = 1:m
    for j = 1:i
        if j == 1 && mod(i+1, 2) == 0
            B(i+1,j+1) = df(count);
            count = count + 1;
        else
            B(i+1,j+1) = (B(i+1,j) - B(i,j)) / (z(i+1) - z(i-j+1));
        end
    end
end

syms x;
P = B(1, 1);

for k = 2:m+1
    c = B(k, k);
    G = 1;
    for p = 1:k-1
        G = G * (x - z(p));
    end
    G = (G * c);
    P = P + G;
end

E = expand(P);


