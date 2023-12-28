function dyy = diffsplineeval(x, a, b, c, d, xx)
% Evaluate the derivative dy/dx of the spline represented by the coefficients
% x,a,b,c,d at each point in xx (see Burden & Faires for details)

n = length(x)-1; % Number of spline segments
dyy = 0*xx;       % Output vector

for i = 1:n
    % Find points in this segment
    ix = xx >= x(i) & xx <= x(i+1); 
    
    % Evaluate polynomial derivative
    dyy(ix) = b(i) + ...
              2*c(i)*(xx(ix)-x(i)) + ...
              3*d(i)*(xx(ix)-x(i)).^2;
end