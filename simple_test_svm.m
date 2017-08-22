function confusionM = simple_test_svm(test_samples, test_samples_labels, train_samples, train_samples_labels)

%% Init Vars
C = 100;
sig = 20;
c1 = 0;
c2 = 1;

[temp,numFeatures] = size(train_samples);
resultsMC = newClass(train_samples, train_samples_labels, c1, c2);
vectorT = resultsMC(:,1);

for i = 2:(numFeatures+1)
    resultdata(:,i-1) = resultsMC(:,i);
end

%% Make SVM
svm = makeSVM(resultdata, vectorT, C, sig);
confusionM = zeros(2, 2);
[sizeOfTestData, temp] = size(test_samples);

%% Confusion Matrix
for i = 1:sizeOfTestData
    x = test_samples(i, :)';
    trueLabel = test_samples_labels(i, 1);
   
    if( (trueLabel == c1) || (trueLabel == c2) )
       
        predictedClass = useSVM(svm, x);

        if(predictedClass == 1)
            if(trueLabel == c1)
                confusionM(1,1) = confusionM(1,1) + 1;
            else
                confusionM(1,2) = confusionM(1,2) + 1;
            end
        else
            if(trueLabel == c2)
                confusionM(2,2) = confusionM(2,2) + 1;
            else
                confusionM(2,1) = confusionM(2,1) + 1;
            end
        end
    end
   
end
