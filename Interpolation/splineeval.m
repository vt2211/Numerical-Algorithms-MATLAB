function yy = splineeval(x, a, b, c, d, xx)
% Evaluate the spline function y(x) represented by the coefficients
% x,a,b,c,d at each point in xx (see Burden & Faires for details)

n = length(x)-1; % Number of spline segments
yy = 0*xx;       % Output vector

for i = 1:n
    % Find points in this segment
    ix = xx >= x(i) & xx <= x(i+1); 
    
    % Evaluate polynomial
    yy(ix) = a(i) + ...
             b(i)*(xx(ix)-x(i)) + ...
             c(i)*(xx(ix)-x(i)).^2 + ...
             d(i)*(xx(ix)-x(i)).^3;
end