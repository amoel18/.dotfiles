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



M  = 2;
l  = 1
nf = M^l;
nc = nf/M;

hf = T/nf;
hc = T/nc;

sum1(1:4) = 0;
sum2(1:2) = 0;

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

  sum1(1) = sum1(1) + sum(Pf-Pc);
  sum1(2) = sum1(2) + sum((Pf-Pc).^2);
  sum1(3) = sum1(3) + sum((Pf-Pc).^3);
  sum1(4) = sum1(4) + sum((Pf-Pc).^4);
  sum2(1) = sum2(1) + sum(Pf);
  sum2(2) = sum2(2) + sum(Pf.^2);
end
