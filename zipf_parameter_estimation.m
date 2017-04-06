% The zipf distribution parameter estiation using Maximum Likelihood
clear; clc; close all;
eps=1e-2;
iterMax=1e2;
alpha=1.5;
n=2e3;
m=10;
samples=zipfrnd( alpha,m,n );

for i=1:n
    X=samples(1:i);
    s_min=0;
    s_max=3;
    
    f=@(s)(n*sum(((1:m).^(-s)).*log(1:m)) / (sum((1:m).^(-s)))-sum(log(X)));
    iter=0;
    
    while abs(s_max-s_min)>abs(s_max-s_min)*eps && iter<iterMax
        iter=iter+1;
        s_m=(s_max+s_min)/2;
        if f(s_m)*f(s_min)<=0
            s_max=s_m;
        else
            s_min=s_m;
        end
    end
    alpha_est=s_m;
    error(i)=abs(alpha-alpha_est);
end
figure; 
plot(error);
