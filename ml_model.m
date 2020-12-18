## Copyright (C) 2020 Tijana Prodanovic

clear ; close all; clc
%% Initialization
#SVM model without kernel (linear) used classify Cover Type
#Gaussian kernel is also used on elevation feature to Classify Cover Type
#For data points where model predicts more than one Cover type  with SVM, Gaussian is then applied

load data_train2use.dat Dtrain
load data_test2use.dat Dtest
%load data_validate2use.dat Dvalidate

D=Dtrain;
n=size(D,1);
m=size(D,2);

X = D(:,(1:m-7));

% Make 7 models for each Cover type separately
y1 = D(:,m-6);
y2 = D(:,m-5);
y3 = D(:,m-4);
y4 = D(:,m-3);
y5 = D(:,m-2);
y6 = D(:,m-1);
y7 = D(:,m);

fprintf('\nTraining Linear SVM (Cover Type Classification)\n')
fprintf('(this might take some time) ...\n')

C = 0.5;

fprintf('\n(Modeling Cover Type 1)\n')
model1 = svmTrain(X, y1, C, @linearKernel);
p1 = svmPredict(model1, X);
fprintf('Training Accuracy: %f\n', mean(double(p1 == y1)) * 100);

fprintf('\n(Modeling Cover Type 2)\n')
model2 = svmTrain(X, y2, C, @linearKernel);
p2 = svmPredict(model2, X);
fprintf('Training Accuracy: %f\n', mean(double(p2 == y2)) * 100);

fprintf('\n(Modeling Cover Type 3)\n')
model3 = svmTrain(X, y3, C, @linearKernel);
p3 = svmPredict(model3, X);
fprintf('Training Accuracy: %f\n', mean(double(p3 == y3)) * 100);

fprintf('\n(Modeling Cover Type 4)\n')
model4 = svmTrain(X, y4, C, @linearKernel);
p4 = svmPredict(model4, X);
fprintf('Training Accuracy: %f\n', mean(double(p4 == y4)) * 100);

fprintf('\n(Modeling Cover Type 5)\n')
model5 = svmTrain(X, y5, C, @linearKernel);
p5 = svmPredict(model5, X);
fprintf('Training Accuracy: %f\n', mean(double(p5 == y5)) * 100);

fprintf('\n(Modeling Cover Type 6)\n')
model6 = svmTrain(X, y6, C, @linearKernel);
p6 = svmPredict(model6, X);
fprintf('Training Accuracy: %f\n', mean(double(p6 == y6)) * 100);

fprintf('\n(Modeling Cover Type 7)\n')
model7 = svmTrain(X, y7, C, @linearKernel);
p7 = svmPredict(model7, X);
fprintf('Training Accuracy: %f\n', mean(double(p7 == y7)) * 100);


# Saving all the models and predictions

model=[model1,model2,model3,model4,model5,model6,model7];
p=[p1,p2,p3,p4,p5,p6,p7];
Dpred=[D,p];

save prediction.dat Dpred;
save model.dat model;
save model1.dat model1;
save model2.dat model2;
save model3.dat model3;
save model4.dat model4;
save model5.dat model5;
save model6.dat model6;
save model7.dat model7;

fprintf('\nAll models have been saved in file model.dat\n')

fprintf('\nChecking and correcting for double classification\n')

# Check if anything is doubly classified
[twoclass,ncount]=check_double(Dpred);

# Correcting for double classification
Dcor=correct_gaussian(Dpred,twoclass);
save data_cor.dat Dcor;

y = Dcor(:,2);  #labeled classes
svm= Dcor(:,3); # SVM predicted classes
gaus=Dcor(:,4);  # gauss predicted classes
corect=Dcor(:,5); #corrected classes

fprintf('SVM Accuracy: %f\n', mean(double(svm == y)) * 100);
fprintf('Gaussian Accuracy: %f\n', mean(double(gaus == y)) * 100);
fprintf('SVM improved Accuracy: %f\n', mean(double(corect == y)) * 100);

fscore=skewed_precission(Dcor);

%Testing model for the C parameter and other issues

Xtest = Dtest(:,(1:m-7));
y1test = Dtest(:,m-6);
y2test = Dtest(:,m-5);
y3test = Dtest(:,m-4);
y4test = Dtest(:,m-3);
y5test = Dtest(:,m-2);
y6test = Dtest(:,m-1);
y7test = Dtest(:,m);

fprintf('\nEvaluating the trained Linear SVM on a test set ...\n')

p1 = svmPredict(model1, Xtest);
fprintf('\n(Prediction with Model 1)\n')
fprintf('Test Accuracy: %f\n', mean(double(p1 == y1test)) * 100);

p2 = svmPredict(model2, Xtest);
fprintf('\n(Prediction with Model 2)\n')
fprintf('Test Accuracy: %f\n', mean(double(p2 == y2test)) * 100);

p3 = svmPredict(model3, Xtest);
fprintf('\n(Prediction with Model 3)\n')
fprintf('Test Accuracy: %f\n', mean(double(p3 == y3test)) * 100);

p4 = svmPredict(model4, Xtest);
fprintf('\n(Prediction with Model 4)\n')
fprintf('Test Accuracy: %f\n', mean(double(p4 == y4test)) * 100);

p5 = svmPredict(model5, Xtest);
fprintf('\n(Prediction with Model 5)\n')
fprintf('Test Accuracy: %f\n', mean(double(p5 == y5test)) * 100);

p6 = svmPredict(model6, Xtest);
fprintf('\n(Prediction with Model 6)\n')
fprintf('Test Accuracy: %f\n', mean(double(p6 == y6test)) * 100);

p7 = svmPredict(model7, Xtest);
fprintf('\n(Prediction with Model 7)\n')
fprintf('Test Accuracy: %f\n', mean(double(p7 == y7test)) * 100);

fprintf('\nChecking and correcting for double classification\n')

p=[p1,p2,p3,p4,p5,p6,p7];
Dtestpred=[Dtest,p];

# Check if anything is doubly classified
[twoclass,ncount]=check_double(Dtestpred);

Dtestcor=correct_gaussian(Dtestpred,twoclass);

ytest = Dtestcor(:,2);  #labeled classes
svmtest= Dtestcor(:,3); # SVM predicted classes
gaustest=Dtestcor(:,4);  # gauss predicted classes
corecttest=Dtestcor(:,5); #corrected classes

fprintf('SVM Accuracy: %f\n', mean(double(svmtest == ytest)) * 100);
fprintf('Gaussian Accuracy: %f\n', mean(double(gaustest == ytest)) * 100);
fprintf('SVM improved Accuracy: %f\n', mean(double(corecttest == ytest)) * 100);









