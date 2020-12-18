## Copyright (C) 2020 Tijana Prodanovic

# Loading and preparing data to use in ML model

#A = csvread('data.csv');   # Original data fila
#save dataraw.dat A

load dataraw.dat A
n=size(A,1);
m=size(A,2);
disp("Total number of available data points:"), disp(n)
p_train=input ("Enter fraction for TRAINING set (0 to 1):");
p_test=input ("Enter fraction for TESTING set (0 to 1):");
p_val=input ("Enter fraction for VALIDATING set (0 to 1):");

r = randperm(n);
trainn=round(p_train*n);
testn=round(p_test*n);
valn=round(p_val*n);

Atrain = A(r(1:trainn),:);
Atest = A(r((trainn+1):(trainn+1+testn)),:);
Aval = A(r((trainn+1+testn+1):(trainn+1+testn+1+valn)),:);

save data_train.dat Atrain
save data_test.dat Atest
save data_validate.dat Aval

disp("Preparing data sets for use in ML...")

Aall=[Atrain;Atest;Aval];
n_train=size(Atrain,1);
n_test=size(Atest,1);
n_val=size(Aval,1);
n_all=size(Aall,1);

# Find minimal and maximal elevation to scale Elevation parameter (-1,1)
max_el=max(Aall(:,1));
min_el=min(Aall(:,1));

for i=1:n_all,
  D(i,1)=(2*Aall(i,1)-max_el-min_el)/(max_el-min_el);  #use elevation and rescale it
  for k=15:m-1,
      D(i,k-13)=Aall(i,k);
  endfor
endfor
apend=zeros(n_all,7);
for j=1:7,
  check=Aall(:,m)==j;
  apend(:,j)=apend(:,j).+check;
endfor  

Dall=[D,apend];
Dtrain=Dall(1:n_train,:);
Dtest=Dall(n_train+1:n_train+1+n_test,:);
Dval=Dall(n_test+1+n_test:n_all,:);

disp("Data sets saved and ready to use in ML.")

save data2use.dat Dall
save data_train2use.dat Dtrain
save data_test2use.dat Dtest
save data_validate2use.dat Dval