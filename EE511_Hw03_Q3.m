trials = [100, 1000,1000];                                              % maximum number of random numbers to get sum > 4
min_sample=zeros(3,1);
N = zeros(50,1);
sum = 0;
for k =1:3
    q=trials(k);
    for i=1:1:q                                % find min no of samples to get sum > 4 in 100 trials
        for j=1:50
           X = rand(1);                          % generate uniform random number[0,1]
           sum = sum + X;
           if sum > 4  
               sum=0;
               N(i)=j;                          % to check if sum > 4
           end
        end
    end
    min_sample(k)=min(N);
    E=mean(N);   
    disp("Expectation of N for "+trials(k)+" samples, E[N] is "+E);
    figure(1);
    subplot(3,1,k);
    histogram(N);
    title(['The histogram for ',(trials(k)), ' trials']);
    xlabel('Minimum samples');
    ylabel('Frequency');% no of samples for sum to exceed 4
    hold on
    N=0;
end

