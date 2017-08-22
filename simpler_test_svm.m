function finish = simpler_test_svm()

%% Init Simple Test Data
v1 = [-1 1; 1 2; 1 2; 3 1; 2 2; 1 3; -2 0; -1 -1; 0 -2; -3 -1; -2 -2; -1 -3];
vectorT = [1;1;1;1;1;1;-1;-1;-1;-1;-1;-1];

svm = makeSVM(v1, vectorT, 12, 10);

finish = zeros(11);

for i = -5:5
    for j = -5:5
        finish(i+6,j+6) = useSVM(svm, [i;j]);
    end
end
