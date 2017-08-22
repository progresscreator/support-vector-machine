function results = SVM_one_vs_all(test_samples, test_samples_labels, train_samples, train_samples_labels)

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

%%

c_1 = 0;
c_2 = [1 2 3 4 5 6 7 8 9];

mcresults = makeclass(train_samples_updated, train_samples_labels_updated, c_1, c_2);

t_vector = mcresults(:,1);

resultdata = zeros(length(t_vector), numFeatures);

for i = 2:(numFeatures+1)
    resultdata(:,i-1) = mcresults(:,i);
end

svm0 = createSVM(resultdata, t_vector, 100, 10);

%% 

c_1 = 1;
c_2 = [2 3 4 5 6 7 8 9];

mcresults = makeclass(train_samples_updated, train_samples_labels_updated, c_1, c_2);

t_vector = mcresults(:,1);

resultdata = zeros(length(t_vector), numFeatures);

for i = 2:(numFeatures+1)
    resultdata(:,i-1) = mcresults(:,i);
end

svm1 = createSVM(resultdata, t_vector, 100, 10);

%% 

c_1 = 2;
c_2 = [3 4 5 6 7 8 9];

mcresults = makeclass(train_samples_updated, train_samples_labels_updated, c_1, c_2);

t_vector = mcresults(:,1);

resultdata = zeros(length(t_vector), numFeatures);

for i = 2:(numFeatures+1)
    resultdata(:,i-1) = mcresults(:,i);
end

svm2 = createSVM(resultdata, t_vector, 100, sigma);

%%

c_1 = 3;
c_2 = [4 5 6 7 8 9];

mcresults = makeclass(train_samples_updated, train_samples_labels_updated, c_1, c_2);

t_vector = mcresults(:,1);

resultdata = zeros(length(t_vector), numFeatures);

for i = 2:(numFeatures+1)
    resultdata(:,i-1) = mcresults(:,i);
end

svm3 = createSVM(resultdata, t_vector, 100,sigma);

%% 

c_1 = 4;
c_2 = [5 6 7 8 9];

mcresults = makeclass(train_samples_updated, train_samples_labels_updated, c_1, c_2);

t_vector = mcresults(:,1);

resultdata = zeros(length(t_vector), numFeatures);

for i = 2:(numFeatures+1)
    resultdata(:,i-1) = mcresults(:,i);
end

svm4 = createSVM(resultdata, t_vector, 100,sigma);

%%

c_1 = 5;
c_2 = [6 7 8 9];

mcresults = makeclass(train_samples_updated, train_samples_labels_updated, c_1, c_2);

t_vector = mcresults(:,1);

resultdata = zeros(length(t_vector), numFeatures);

for i = 2:(numFeatures+1)
    resultdata(:,i-1) = mcresults(:,i);
end

svm5 = createSVM(resultdata, t_vector, 100,sigma);

%%

c_1 = 6;
c_2 = [7 8 9];

mcresults = makeclass(train_samples_updated, train_samples_labels_updated, c_1, c_2);

t_vector = mcresults(:,1);

resultdata = zeros(length(t_vector), numFeatures);

for i = 2:(numFeatures+1)
    resultdata(:,i-1) = mcresults(:,i);
end

svm6 = createSVM(resultdata, t_vector, 100,sigma);

%% 

c_1 = 7;
c_2 = [8 9];

mcresults = makeclass(train_samples_updated, train_samples_labels_updated, c_1, c_2);

t_vector = mcresults(:,1);

resultdata = zeros(length(t_vector), numFeatures);

for i = 2:(numFeatures+1)
    resultdata(:,i-1) = mcresults(:,i);
end

svm7 = createSVM(resultdata, t_vector, 100,sigma);

%% 

c_1 = 8;
c_2 = 9;

mcresults = makeclass(train_samples_updated, train_samples_labels_updated, c_1, c_2);

t_vector = mcresults(:,1);

resultdata = zeros(length(t_vector), numFeatures);

for i = 2:(numFeatures+1)
    resultdata(:,i-1) = mcresults(:,i);
end

svm8 = createSVM(resultdata, t_vector, 100,sigma);

%% 

[sizeofdatatest,] = size(test_samples);
confusionmatrix = zeros(10);

for i = 1:sizeofdatatest
    point = test_samples(i,:)';
    if (useSVM(svm0, point, 10) > 0)
        number = 0;
    elseif (useSVM(svm1, point, 10) > 0)
        number = 1;
    elseif (useSVM(svm2, point, 1) > 0)
        number = 2;
    elseif (useSVM(svm3, point, 1) > 0)
        number = 3;
    elseif (useSVM(svm4, point, 1) > 0)
        number = 4;
    elseif (useSVM(svm5, point, 1) > 0)
        number = 5;
    elseif (useSVM(svm6, point, 1) > 0)
        number = 6;
    elseif (useSVM(svm7, point, 1) > 0)
        number = 7;
    elseif (useSVM(svm8, point, 1) > 0)
        number = 8;
    else
        number = 9;
    end
    
    actualnumber = test_samples_labels(i,1);
    
    confusionmatrix(number+1,actualnumber+1) = 1 + confusionmatrix(number+1,actualnumber+1);
end

results = confusionmatrix;

