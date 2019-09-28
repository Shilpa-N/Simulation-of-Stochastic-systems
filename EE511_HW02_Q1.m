%Sampling uniform distribution and calculating the mean, variance and
%standard deviation both practically and theoretically.
%For theoretical calculation mean = b-a/2 and variance= (b-a)^2/12 is used
%Number of samples considered are 100 in the below experiment
%Finding the confidence interval
%Author: Shilpa Nanjundaiah
%7046684083
a=-3; %Cosidering the given a and b values
b=2;
No_samples=100;
samples = a + (b-a) *rand(No_samples,1);
figure();
histogram(samples); %Generating histogram plot
xlim([a,b]);
title("Uniform sampling");
xlabel("No samples");
ylabel("Amplitude")
M = (b+a)/2;  %Theoretical Mean, variance and Standard deviation
V = ((b-a)^2)/2;
SD = sqrt(V);
Mean = mean(samples); %Practical Mean, variance and Standard deviation
Var = var(samples);
sd = std(samples);
disp("Theoretical mean: "+M+" Practical mean: "+Mean);
disp("Theoretical variance: "+V+" Practical variance: "+Var);
disp("Theoretical standard deviation: "+SD+" Practical standard deviation: "+sd);
%Finding confidence interval
[CI, Means] = bootci(10000,@mean,samples);
disp("Confidence interval at 2.5% point= "+CI(1)+" ,Confidence interval at 97.5% point= "+CI(2));
figure();
histogram(Means)
title("Histogram of mean of each sample");
xlabel("Mean of samples");
ylabel("No of samples");
hold on;
plot(mean(Means),ylim*0.9,'r-');
plot(CI(1)*[1,1],ylim*0.9,'g-');
plot(CI(2)*[1,1],ylim*0.9,'g-');
[CI_std, STD] = bootci(1000,@std,samples);
disp("Confidence interval at 2.5% point= "+CI_std(1)+" ,Confidence interval at 97.5% point= "+CI_std(2));
figure();
histogram(STD)
title("Histogram of std of each sample");
xlabel("Mean of samples");
ylabel("No of samples");
hold on;
plot(std(STD),ylim*0.9,'r-');
plot(CI_std(1)*[1,1],ylim*0.9,'g-');
plot(CI_std(2)*[1,1],ylim*0.9,'g-');
