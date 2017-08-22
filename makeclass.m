% c_1 and c_2 are going to be row vectors, c_1 = 1, c_2 = -1
function results = makeclass(data, labels, c_1, c_2)

[sizeofdata, temp] = size(data);
[temp ,sizeofc1] = size(c_1);
[temp ,sizeofc2] = size(c_2);

counter = 1;

for i = 1:sizeofdata
    for j = 1:sizeofc1
        if (labels(i,1) == c_1(1,j))
            resultdata(counter, :) = data(i, :);
            t_vector(counter,1) = 1;
            counter = counter + 1;
        end
    end
    for j = 1:sizeofc2
        if (labels(i,1) == c_2(1,j))
            resultdata(counter, :) = data(i, :);
            t_vector(counter,1) = -1;
            counter = counter + 1;
        end
    end
end

results = [t_vector, resultdata];