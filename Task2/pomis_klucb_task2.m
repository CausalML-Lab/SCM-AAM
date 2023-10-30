function [reward] = pomis_klucb_task2(iter,Horizon)
clc
warning off

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

for i =1:1:num_acts
[V y] = task2(Acts(i,:),Acts_val(i,:));
count_acts(i) =  count_acts(i) +1;
sums(i) = sums(i) +y;
means_acts(i) = sums(i)/count_acts(i);
reward(indexxx,i) = double(y);
end


for t = num_acts +1 :1 : Horizon
   
    for i =1:1:num_acts
         UCB(i) = optimsolve(means_acts(i),t,count_acts(i));
    end

  

[xx i] = max(UCB);   
[V y] = task2(Acts(i,:),Acts_val(i,:));
count_acts(i) =  count_acts(i) +1;
sums(i) = sums(i) +y;
means_acts(i) = sums(i)/count_acts(i);
reward(indexxx,t) = double(y);
count_acts;
UCB;
end
end


end