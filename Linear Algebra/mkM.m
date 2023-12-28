function M = mkM(n,m)
%MKM  Create n-by-n matrix M for vector m.

M = eye(n);
k = n - length(m);
M(k+1:n,k) = m(:);