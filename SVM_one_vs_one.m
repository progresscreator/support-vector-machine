function confusionmatrix = SVM_one_vs_one(test_samples, test_samples_labels, train_samples, train_samples_labels)

[temp,numFeatures] = size(train_samples);
sigma = 1;

train_samples_updated = zeros(200,numFeatures);
train_samples_labels_updated = zeros(200,1);
zerocounter = 0;
onecounter = 0;
twocounter = 0;
threecounter = 0;
fourcounter = 0;
fivecounter = 0;
sixcounter = 0;
sevencounter = 0;
eightcounter = 0;
ninecounter = 0;
for i = 1:size(train_samples)
    if (train_samples_labels(i,1) == 0 && zerocounter < 20)
        train_samples_updated(i,:) = train_samples(i,:);
        train_samples_labels_updated(i,:) = train_samples_labels(i,:);
        zerocounter = zerocounter + 1;
    elseif (train_samples_labels(i,1) == 1 && onecounter < 20)
        train_samples_updated(i,:) = train_samples(i,:);
        train_samples_labels_updated(i,:) = train_samples_labels(i,:);
        onecounter = onecounter + 1;
    elseif (train_samples_labels(i,1) == 2 && twocounter < 20)
        train_samples_updated(i,:) = train_samples(i,:);
        train_samples_labels_updated(i,:) = train_samples_labels(i,:);
        twocounter = twocounter + 1;
    elseif (train_samples_labels(i,1) == 3 && threecounter < 20)
        train_samples_updated(i,:) = train_samples(i,:);
        train_samples_labels_updated(i,:) = train_samples_labels(i,:);
        threecounter = threecounter + 1;
    elseif (train_samples_labels(i,1) == 4 && fourcounter < 20)
        train_samples_updated(i,:) = train_samples(i,:);
        train_samples_labels_updated(i,:) = train_samples_labels(i,:);
        fourcounter = fourcounter + 1;
    elseif (train_samples_labels(i,1) == 5 && fivecounter < 20)
        train_samples_updated(i,:) = train_samples(i,:);
        train_samples_labels_updated(i,:) = train_samples_labels(i,:);
        fivecounter = fivecounter + 1;
    elseif (train_samples_labels(i,1) == 6 && sixcounter < 20)
        train_samples_updated(i,:) = train_samples(i,:);
        train_samples_labels_updated(i,:) = train_samples_labels(i,:);
        sixcounter = sixcounter + 1;
    elseif (train_samples_labels(i,1) == 7 && sevencounter < 20)
        train_samples_updated(i,:) = train_samples(i,:);
        train_samples_labels_updated(i,:) = train_samples_labels(i,:);
        sevencounter = sevencounter + 1;
    elseif (train_samples_labels(i,1) == 8 && eightcounter < 20)
        train_samples_updated(i,:) = train_samples(i,:);
        train_samples_labels_updated(i,:) = train_samples_labels(i,:);
        eightcounter = eightcounter + 1;
    elseif (train_samples_labels(i,1) == 9 && ninecounter < 20)
        train_samples_updated(i,:) = train_samples(i,:);
        train_samples_labels_updated(i,:) = train_samples_labels(i,:);
        ninecounter = ninecounter + 1;
    end
end


for i = 0:8
    for j = (i+1):9
        
        mcresults = makeclass(train_samples_updated, train_samples_labels_updated, i, j);

        t_vector = mcresults(:,1);
        
        resultdata = zeros(length(t_vector), numFeatures);
        
        for k = 2:(numFeatures+1)
            resultdata(:,k-1) = mcresults(:,k);
        end
               
        svmArray{i*10 + j} = createSVM(resultdata, t_vector, 10, sigma);
        
    end
end


[sizeoftestdata,temp] = size(test_samples);

confusionmatrix = zeros(10);

for i = 1:sizeoftestdata
    point = test_samples(i,:)';
    predictednumber = one_vs_one_test(point, svmArray,sigma);
    actualnumber = test_samples_labels(i,1);
    
    confusionmatrix(predictednumber+1, actualnumber+1) = confusionmatrix(predictednumber+1, actualnumber+1) + 1;
end
    
