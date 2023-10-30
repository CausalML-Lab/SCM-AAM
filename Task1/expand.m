function [prod] = expand(b,size_cc,bindex,q)
prod =1;
index=1;
  for i =1:1:size(size_cc,2)
      prod = prod * (b(index:bindex(i+1))*q(index:bindex(i+1))); 
      index = bindex(i+1)+1; 
  end
 
 end
