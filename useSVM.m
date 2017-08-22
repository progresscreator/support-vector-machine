function results = useSVM(SVM, point, sigma)

a = SVM(:,1);
b = SVM(1,2);

t_vector = SVM(:,3);

sizeofdata = length(a);

numFeatures = length(point);

data = zeros(sizeofdata, numFeatures);

for i = 4:(numFeatures+3)
    data(:,i-3) = SVM(:,i);
end

sum = 0;

for i = 1:sizeofdata
    sum = sum + a(i,1)*t_vector(i,1)*GaussianKernel(data(i,:)',point,sigma);
end

sum = sum + b;

if (sum == 0)
    results = 1;
else
    results = sum / abs(sum);
end