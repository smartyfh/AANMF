function [Q] = l_updateQ(Z, pinvAA, mu, lambda2)
Q = pinvAA * (Z' + lambda2' / mu);
end