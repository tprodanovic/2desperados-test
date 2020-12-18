function [cor_class] = gauss_predict(data_pred,twoclass)

load gaussmodel.dat gaussmodel

n=size(data_pred,1);
m=size(data_pred,2);

elevation=data_pred(:,1);
pred=data_pred(:,(m-6:m));

# Creating a file corgaus that has only elevation and original and predicted class
corgaus=[elevation,pred];

nc=size(corgaus,1);
mc=size(corgaus,2);

X = data_pred(:,(1:m));

corgaus2=[corgaus,twoclass'];

mc2=size(corgaus2,2);
type=0;
ptype=0;
#Creating a new classification type for those with double classification
# New class will be a 2-digit number with each digit representing old class

#Creating data when now classes are returned back to values 1-7

for i=1:n,
  cor(i,1)=corgaus2(i,1);  #elevation
  for j=1:7,
    if corgaus2(i,1+j)==1
      ptype=j;
      if corgaus2(i,mc2)==1   # checking for double classification
        if (ptype >= 10)
          ptype=ptype+j;
        else
          ptype=j*10;
        endif
      endif
    endif
  endfor
  cor(i,2)=ptype;   # predicted class type 1-7 with double-digit values somewhere
endfor

# Now with use Gaussian kernel prediction of class based on elevation

  meanf=gaussmodel(:,1);
  sigma=gaussmodel(:,2);
for j=1:7,
  sim=gaussianKernel(cor,meanf(j),sigma(j));
  f(:,j)=sim;  #gaussian probability distribution nurmalized to 1
endfor
#Gaussian kernel predicts value for each class; pick one with largest f (closest to 1)

for k=1:n,
  [mf,ind]=max(f(k,:)); 
  typegaus(k)=ind;
  if ((cor(k,2) >= 10) || cor(k,2)==0)
    typecor(k) = typegaus(k);  # if doubly classified, pick gauss-predicted value
  else
    typecor(k) = cor(k,2);   # else leave SVM predicted value
  endif
endfor

cor_class=typecor';

