function val = objAANMF(A, U, S, Q, gamma, beta, alpha)
Ls  = diag(sum(S, 2)) - S;
ZZ = Q'*A;
val = norm(A - U*U')^2 + gamma * trace(U'*Ls*U) + beta*trace(ZZ*Ls*ZZ') + alpha*trace(S'*S);
end