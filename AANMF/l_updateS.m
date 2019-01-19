function [S] = l_updateS(U, Z, gamma, beta, alpha)
[n, ~] = size(U);
du = L2_distance_1(U', U');
dz = L2_distance_1(Z, Z);
d = - beta * dz - 0.5 * gamma * du;
d = d / (2 * alpha);

S = zeros(n , n);

for i = 1:n
    dv = d(i, :);
%     S(i, :) = EProjSimplex_new(dv);
    S(i, :) = rojSimplex(dv, i); % my own
end