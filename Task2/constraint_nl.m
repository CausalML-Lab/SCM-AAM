function [c,ceq] = constraint_nl(m,mhat,t,ct)
if(mhat == 0) mhat = 1e-10; end
if(mhat == 1) mhat = 1-1e-10; end
c = mhat*log(mhat/m) + (1-mhat)*log((1-mhat)/(1-m)) - log(1+t*log(t)^2)/ct;
ceq =[];
end