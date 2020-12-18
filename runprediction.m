## Copyright (C) 2020 Tijana Prodanovic

# Predicting Cover Type from the input data 
fprintf('\n Input data as data_input.csv in\n')
inputdata = csvread('input_data.csv');   
save inputdataraw.dat inputdata 

n0=size(inputdata,1);
m0=size(inputdata,2);

fprintf('\n Data successfully loaded. Preparing for prediction...\n')

# preparing data_prepare

# Find minimal and maximal elevation to scale Elevation parameter (-1,1)
max_el=max(inputdata(:,1));
min_el=min(inputdata(:,1));

for i=1:n0,
  Data(i,1)=(2*inputdata(i,1)-max_el-min_el)/(max_el-min_el);  #use elevation and rescale it
  for k=15:m0,
      Data(i,k-13)=inputdata(i,k);
  endfor
endfor
 
n=size(Data,1);
m=size(Data,2);

save data2predict.dat Data 
# predicting

load model1.dat model1
load model2.dat model2
load model3.dat model3
load model4.dat model4
load model5.dat model5
load model6.dat model6
load model7.dat model7

fprintf('\n Predicting Cover Types for input data...\n')

Xtest = Data;

fprintf('\nPredicting Cover Type for Input data ...\n')

p1 = svmPredict(model1, Xtest);
p2 = svmPredict(model2, Xtest);
p3 = svmPredict(model3, Xtest);
p4 = svmPredict(model4, Xtest);
p5 = svmPredict(model5, Xtest);
p6 = svmPredict(model6, Xtest);
p7 = svmPredict(model7, Xtest);

fprintf('Prediction made with Precission of:\n');
fprintf('77%% for Cover Type 1\n');
fprintf('69%% for Cover Type 2\n');
fprintf('26%% for Cover Type 3\n');
fprintf('1%% for Cover Type 4\n');
fprintf('1%% for Cover Type 5\n');
fprintf('1%% for Cover Type 6\n');
fprintf('2%% for Cover Type 7\n');


p=[p1,p2,p3,p4,p5,p6,p7];
Dcheck=[Data,p];

# Check if anything is doubly classified
[twoclass,ncount]=check_double(Dcheck);

Dcor=gauss_predict(Dcheck,twoclass);

predicted_data=[inputdata,Dcor];
save predicted_data.dat predicted_data

fprintf('\nPrediction complete! Data saved in predicted_data.dat\n')
