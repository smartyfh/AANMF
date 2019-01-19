clc; clear;

%% load adjacency matrix
label = csvread('polblog-labelsTrue.csv',1,1);
A = csvread('polblog-edgesMatrix.csv', 1, 1);

%% parameter
k = 2;
gamma = 1; 
beta = 1;
alpha = 1; 
mu = 0.1;

n = size(A,1);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% optional
D = diag(sum(A, 2));
for i = 1:n
    if D(i, i) == 0
        D(i, i) = 1e-24;
    end
end  
D = D^(-0.5);
A = D * A * D;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


pinvAA = pinv((A*A)) * A;

itr = 0;
while itr < 10
    lambda1 = zeros(n, k);
    lambda2 = zeros(k, n);
    U = rand(n, k);
    %U = orth(U);
    V = U;
    Q = rand(n, k);
    Z = Q'*A;
    S = rand(n, n);
    
    i = 0;
    while i < 100
        i = i + 1;
        U = l_updateU(A, V, S, gamma, lambda1, mu);
        V = l_updateV(A, U, lambda1 ,mu);
        S = l_updateS(U, Z, gamma, beta, alpha);
        Z = l_updateZ(A, Z, S, Q, beta, lambda2, mu);
        Q = l_updateQ(Z, pinvAA, mu, lambda2);
        lambda1 = lambda1 + mu *(V - U);
        lambda2 = lambda2 + mu *(Z - Q'*A);
    end
    itr = itr + 1;
end