% for c = 1:500
rng('default');
% vector 
c = 1:1000
  % append w(0)=0
  s = rng;
  % normrnd(0,1/500)
  W = normrnd(0,0.002,[1,500]) 
  % w(0)=0
  S(c) = cumsum(W)   %S = 1000x500
  % u(0)=1
  s = rng;
  u(1:500)=exp((0.002:0.002:1)+(1/2)*W)
end

for c = 1:1000
  for t = 0:0.002:1
  % append u(0)=1
    u(t)=exp((t)+(1/2)*W)
    SS(c,:)=cumsum(u)
  end
end

cr = randi([1 1000],1,5)  %  46   724   348   661   384

plot(0.002:0.002:1,u(1:500))
0.002:0.002:1

% 2) %%%%%%%%%%%%%%%%%%%%%%%%%%%
x0 = 0.5
nPeriods =512
dt  =1.5;
rng(142857,'twister')
T = 2 - 0.5=1.5
delta.t = 1.5/512
dt=0.5:delta.t:2
rng('default');

% now simulation a trajectory

xn+1 = zeroes([1,n+1])
x1 = 0.5

for j=2:n+1
  dW = sqrt(dt)*

  xn = euler(n-1)

plot(T, S(:,:,1)), xlabel('Trading Day'), ylabel('Price')
title('First Path of Multi-Dimensional Market Model')
legend({'Canada' 'France' 'Germany' 'Japan' 'UK' 'US'},...
    'Location', 'Best')

rng ( seed )
lambda = 1;
mu = 0.6;
x0 = 0.5; % initial value
tmax = 1.5;
n = 2^9;
dt = tmax / n;
Wj = normpdf(0,dt)
dW_n+1 = symsum(dt*Wj,j,0,n)
%w = cumsum ( dw_n+1 );


xtrue = xzero * exp ( ( lambda - 0.5 * mu^2 ) + mu * w(end) );
