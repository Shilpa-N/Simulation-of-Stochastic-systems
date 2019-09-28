%Produce a sequence by drawing samples from a standard uniform random variable.
%Calculating the co variance of the sequence
%Shilpa Nanjundaiah
%7046684083
samples = 10000;
x = rand(1, samples);
x1 = circshift(x,[2 1]);
x1(1,1)=0;
CV = cov(x,x1);
disp("Covariance of two sequence is: "+CV);
x_1=x([2:end 1]);
x_1(1,end) = 0;
x_2=x([3:end 1:2]);
x_2(1,end-1:end) = 0;
x_3=x([4:end 1:3]);
x_3(1,end-2:end) = 0;
y = x-2*x_1+0.5*x_2-x_3;
Covariance = cov(x,y);
disp("Covariance of two sequence: "+Covariance);
