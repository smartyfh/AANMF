function [AccValue] = clustering_acc(label_true, label_pred)
%% labels should be column vector
label_match = bestMap(label_true, label_pred);
n = length(label_true);
sum = 0;
for i = 1:n
    if label_true(i) == label_match(i)
        sum = sum + 1;
    end
end
AccValue = sum * 1.0 / n;
