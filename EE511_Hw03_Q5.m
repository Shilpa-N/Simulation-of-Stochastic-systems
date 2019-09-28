% Name : Shilpa Nanjundaiah
% USC ID : 7046684083
% EE 511 : Project #3 - Samples and Statistics
% Question 5 : Use the accept?reject method to sample from the following distribution pj by sampling from the (non?optimal) 
% uniform auxiliary distribution (qj = 0.05 for j=1,...,20):
%           p1=p2=p3=p4=p5=0.06, p6=p9=0.15, p7=p10=0.13, p8=0.14

% Generate a histogram and overlay the target distribution pj. Compute the sample mean and sample variance 
% and compare these values to the theoretical values.  Estimate the efficiency of your sampler with the following 
% ratio: 
%           Efficiency = #accepted/(#accepted + #rejected) 
% Compare your estimate of the efficiency to the theoretical efficiency given your choice for the constant c 

m = 10;                                                 % no of samples in target dist
n = 20;                                                 % no of samples in auxillary dist
N = m*n;
q = zeros(20,1);
for i=1:20                                            % pmf of auxillary dist
    q(i) = 0.05;
end
p = [0.06, 0.06, 0.06, 0.06, 0.06, 0.15, 0.13, 0.14, 0.15, 0.13];                      
 
c = 3;                                         % constant c: p(j) <= cq(j)
C = zeros(N,1);
X = zeros(N,1);
 
for i=1:1:N
    k = 0;
    while(1)
        k = k + 1;
        Y = randi(20);           % generate random integer between 1 and 20
        u = rand;
        if c*u < p(int(Y))/q(int(Y))        % check if sample belongs to target dist or not
            X(i) = Y;                                   % accept sample if it belongs to target dist
            C(i) = k;                                   % variable used to calculate efficiency
            break;
        end
    end
end
 
mean_X = mean(X);   
for u=1:20
   mean_X_th = sum(p(u)); 
end                                               % theoretical calculations for mean for sequence X
var_X = var(X);                                         % calculate variance for sequence X
s = 0;
for i=1:10                                            % theoretical calculations for variance for sequence X
    s = s + (i-mean_X_th)^2;
end
var_X_th = s/10;
mean_C = mean(C);
diff = abs(c-mean_C);                                   % calculate efficiency
eff = diff * 100;
P_acceptance = 1/c;                                     % probability of acceptance
P_rejection = 1 - P_acceptance;
eff_theoretical = P_acceptance * 100;                   % theoretical calculations for efficiency
 
figure(1);
x1 = 1:1:10;
y1 = histogram(X);
x2 = 1:1:20;
y2 = p;
plot(x1,y1,x2,y2,'bar','stem');
title('Overlay of histogram for X and target distribution pj');
xlabel('Samples');
ylabel('Frequency / Probability');
 
disp('Mean of X');
disp(mean_X);
disp('Theoritical Mean of X');
disp(mean_X_th);
disp('Variance of X');
disp(var_X);
disp('Theoretical Variance of X');
disp(var_X_th);
disp('Mean of C');
disp(mean_C);
disp('Efficiency');
disp(eff);
disp('Theoretical Efficiency');
disp(eff_theoretical);


