function [reward] = TS_task2(iter,Horizon)
for indexxx = 1:1:iter
    indexxx
n = 5;
Nc=0;
 POMIS =[1 0 0 0 0; 0 0 1 0 0; 0 0 1 1 0];
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



success = zeros(1,num_acts);

Fails = zeros(1,num_acts);





for t = 1  :1 :  Horizon
  
    for i = 1:1:num_acts
          s(i) = betarnd(success(i)+1,Fails(i)+1);
    end
[tmp armch] = max(s);

 i = armch;   
[V y] = task2(Acts(i,:),Acts_val(i,:));

count_acts(i) =  count_acts(i) +1;
sums(i) = sums(i) +y;
means_acts(i) = sums(i)/count_acts(i);
reward(indexxx,t) = double(y);
success(i) = success(i) + y;
Fails(i) = Fails(i) + (1-y);


count_acts;
end

end


end