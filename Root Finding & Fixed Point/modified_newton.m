function l = modified_newton(f, var, p0, tol)
%MODIFIED_NEWTON Summary of this function goes here
%   Detailed explanation goes here
df = diff(f, var);
ddf = diff(df, var);
g = var - ((f*df) / ((df)^2 - (f*ddf)));
l = fixedpoint(g, var, p0, tol);
end

