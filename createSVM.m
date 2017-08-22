function results = createSVM(data, t_vector, c, sigma)

[sizeofdata, temp] = size(data);

Aeq = zeros(sizeofdata);

d = (squareform(pdist(data)).^2);
K = exp(-1.*(d ./ (2*sigma*sigma)));
H = (t_vector*t_vector').*K;

%H
%H2
%h3 = H2-H

for i = 1:sizeofdata
    Aeq(i,:) = t_vector';
    beq(i,1) = 0;
    f(i,1) = -1;
    ub(i,1) = c;
    lb(i,1) = 0;
end

tic

options = optimset('quadprog');
options = optimset(options, 'LargeScale', 'off');
options = optimset(options, 'MaxIter', 10000);
a_vector_with_zeros = quadprog(H,f,[],[],Aeq,beq,lb,ub,[],options);

% a_vector_with_zeros

lengthofa = length(a_vector_with_zeros);

% remove all the 0's from the a_vector
counter = 1;
for i = 1:lengthofa
    if (a_vector_with_zeros(i,1) > 0.00001)
        a_vector(counter,1) = a_vector_with_zeros(i,1);
        t_vector_updated(counter,1) = t_vector(i,1);
        data_updated(counter,:) = data(i,:);
        counter = counter + 1;
    end
end

% a_vector

lengthofa = length(a_vector);
outersum = 0;
counter = 0;

for i = 1:lengthofa
    if (a_vector(i,1) > 0.00001 && a_vector(i,1) < c)
        innersum = 0;
        for j = 1:lengthofa
            if (a_vector(j,1) > 0)
                innersum = innersum + a_vector(j,1)*t_vector_updated(j,1)*GaussianKernel(data_updated(i,:)',data_updated(j,:)',sigma);
            end
        end
        outersum = outersum + t_vector_updated(i,1) - innersum;
        counter = counter + 1;
    end
end

b = outersum / counter;

for i = 1:lengthofa
    b_vector(i,1) = b;
end

% b_vector

toc

results = [a_vector, b_vector, t_vector_updated, data_updated];


