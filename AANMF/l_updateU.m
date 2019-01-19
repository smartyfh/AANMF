function [U] = l_updateU(A, V, S, gamma, lambda1, mu)
[n, k] = size(V);
TS = (S' + S) / 2;
LS = diag(sum(TS, 2)) - TS;
RR = 2 * gamma * LS + (mu + 2) * eye(n);
P = lambda1 + mu * V + 2 * A * V;
[UU, SS, ~] = svd(RR);
R = UU * sqrt(SS);
B = R \ P;
R = R';

%% refer to the file sbb
opt=solopt;
opt.truex=0;
opt.verbose=0;

U = rand(size(V));
for i = 1:k
%      U(:, i) = lsqnonneg(R, B(:, i));
    out = bbnnls(R, B(:, i), zeros(n, 1), opt); 
    U(:, i) = out.x;
end

end