function [reward] = SCM_AAM_task3(iter,Horizon)
warning off

for indexxx = 1:1:iter
indexxx;
 n = 7;
Nc=0;
POMIS =[1     0     0     1     0     1     0     
     
     0     0     0     0     1     1     0     
];
Acts = [];
Acts_val =[];
for j =1:1:size(POMIS,1)
cnt = sum(POMIS(j,:));
Acts = [Acts ;repmat(POMIS(j,:),2^cnt,1) ];
tmp = decimalToBinaryVector(0:2^(cnt)-1);
index = find(POMIS(j,:)==1);
tmp1 = zeros(2^cnt,n);
tmp1(:,index) = tmp;
Acts_val = [Acts_val ; tmp1];

end
 
num_acts = size(Acts,1);
Tble = zeros(num_acts,2^n);
P_emp = zeros(num_acts,2^n);
sums = zeros(num_acts);
count_acts = zeros(1,num_acts);
means_acts = zeros(1,num_acts);

for j =1:1:2*num_acts
    i=j;
    while(i>num_acts)
        i = i -num_acts;
    end
    
[V y] = task3(Acts(i,:),Acts_val(i,:));
Tble(i,V+1) = Tble(i,V+1) +1; 
count_acts(i) =  count_acts(i) +1;
P_emp(i,V+1)  =  Tble(i,V+1)/ count_acts(i);
sums(i) = sums(i) +y;
means_acts(i) = sums(i)/count_acts(i);
reward(indexxx,i) = double(y);
end

for i =1:1:num_acts
  for j = 0:1:2^(n)-1
      V = decimalToBinaryVector(j,n);
     ii =i;
      index = find(Acts(ii,:)==1);
      V(index) =   Acts_val(ii,index); 
        [ bindex(ii,j+1,:) b(ii,j+1,:) ] = encode_q(V,Acts(ii,:));
  end
end
warning('off','all')
parfevalOnAll(@warning,0,'off','all');
t  = 2*num_acts
for ccc = 2*num_acts :5 : Horizon
   
   [indexxx t];
   [ uopt aopt ] = max(means_acts);
   ucb = zeros(1,num_acts);
   parfor i =1:1:num_acts
   for j = 0:1:2^n-1
      V = decimalToBinaryVector(j,n);
      if (V(n) > 0 && sum(Acts(i,:).*(Acts_val(i,:) ~= V)) == 0 )
      ucb(i) = ucb(i) + V(n)*solveoptim(i,Acts,Acts_val,bindex ,b, P_emp,Tble,j,n,num_acts,t);
      end
   end
  end
for ccc2 = 1:1:5    
if (uopt > max(ucb) ) armch = aopt;
else 
    if (min(count_acts) < 1/40 * Nc)
       [ttt armch] = min(count_acts);   
       Nc = Nc+1;

    else 
         [ttt armch] = max(ucb);
         Nc = Nc+1;   
    end

end

 i = armch;   
[V y] = task3(Acts(i,:),Acts_val(i,:));
Tble(i,V+1) = Tble(i,V+1) +1; 
count_acts(i) =  count_acts(i) +1;
P_emp(i,V+1)  =  Tble(i,V+1)/ count_acts(i);
sums(i) = sums(i) +y;
means_acts(i) = sums(i)/count_acts(i);
reward(indexxx,t) = double(y);
count_acts;
ucb;
t = t +1;
end

  end
end


end