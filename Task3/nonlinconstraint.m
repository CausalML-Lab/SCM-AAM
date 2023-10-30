function [c ceq] = nonlinconstraint(acts,acts_val,b, p_emp,tble,size_cc,bindex,q,n,num_acts,t)
sum =0;
q_s = size(b(1,1,:),3);

for i =1:1:num_acts
  for j = 0:1:2^(n)-1
   bb = reshape(b(i,j+1,:),1,q_s);
   if (tble(i,j+1) == 0) continue; end
   sum = sum + tble(i,j+1)*log(p_emp(i,j+1)/(expand(bb,size_cc,bindex,q)));
      
  end
end

c(1) =  sum - (1+0.1)*log(t);
ceq =[];
end