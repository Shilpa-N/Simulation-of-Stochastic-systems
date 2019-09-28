trials = 100;
sum1 = 0;
sum2 = 0;
X = zeros(trials,1);
Y = zeros(trials,1);
p = zeros(60,1);
for i = 1:60
    sum1 = sum1 + (1/i);
end
P = 1/sum1;                             % calculation of P which is sum of first 60 terms of the harmonic sequence
%disp('The value of P is ',P);
for i=1:60                                 % calculating probabilities of the 1st 60 given that p(j) = P/j, j=1,2,...60
    p(i) = P/i;
end

% To generate sequence Xk, Inverse Transform Method is used

cum_prob = 0;                                % variable to store cumulative probability values

for k=1:trials
    i = 1;
    u = rand;                                % generate uniform random number [0,1]
    prob = p(i);
    cum_prob = prob;
    while u >= cum_prob
        prob = p(i+1);
        cum_prob = cum_prob + prob;
        i = i + 1;
    end
    X(k) = i;                               
end
figure(1);
subplot(2,1,1);
histogram(X,10);
title('The histogram for sequence Xk');
xlabel('Numbers 1 to 60');
ylabel('Frequency');
hold on
% 
% % To generate random sequence Xk using Inverse Transform Method and to find minimum no of samples required
% % to obtain sample 60
Q = zeros(trials,1);
N = zeros(60,1);
for a=1:1:60
   for k=1:1:trials
       i = 1;
       u = rand;                               % generate uniform random number [0,1]
       prob = p(i);
       cum_prob = prob;
       while u >= cum_prob
             prob = p(i+1);
             cum_prob = cum_prob + prob;         % calculate cumulative probabilities
             i = i + 1;
       end
       Y(k) = i;                               % assign each generated sample based on Inverse Transform method
       if i == 60                            % check if each sample is 60
          Q(i) = k;              % assign minimum samples to N
          break;
       end
   end
   N(a) = min(Q);
   sum2 = sum2 +N(a);
end
m= sum2/60;
disp("Obtained Mean is "+m);
mean_theoritical = 1/p(60);
disp("Theoretical mean "+mean_theoritical);
disp("Obtained variance is "+var(N));
v = (1 - p(60))/(p(60) ^ 2);
disp("Theoretical variance is " +(v/100));
subplot(2,1,2);
histogram(N(a),60);
title('The histogram for minimum number of samples to be drawn to get X = 60');
xlabel('Minimum number of samples');
ylabel('Frequency');