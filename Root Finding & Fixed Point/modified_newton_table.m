function l = modified_newton_table(f, var, p0, niter)
%MODIFIED_NEWTON Summary of this function goes here
%   Detailed explanation goes here
df = diff(f, var);
ddf = diff(df, var);
g = var - ((f*df) / ((df)^2 - (f*ddf)));
l = fixedpoint_table(g, var, p0, niter);
end

