function [ucb] = solveoptim(i,acts,acts_val,bindex ,b, p_emp,tble,j,n,num_acts,t)

cc = size(bindex(i,1,:),3);
bindex = reshape(bindex(i,1,:),1,cc);
size_cc = diff(bindex);
q_s = size(b(i,1,:),3);

bb = reshape(b(i,j+1,:),1,q_s);

Aeq = zeros(size(size_cc,2),q_s);
index=1;
 for i =1:1:size(size_cc,2)
  Aeq( i,index:bindex(i+1) )=1;
   index = bindex(i+1)+1;
   beq(i)= 1;
 end

options = optimoptions('fmincon','Display', 'off');
q =  fmincon(@(q)expand1(bb,size_cc,bindex,q),ones(q_s,1)./q_s,[],[],Aeq,beq,zeros(q_s,1),ones(q_s,1),@(q) nonlinconstraint(acts,acts_val,b, p_emp,tble,size_cc,bindex,q,n,num_acts,t),options);

ucb = -1*expand1(bb,size_cc,bindex,q);
end