## Copyright (C) 2020 Tijana Prodanovic

function [doubleclass,ncount] = check_double(data2check)

n=size(data2check,1);
m=size(data2check,2);

sum=0;
ncount=0;

# Checking if some data point was classified as more than 1 class
# Creating a twoclass vector that has 1 when that is true and 0 when not
# this Vector is then appended to corgaus data
for i=1:n,
  for k=1:7,
    sum=sum+data2check(i,m-7+k);
  endfor
  if (sum > 1)
    ncount=ncount+1;
    doubleclass(i)=1;
  else
    doubleclass(i)=0;
  endif
  if (sum >2)
    fprintf('Warning! Item crassified as more than 2 types ...\n')
    pause
  endif
  sum=0;
endfor

fprintf('Number of data with double classification: %f\n', ncount);

