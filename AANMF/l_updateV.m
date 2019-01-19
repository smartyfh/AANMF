function [V] = l_updateV(A, U, lambda1 ,mu)
H = U + (2 * A * U - lambda1) / mu;
[UU, ~, VV] = svd(H, 'econ');
V = UU * VV';
end