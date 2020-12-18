## Copyright (C) 2020 Tijana Prodanovic

function sim = gaussianKernel(x1, x2, sigma)
%   sim = gaussianKernel(x1, x2) returns a gaussian kernel between x1 and x2
%   and returns the value in sim
x1 = x1(:,1);
x2 = x2(:);

sim = 0;

sim=exp(-(x1.-x2).^2/(2*sigma^2));  

end
