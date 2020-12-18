## Copyright (C) 2020 Tijana Prodanovic

function [cor_class] = correct_gaussian(data_pred,twoclass)

n=size(data_pred,1);
m=size(data_pred,2);

elevation=data_pred(:,1);
type=data_pred(:,(m-13:m-7));
pred=data_pred(:,(m-6:m));

# Creating a file corgaus that has only elevation and original and predicted class
corgaus=[elevation,type,pred];

nc=size(corgaus,1);
mc=size(corgaus,2);

X = data_pred(:,(1:m-1));
y1 = data_pred(:,m);

corgaus2=[corgaus,twoclass'];

mc2=size(corgaus2,2);
ptype=0;
type=0;

#Creating a new classification type for those with double classification
# New class will be a 2-digit number with each digit representing old class

#Creating data when now classes are returned back to values 1-7

for i=1:n,
  cor(i,1)=corgaus2(i,1);  #elevation
  for j=1:7,
    if corgaus2(i,1+j)==1
      type=j;
    endif
    if corgaus2(i,8+j)==1
      if corgaus2(i,mc2)==1   # checking for double classification
        if (ptype >= 10)
          ptype=ptype+j;
        else
          ptype=j*10;
        endif
      else
        ptype=j;
      endif
    endif
  endfor
  cor(i,2)=type;    #original class type 1-7
  cor(i,3)=ptype;   # predicted class type 1-7 with double-digit values somewhere
endfor

# Now with use Gaussian kernel prediction of class based on elevation

Elev=cor;

for i=1:7,
  type = find(Elev(:,2)==i);
  X=Elev(type,1);   #input data for Gaussian kernel for each class
  nx=size(X,1);
  meanf(i)=sum(X)/nx ; % mean evelation for each class
  var(i)=sum((X.-meanf(i)).^2)/nx;   %variance
  sigma(i)=sqrt(var(i));
  gaussmodel(i,1)=meanf(i);
  gaussmodel(i,2)=sigma(i);
endfor

save gaussmodel.dat gaussmodel

for j=1:7,
  sim=gaussianKernel(Elev,meanf(:,j),sigma(:,j));
  f(:,j)=sim;  #gaussian probability distribution nurmalized to 1
endfor
#Gaussian kernel predicts value for each class; pick one with largest f (closest to 1)

for k=1:n,
  [mf,ind]=max(f(k,:)); 
  typegaus(k)=ind;
  if ((Elev(k,3) >= 10) || (Elev(k,3)==0))
    typecor(k) = typegaus(k);  # if doubly classified, pick gauss-predicted value
  else
    typecor(k) = Elev(k,3);   # else leave SVM predicted value
  endif
endfor

cor_class=[Elev,typegaus',typecor'];
save class_prediction_compare.dat cor_class

