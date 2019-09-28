%Let M = 10.  Simulate (uniform) sampling with replacement from the outcomes 0, 1, 2, 3, …, M?1. 
%Generating a histogram of the outcomes. 
%Perform a statistical goodness?of?fit test to conclude at the 95% confidence level if your data fits samples 
%from a discrete uniform distribution 0, 1, 2, …, 9 using chi square test
%Repeat (b) to see if your data (the same data from b) instead fit an alternate uniform distribution 1, 2, 3, 
%…, 10. 
%Shilpa Nanjundaiah
%7046684083
samples = 1000;
X=randi([0 9],1,samples);
datasample = 10;
expected = samples/datasample;
e_1 = expected*ones(1,10);
X1=0;
observed = histcounts(X,(0:10));
for j=1:length(e_1)-1
    x = (((observed(j))- expected).^2)/expected;
    X1 = X1+x;
end
chi_95 = chi2inv(0.95,9);
disp("Observed and Expected values for 1000 samples between 0-9:");
disp(observed);
disp(e_1);
disp("ChiSquare output for 1000 samples is "+X1);
disp("Threshold for 9th degree of freedom: "+chi_95);
if X1<chi_95
    disp("Good fit");
else
    disp("Not a good fit");
end
%........................(c).......................%
samples = 1000;
X=randi([1 10],1,samples);
datasample = 10;
expected = samples/datasample;
e_2 = expected*ones(1,10);
X2=0;
%a = unique(X);
observed = histcounts(X,(1:11));
for j=1:length(e_2)-1
    x1 = (((observed(j))- expected).^2)/expected;
    X2 = X2+x1;
end
chi10_95 = chi2inv(0.95,10);
disp("Observed and Expected values for 1000 samples between 1-10: ");
disp(observed);
disp(e_2);
disp("ChiSquare output for 1000 samples is "+X2);
disp("Threshold for 10th degree of freedom: "+chi10_95);
if X2<chi10_95
    disp("Good fit");
else
    disp("Not a good fit");
end

