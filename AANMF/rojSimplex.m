function [x] = rojSimplex(u, ix)

v = u;
v(ix) = [];

[v] = sort(v,'descend');

n = length(v);

totalsum = sum(v);

id = 0;

for i = n:-1:1
    if i * v(i) - (totalsum - 1) > 0
        id = i;
        break;
    else
        totalsum = totalsum - v(i);
    end
end

if id == 0
    theta = max(v);
else
    theta = (totalsum - 1) / id;
end

x = max(u - theta, 0);
x(ix) = 0;

end