function [Cindex,Final] = encode_q(V,I)
A =[0 1 0; 0 0 1;  0 0 0];
C =[1 0 0 ; 0 1 1];
Cindex = zeros(1,size(C,1)+1);
Final =[];

for i =1:1:size(C,1)
 X = find(C(i,:)==1);
 tmp_index = cumsum([ 0 2.^(sum(A(:,X),1))]);
 Final = [Final zeros(1,2^sum(2.^(sum(A(:,X),1))))]; 
 Cindex(i+1) = Cindex(i) +  2^sum(2.^(sum(A(:,X),1)));
 bts = sum(2.^(sum(A(:,X),1)));
 tmp = decimalToBinaryVector(0:2^sum(2.^(sum(A(:,X),1)))-1,bts);
 for j =1:1:size(X,2)
    if (I(X(j))==1) continue;  end
    Pj = find(A(:,X(j)) == 1);
    PjV = 0;
    if (~isempty(Pj)) PjV = V(Pj); end
    tmp(:,binaryVectorToDecimal(PjV) + 1 + tmp_index(j)) = V(X(j));
 end
tmp = unique(tmp,'rows');

Indx =  binaryVectorToDecimal(tmp)';
Final(Cindex(i)+Indx+1) = 1;
end


end