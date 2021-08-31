functinon [call_prices, std_errs] = Heston(S0, r, V0, eta, theta, kappa, strike, T, M, n)

V = [V0*ones(M,1), zeros(M,N)];
Vneg = [V0*ones(M,1), zeros(M,N)];


dt = T/N;


for i = 1:N

    V(:,i+1) = V(:,i) + kappa*(theta-V(:,i))*dt+eta*sqrt(V(:,i)).*W(:,i)*sqrt(dt);
    V(:,i+1) = V(:,i+1).*(V(:,i+1)>0);
        
        Vneg(:,i+1) = Vneg(:,i)+kappa*(theta-Vneg(:,i))*dt - eta*sqrt(Vneg(:,i)).*W(:,i)*sqrt(dt);
        Vneg(:,i+1) = Vneg(:,i+1).*(Vneg(:,i+1)>0);
end


ImpVol = sqrt((1/2*V(:,1) + 1/2*V(:,end) + sum(V(:,2:end-1),2))*dt/T); 

ImpVolneg = sqrt((1/2*Vneg(:,1) + 1/2*Vneg(:,end) + sum(Vneg(:,2:end-1),2))*dt/T);



std_errs = nan(length(strike),1);  % Memory allocation

call_prices = nan(length(strike),1);

for j=1:length(strike)
    
    % Antithetic variates
    Sample = (BS(S0,0,strike(j),T,r,r,ImpVol) + BS(S0,0,strike(j),T,r,r,ImpVolneg))/2;
    
    % Standard deviation of the error
    std_errs(j) = std(Sample)/sqrt(M);
    
    call_prices(j) = mean(Sample);
    
end



