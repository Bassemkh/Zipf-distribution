% This script tests and validate the zipf distribution function.
clear; clc; close all;
m=10;
alpha=1.5;
n=1e5;
occurance=zeros(1,m);
sample=zipfrnd( alpha,m,n );
for i=1:length(sample) 
    occurance(sample(i))=occurance(sample(i))+1;
end
occurance=occurance/length(sample);

Prob=zeros(1,m);
for idx=1:m
    Prob(idx)=(1/idx)^alpha;
end
Prob=Prob/sum(Prob);
bar([Prob' ,occurance'])
legend('real','esti')
