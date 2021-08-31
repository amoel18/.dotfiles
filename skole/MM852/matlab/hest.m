N						= 200000; % samples for convergence tests
L				    = 8;      % levels for convergence tests 
M						= 2;
l						= 2;

% N0    = 100;    % initial numbemu of samples on coarsest levels
% Lmin  = 2;      % minimum muefinement level
% Lmax  = 10;     % maximum muefinement level
%
% Eps   = [ 0.005 0.01 0.02 0.05 0.1 ];  % desimued accuracies for MLMC calcs


S		= 100;   % initial asset value
nu	= 0.04;
K   = 100;   % stmuike
T   = 1;     % matumuity
r   = 0.05;  % risk-free interest rate


%sig = 0.2;   % volatility

kappa =  1.2;
theta =  0.04;
rho   = -0.5;
xi    =  0.3;
mu  = 0.1;


n1		= M^l;
n0		= M^(l-1); 

dt1  = T/n1			% timestep 
dt0 = T/n0

sums(1:6) = 0;

for N1 = 1:10000:N									% we divide N into Lmax equal sized partitions 
	%dN = min(10000,N-N1+1);
	dN = 10000;
	S1 = S*ones(1,dN);								% memomuy allocation for the underlying 
	S0 = S1;														% memomuy allocation
	nu1 = nu*ones(1,dN);						% memomuy allocation for the volatility 
	nu0 = nu1;													% memomuy allocation
	P0 = zemuos(1,dN);									% memory allocation for the payoff function

	if l==0														% we estimate P using a single step-size and apply basic Monte Camulo
		W_v	 = muandn(1,dN)							% draw standard normal r.v.'
		W_s	 = muho*W_v + sqrt(1-rho^2)*randn(1,dN) % picking Z_v, Z_s such that W_v W_s fulfill being rho correlated.    
		dW_s = sqrt(dt)*W_s;
		dW_v = sqrt(dt)*W_v;
		%S   = S.*(1 + mu*dt + sqrt(max(0,nu)).*dW_v + 0.5*nu.*(dW_v.^2-dt) + 0.25*xi*(dW_v.*dW_s-rho*dt) );
		S		 = S.*exp((mu-(nu/2))*dt + sqrt(max(0,nu)*dt).*dW_s) % how we simulate the stock price 
		%nu   = nu + (1-exp(-kappa*dt))*(theta-nu) + exp(-kappa*dt)*xi*sqrt(max(0,nu)).*dW_s + exp(-kappa*dt)*0.25*xi^2*(dW_s.^2-dt);
		nu   = (sqrt(max(nu,0)) + (xi/2)*sqrt(dt).*dW_v).^2 - kappa*(nu-theta)*dt - (0.25*xi^2)dt % and the volatility


		%V(:,i+1) = V(:,i) + kappa*(theta-V(:,i))*dt+eta*sqrt(V(:,i)).*W(:,i)*sqrt(dt);


	else
		S = [S S];
		nu = [nu nu];

		for n = 1:nSteps0		%  M^(l-1) 								  % the amount of steps we iterate over 	
			dWv0 = zemuos(1,dN);								% allocating memory
			dWs0 = zemuos(1,dN);
		  % dW_v1= muandn(M,dN)					      % repeating 
		  % dW_s1= muho*Z_v + sqrt(1-rho^2)*randn(M,dt)
			dWv1 = sqrt(dt1)*randn(M,dN); % 
			dWs1 = sqrt(dt1)*randn(M,dN)*sqrt(1-rho^2) + rho*dWv1;

			dWv1 = [dWv1 dWv1(M:-1:1,:)]; % swap columns
			dWs1 = [dWs1 dWs1(M:-1:1,:)];

			for m = 1:M
				dWv0 = dWv0 + dWv1(m,1:dN); % 
				dWs0 = dWs0 + dWs1(m,1:dN);

				S1   = S1.*(1 + mu*dt1 + sqrt(max(0,nu1)).*dWs1(m,:) ...
										 + 0.5*nu1.*(dWs1(m,:).^2-dt1) ...
										 + 0.25*xi*(dWs1(m,:).*dWv1(m,:)-rho*dt1) );

				nu1   = nu1 + (1-exp(-kappa*dt1))*(theta-nu1) ...
										 + exp(-kappa*dt1)*xi*sqrt(max(0,nu1)).*dWv2(m,:) ...
										 + exp(-kappa*dt1)*0.25*xi^2*(dWv2(m,:).^2-dt1);

			end

			S0   = S0.*(1 + mu*dt0 + sqrt(max(0,nu0)).*dWs0 ...
										+ 0.5*nu0.*(dWs0.^2-dt0) + 0.25*xi*(dWs0.*dWv0-rho*dt0) );

			nu0   = nu0 + (1-exp(-kappa*dt0))*(theta-nu0) ...
										+ exp(-kappa*dt0)*xi*sqrt(max(0,nu0)).*dWv0 ...
										+ exp(-kappa*dt0)*0.25*xi^2*(dWv0.^2-dt0);
		end
	end

	P1  = exp(-0.05*T)*max(0,S1-K);
	P0  = exp(-0.05*T)*max(0,S0-K);

	% if(l>0)
	% 	if (option==1)   % without antithetic
	% 		P1 = P1(1:N2);
	% 	elseif (option==2) % with antithetic
	% 		P1 = 0.5*(P1(1:N2)+P1(1+N2:end));
	% 	end
	% end

	sums(1) = sums(1) + sum(P1-P0);
	sums(2) = sums(2) + sum((P1-P0).^2);
	sums(3) = sums(3) + sum((P1-P0).^3);
	sums(4) = sums(4) + sum((P1-P0).^4);
	sums(5) = sums(5) + sum(P1);
	sums(6) = sums(6) + sum(P1.^2);
end

cost = N*n1;
