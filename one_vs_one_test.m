function results = one_vs_one_test(point, svmArray, sigma)

votes = zeros(10,1);

for i = 0:8
    for j = (i+1):9
        if (useSVM(svmArray{i*10 + j}, point,sigma) > 0)
            votes(i+1,1) = votes(i+1,1) + 1;
        else
            votes(j+1,1) = votes(j+1,1) + 1;
        end
    end
end

highestvotes = 0;
predictednumber = 0;

for i = 1:10
    if (votes(i,1) > highestvotes)
        predictednumber = i-1;
        highestvotes = votes(i,1);
    end
end
        
results = predictednumber;