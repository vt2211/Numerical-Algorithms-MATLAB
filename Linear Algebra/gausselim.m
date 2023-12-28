function x=gausselim(A,b)
%GAUSSELIM  Gaussian Elimination with Partial Pivoting
%   X = GAUSSELIM(A,B)

n = size(A,1);

% Elimination
for i = 1:n-1
    % Find largest pivot and interchange rows
    [foo,p] = max(abs(A(i:n,i)));
    p = p+i-1;
    A([i,p],:) = A([p,i],:);
    b([i,p]) = b([p,i]);
    
    % Eliminate below pivot
    for j = i+1:n
        m = A(j,i) / A(i,i);
        for k = i:n
            A(j,k) = A(j,k) - m*A(i,k);
        end
        b(j) = b(j) - m*b(i);
    end
end

% Back substitution
x = b;
for i = n:-1:1
    for j = i+1:n
        x(i) = x(i) - A(i,j)*x(j);
    end
    x(i) = x(i) / A(i,i);
end