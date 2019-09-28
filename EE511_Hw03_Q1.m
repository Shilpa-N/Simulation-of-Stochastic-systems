% Name : Shilpa Nanjundaiah
% USC ID : 7046684983
% EE 511 : Project #3 - Samples and Statistics
% Question 1 : A components manufacturer delivers a batch of 125 microchips to a parts distributor.  The distributor checks 
% for lot conformance by counting the number of defective chips in a random sampling (without replacement) 
% of the lot.  If the distributor finds any defective chips in the sample it rejects the entire lot.  Suppose that there 
% are six defective units in the lot of 125 microchips.  Simulate the lot sampling to estimate the probability that 
% the distributor will reject the lot if it tests five microchips.  What is the fewest number of microchips that the 
% distributor should test to reject this lot 95% of the time? 

trials = 100;
chips_picked = 5;                                     % No of microchips picked
reject_count = 0;
for i=1:1:trials
    chips_chosen = randi(125,1,chips_picked);         % Choose microchips randomly between 1 and 125
    for j = 1:1:chips_picked
        if chips_chosen(j) < 7                              % Assuming samples 1 to 6 are defective
            reject_count = reject_count + 1;                % No of times the lot is rejected
            break;
        end
        
    end
end
reject_prob = reject_count/trials;                 % Calculate P[rejection]
disp("The number of trials are "+trials);
%disp("The number of microchips chosen "+ chips_chosen);
disp("The number of times the lot has been rejected "+ reject_count);
disp("The probability of rejection "+ reject_prob);
