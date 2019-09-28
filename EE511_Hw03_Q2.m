% Name : Shilpa Nanjundaiah
%USCID: 7046684083
% EE 511 : Project #3 - Samples and Statistics
% Question 2 : Suppose that 120 cars arrive at a freeway onramp per hour on average. Simulate one hour of arrivals to the 
% freeway onramp: (1) subdivide the hour into small time intervals (< 1 second) and then (2) perform a Bernoulli 
% trial to indicate a car arrival within each small time interval. Generate a histogram for the number of arrivals 
% per hour.  Repeat the counting experiment by sampling directly from an equivalent Poisson distribution by 
% using the inverse transform method (described in class). Generate a histogram for the number of arrivals per 
% hour using this method. Overlay the theoretical p.m.f. on both histograms. Comment on the results. 
trials = 1000;
arrivals = zeros(trials,1);
lambda = 120;
N = 7200;                                       % each interval = 0.5s
p = lambda/N;                                   % approximating to Bernoulli, P[arrival] 
pmf = 0;

% Approximating the distribution to a Binomial distribution

for i = 1:trials
    u = rand(N,1);                              % generate random number 
    if u<p;                     % assign 0 if no car arrives
                                                % assign 1 if car arrives  
    arrivals(i) = sum(bernoulli_trials);        % no of car arrivals per hour
end

% Considering Poisson distribution to generate samples using Inverse
% Transform method

X=zeros(trials,1);
cum_prob = 0;                                   % variable to store cumulative probability values
for k=1:1:trials                          % generating random samples using inverse transform method
    i = 0;
    u = rand;                                   % generate uniform random number [0,1]
    p = exp(-lambda);
    cum_prob = p;
    while u >= cum_prob
        p = (lambda*p)/(i+1);
        cum_prob = cum_prob + p;
        i = i + 1;
    end
    X(k) = i;
end

x3 = 0:200;
pmf_func = poisspdf(x3,120);                    % Generating pmf using built in function poisspdf

figure();
subplot(2,1,1);
x1 = 0:20:180;
y1 = histogram(arrivals,10);
x2 = 0:200;
y2 = pmf_func;
r=(x1,y1,x2,y2);
histfit(r)
title("Histogram and Poisson pmf (Bernoulli Approximation)");
xlabel('Number of car arrivals per hour');
ylabel('Frequency / Probability');

    
subplot(2,1,2);
x1 = 0:20:180;
histfit(r);
title("Histogram and Poisson pmf (Inverse transform method)");
xlabel('Number of car arrivals per hour');
ylabel('Frequency / Probability')