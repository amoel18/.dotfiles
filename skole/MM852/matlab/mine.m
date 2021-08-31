S0  = 100;
K   = 100;
T   = 1;
r		= 0.05

nu			= 0.04;
xi			= 0.3;		# vol of vol
mu			= 0.1;		# drift
kappa		= 1.2;		# rate of reversion to theta
theta		= 0.04;	# long variance

rho			= -0.5; ## correlation

N				= 2^11;
M				= 500;

dt			= T/N;
R				= [1; 16; 32; 64; 128]

R*dt

dW			= sqrt(dt)*randn(M,N)

Xmil		= zeros(M,5)

for p = 1:5
		Dt = R(p)*dt; L = N/R(p);
		Xtemp = ones(M,1);
		for j = 1:L
				Winc = sum(dW(:,R(p)*(j-1)+1:R(p)*j),2)
				Xtemp = Xtemp + Dt*r*Xtemp.*(K-Xtemp)
		end
		Xmil(:,p) = Xtemp;
end


