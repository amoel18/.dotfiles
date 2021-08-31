%
% This tests the use of multilevel Monte Carlo for a European call 
% based on a Milstein numerical approximation of the Heston SDE,
% with and without the use of antithetic variables
%

function antithetic

close all; clear all;

%
% MLMC treatment
%

addpath('..');

nvert = 3;      % plotting option (1 for slides, 2 for papers, 3 for full set)

N     = 200000; % samples for convergence tests
L     = 8;      % levels for convergence tests 

N0    = 100;    % initial number of samples on coarsest levels
Lmin  = 2;      % minimum refinement level
Lmax  = 10;     % maximum refinement level

Eps   = [ 0.005 0.01 0.02 0.05 0.1 ];  % desired accuracies for MLMC calcs

for option = 1:2
	if option==1
		filename = 'heston_no_antithetic';
	else
		filename = 'heston_antithetic';
	end

	fp       = fopen([filename '.txt'],'w');
	mlmc_test(@gbm_l, N,L, N0,Eps,Lmin,Lmax, fp, option);
	fclose(fp);
	
	nvert = 3;
	mlmc_plot(filename, nvert);

	if(nvert==1)
		figure(1)
		print('-deps2',[filename 'a.eps'])
		figure(2)
		print('-deps2',[filename 'b.eps'])
	else
		print('-deps2',[filename '.eps'])
	end
end

%-------------------------------------------------------
%
% level l estimator for GBM with factor 2 refinement
%

function [sums cost] = gbm_l(l,N, option)

S0  = 100;   % initial asset value
K   = 100;   % strike
T   = 1;     % maturity
r   = 0.05;  % risk-free interest rate
sig = 0.2;   % volatility

kappa =  2;
theta =  0.04;
rho   = -0.5;
xi    =  0.25;

M  = 2;
l  = 0;
nf = M^l;
nc = nf/M;

hf = T/nf;
hc = T/nc;

sums(1:6) = 0;

for N1 = 1:10000:N
	N2 = min(10000,N-N1+1);
	Sf = S0*ones(1,N2);
	Sc = Sf;
	vf = theta*ones(1,N2);
	vc = vf;
	Pc = zeros(1,N2);

	if l==0
		dWf1 = sqrt(hf)*randn(1,N2);
		dWf2 = sqrt(hf)*randn(1,N2)*sqrt(1-rho^2) + rho*dWf1;
		Sf   = Sf.*(1 + r*hf + sqrt(max(0,vf)).*dWf1 ...
									+ 0.5*vf.*(dWf1.^2-hf) + 0.25*xi*(dWf1.*dWf2-rho*hf) );
		vf   = vf + (1-exp(-kappa*hf))*(theta-vf) ...
								 + exp(-kappa*hf)*xi*sqrt(max(0,vf)).*dWf2 ...
								 + exp(-kappa*hf)*0.25*xi^2*(dWf2.^2-hf);
	else
		Sf = [Sf Sf];
		vf = [vf vf];

		for n = 1:nc
			dWc1 = zeros(1,N2);
			dWc2 = zeros(1,N2);

			dWf1 = sqrt(hf)*randn(M,N2);
			dWf2 = sqrt(hf)*randn(M,N2)*sqrt(1-rho^2) + rho*dWf1;

			dWf1 = [dWf1 dWf1(M:-1:1,:)];
			dWf2 = [dWf2 dWf2(M:-1:1,:)];

			for m = 1:M
				dWc1 = dWc1 + dWf1(m,1:N2);
				dWc2 = dWc2 + dWf2(m,1:N2);

				Sf   = Sf.*(1 + r*hf + sqrt(max(0,vf)).*dWf1(m,:) ...
										 + 0.5*vf.*(dWf1(m,:).^2-hf) ...
										 + 0.25*xi*(dWf1(m,:).*dWf2(m,:)-rho*hf) );
				vf   = vf + (1-exp(-kappa*hf))*(theta-vf) ...
										 + exp(-kappa*hf)*xi*sqrt(max(0,vf)).*dWf2(m,:) ...
										 + exp(-kappa*hf)*0.25*xi^2*(dWf2(m,:).^2-hf);
			end

			Sc   = Sc.*(1 + r*hc + sqrt(max(0,vc)).*dWc1 ...
										+ 0.5*vc.*(dWc1.^2-hc) + 0.25*xi*(dWc1.*dWc2-rho*hc) );
			vc   = vc + (1-exp(-kappa*hc))*(theta-vc) ...
										+ exp(-kappa*hc)*xi*sqrt(max(0,vc)).*dWc2 ...
										+ exp(-kappa*hc)*0.25*xi^2*(dWc2.^2-hc);
		end
	end

	Pf  = exp(-r*T)*max(0,Sf-K);
	Pc  = exp(-r*T)*max(0,Sc-K);

	if(l>0)
		if (option==1)
			Pf = Pf(1:N2);
		elseif (option==2)
			Pf = 0.5*(Pf(1:N2)+Pf(1+N2:end));
		end
	end

	sums(1) = sums(1) + sum(Pf-Pc);
	sums(2) = sums(2) + sum((Pf-Pc).^2);
	sums(3) = sums(3) + sum((Pf-Pc).^3);
	sums(4) = sums(4) + sum((Pf-Pc).^4);
	sums(5) = sums(5) + sum(Pf);
	sums(6) = sums(6) + sum(Pf.^2);
end

cost = N*nf;
