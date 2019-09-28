%Simulating 50 flips with a fair coin
%Using simple for loop for the case
%Author: Shilpa Nanjundaiah
%USCID:7046684083
head_count = 0;
tail_count = 0;
long_run = zeros(1,200);
count = 0;
for n = 1:200   %Using for loop for generating the flips
    flip_value = rand();    %Random numver generator that generates number betweer 0&1
     if flip_value > 0.2     %Fair toss execution
         head_count = head_count + 1;%Keeping the count of heads
         count = count+1;
     else
          long_run(n)= head_count;%Recording the long run of heads
          head_count = 0;           %Setting the head count back to zero
     end
end
figure();
histogram(long_run,2);  %Histogram for the flips
xlabel("No. of heads");
ylabel("No. of flips");
title("flip case: 200");
disp(max(long_run));   %Maximum of the long run recorded
    