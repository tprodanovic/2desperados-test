## Copyright (C) 2020 Tijana Prodanovic

function fscore = skewed_precission (data)
fprintf('F score for different Cover Types (want F close to 1)\n')

for i=1:7,
  truetype = find(data(:,2)==i);
  true=data(truetype,2);  #labeled classes
  predicted=data(truetype,5); #corrected classes
  tp=sum(true==predicted);   #true positives
  pp=sum(data(truetype,5));  #predicted positives
  positives=sum(data(truetype,2));
  fn=positives-tp;  #false negatives
  p=tp/pp;
  r=tp/(tp+fn);
  if (((p+r)==0) && ((p*r)==0 ))
    fscore=0;
  else
    fscore=2*p*r/(p+r);
  endif
  fprintf('Cover Type %d: F score = %d \n',i,fscore)
  tp=0;
  pp=0;
  positives=0;
  fn=0;
  p=0;
  r=0;
  fscore=0;
endfor

endfunction
