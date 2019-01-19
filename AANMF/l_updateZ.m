function [newZ] = l_updateZ(A, Z, S, Q, beta, lambda2, mu)
TS = (S' + S) / 2;
LS = diag(sum(TS, 2)) - TS;
In = eye(size(S, 1));
ZZ = Z';

X = 4 * beta * LS + mu * In;
Y = lambda2' - mu * A * Q;

opts.record = 0;
opts.mxitr  = 1000;
opts.xtol = 1e-5;
opts.gtol = 1e-5;
opts.ftol = 1e-8;
tic;
[newZZ, ~]= OptStiefelGBB(ZZ, @funZ, opts, X, Y);
newZ = newZZ';
tsolve = toc;

    function [F, G] = funZ(ZZ, X, Y)
        F = 0.5 * trace(ZZ' * X * ZZ) + trace(Y' * ZZ);
        G = X * ZZ + Y;
    end
end
