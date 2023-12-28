function [B, P] = backwarddifferences(a, f)
% needed values on the table are on the main diagonal

n = length(a);
h = a(2) - a(1);
B = zeros(n, n);
B(:, 1) = f(:);

for j = 2:n
    for i = 1:n-j+1
        B(i, j) = B(i+1, j-1) - B(i, j-1);
    end
end

syms s;
syms x;
P = B(n, 1) + B(n-1, 2)*s;


for k = 3:n
    c = B(n-k+1, k);
    G = s;
    for m = 1:k-2
        G = G * (s + m);
    end
    G = (G * c)/(factorial(k-1));
    P = P + G;
end

step = (x - a(n))/h;
P = subs(P, s, step);

end
