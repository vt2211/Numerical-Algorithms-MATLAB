% UCB Math 128A
% Demo - LU Factorization without Pivoting

% Create matrix A
A = [2,1,1,0; 4,3,3,1; 8,7,9,5; 6,7,9,8]

P = eye(4);   % No pivoting
if true      % Set to true for pivoting
    row_permute = [3,4,2,1];  % Row changes needed for partial pivoting
    P = P(row_permute,:);
end
PA = P*A;

M1 = mkM(4, -PA(2:4,1)/PA(1,1))
M1PA = M1*PA

M2 = mkM(4, -M1PA(3:4,2)/M1PA(2,2))
M2M1PA = M2*M1PA

M3 = mkM(4, -M2M1PA(4,3)/M2M1PA(3,3))
M3M2M1PA = M3*M2M1PA

U = M3*M2*M1*PA

[M1, inv(M1)]
[M2, inv(M2)]
[M3, inv(M3)]

L = inv(M1)*inv(M2)*inv(M3)

L*U
P*A